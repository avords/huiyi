package com.mvc.member.service;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.HYConstants;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.member.model.Company;
import com.mvc.member.model.History;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.model.Sku;
import com.mvc.search.model.Page;
import com.mvc.util.HtmlparserUtils;

@Service
public class CompanyManager extends BaseService<Company, Long>{
	private static final Logger LOGGER = Logger.getLogger(CompanyManager.class);
	
	public void saveCompany(Company t) {
		if (t.getObjectId()==null) {
			t.setRegisterWay(Company.COMPANY_REGISTERWAY_BACKGROUND);
			t.setIsCheck(Company.COMMON_PARAMETER_FALSE);
			t.setIsAllow(Company.COMMON_PARAMETER_FALSE);
			t.setRegisterDate(new Date());
			t.setLevel(Company.COMPANY_MEMBER_LEVEL1);
		}else{
			t.setUpdateDate(new Date());
		}
		t.setHasChinese(t.hasChinese());
		t.setHasEnglish(t.hasEnglish());
		
		if (t.getStatus()==null) {
			t.setStatus(Company.COMPANY_STATUS_DRAFT);
		}else if (t.getStatus()>2) {
			t.setStatus(Company.COMPANY_STATUS_WAIT_CHECK);
		}		
		super.save(t);
	}

	public void executeAudit(Long objectId,int status) {
        String hql = "update "+Company.class.getName()+" set status=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, status);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
	
	//搜索供应商
	public List<Company> getCompany(String keyword){
		List<Company> companys=null;
		String hql = "select A from "+Company.class.getName()+" A where 1=1";
		companys=searchBySql(hql,keyword);
		return companys;
	}

	//获取企业下属产品的一级分类
	public List<Category> getProductFirstCategoriesBycompanyId(Long id) {
		String hql = "SELECT A FROM "+Category.class.getName()+" A WHERE A.objectId IN "
				+"(SELECT DISTINCT B.parentId FROM "+Category.class.getName()+" B WHERE B.objectId IN "
				+"(SELECT DISTINCT C.categoryId FROM "+Product.class.getName()+" C WHERE C.supplierId=? AND (SELECT COUNT(D) FROM "+Sku.class.getName()+" D WHERE D.productId=C.objectId AND D.status=?)>0 ) "
				+" AND B.layer=2 AND B.status=?)"
				+"AND A.layer=1 AND A.status=?"; 
		Query query = getSession().createQuery(hql);
		query.setParameter(0, id);
		query.setParameter(1, Sku.PRODUCT_STATUS_IN_SALE);
		query.setParameter(2, HYConstants.STATUS_YES);
		query.setParameter(3, HYConstants.STATUS_YES);
		return query.list();
	}
	
	public List<Company> searchSellers(String keyword,Long memberId){
		 String sql = "SELECT C FROM " + Company.class.getName() + " C," + History.class.getName()
	                + " D WHERE D.companyId="+memberId+" and D.entityId=C.objectId and D.isDelete=1";
		if(StringUtils.isNotEmpty(keyword)){
			sql=sql+" AND C.nameZh LIKE '%"+keyword+"%' order by D.visitDate asc";
		} 
		return searchBySql(sql);
	}
	
	@Transactional
    public String importCompany(byte[] fileData) {
        StringBuilder message = new StringBuilder();
        StringBuilder error = new StringBuilder();
        int sucessed = 0;
        int empty = 0;
        HSSFWorkbook workbook;
        try {
            workbook = new HSSFWorkbook(new ByteArrayInputStream(fileData));
            HSSFSheet sheet = workbook.getSheetAt(0);
            for (int rowNum = 2; rowNum <= sheet.getLastRowNum(); rowNum++) {
                HSSFRow row = sheet.getRow(rowNum);
                if (row == null) {
                    empty++;
                    continue;
                }
                //导入
                String nameZh = getStringCellValue(row.getCell(0));
                nameZh = nameZh==null?"":nameZh;
                String addressZh = getStringCellValue(row.getCell(1));
                addressZh = addressZh==null?"":addressZh;
                String nameEn = getStringCellValue(row.getCell(2));
                nameEn = nameEn==null?"":nameEn;
                if(StringUtils.isBlank(nameZh)&&StringUtils.isBlank(nameEn)){
                    empty++;
                    continue;
                }
                String addressEn = getStringCellValue(row.getCell(3));
                addressEn = addressEn==null?"":addressEn;
                Integer isSupplier=0;
                try{
                	isSupplier=Integer.valueOf(getStringCellValue(row.getCell(4)));
                }catch(Exception e){
                	error.append(rowNum+1).append(",");
                	continue;
                }
                String email = getStringCellValue(row.getCell(5));
                email = email==null?"":email;
                String phoneAreaCode = getStringCellValue(row.getCell(6));
                phoneAreaCode = phoneAreaCode==null?"":phoneAreaCode;
                String phone = getStringCellValue(row.getCell(7));
                phone = phone==null?"":phone;
                String faxAreaCode = getStringCellValue(row.getCell(8));
                faxAreaCode = faxAreaCode==null?"":faxAreaCode;
                String fax = getStringCellValue(row.getCell(9));
                fax = fax==null?"":fax;
                
                Company company = new Company();
                company.setMainProductsZh("待完善内容");
                company.setMainProductsEn("待完善内容");
                company.setDescriptionEn("待完善内容");
                company.setDescriptionZh("待完善内容");
                company.setCountryId(-1L);
                company.setRegisterWay(Company.COMPANY_REGISTERWAY_BACKGROUND);
                company.setIsCheck(Company.COMMON_PARAMETER_FALSE);
    			company.setIsAllow(Company.COMMON_PARAMETER_FALSE);
    			company.setRegisterDate(new Date());
    			company.setLevel(Company.COMPANY_MEMBER_LEVEL1);
    			company.setStatus(Company.COMPANY_STATUS_DRAFT);

                company.setNameZh(nameZh);
                company.setAddressZh(addressZh);
                company.setNameEn(nameEn);
                company.setAddressEn(addressEn);
                company.setIsSupplier(isSupplier);
                company.setEmail(email);
                company.setPhoneAreaCode(phoneAreaCode);
                company.setPhone(phone);
                company.setFaxAreaCode(faxAreaCode);
                company.setFax(fax);
                company.setHasChinese(company.hasChinese());
                company.setHasEnglish(company.hasEnglish());
                try{
                    super.save(company);
                    sucessed++;
                }catch(Exception e){
                    LOGGER.error(e);
                }
            }
            message.append("成功导入").append(sucessed).append("条记录,");
            message.append("共").append(sheet.getLastRowNum()+1 - empty - sucessed - 2)
                    .append("行数据异常!");
            if (error.length()>0) {
            	message.append("异常数据行数为：").append(error);
			}
        } catch (IOException e) {
        }
        return message.toString();
    }
	
	//得到审核通过的企业
	 public List<Company> getPassCompany() {
		 String sql = "select A from " + getActualArgumentType().getName() + " A where A.status= " +3;
	        return searchBySql(sql);
	    }
	
	private String getStringCellValue(HSSFCell cell) {
        String result = new String();
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_NUMERIC:// 数字类型
            if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                Date date = cell.getDateCellValue();
                result = sdf.format(date);
            } else if (cell.getCellStyle().getDataFormat() == 58) {
                // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                double value = cell.getNumericCellValue();
                Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
                result = sdf.format(date);
            } else {
                double value = cell.getNumericCellValue();
                CellStyle style = cell.getCellStyle();
                DecimalFormat format = new DecimalFormat();
                String temp = style.getDataFormatString();
                // 单元格设置成常规
                if (temp.equals("General")) {
                    format.applyPattern("#");
                }
                result = format.format(value);
            }
            break;
        case HSSFCell.CELL_TYPE_STRING:// String类型
            result = cell.getRichStringCellValue().toString();
            break;
        case HSSFCell.CELL_TYPE_BLANK:
            result = "";
            break;
        default:
            result = "";
            break;
        }
        return result;
    }
	
	
	public void getTxtFromDesc(Company company,HttpServletRequest request){
		//获取企业详情的纯文本
		String language = LocaleUtils.getLocale(request).getLanguage();
		try {
			if (language.equals("zh")) {
				company.setTxtDescription(HtmlparserUtils.extractText(company.getDescriptionZh()));
			}else if (language.equals("en")) {
				company.setTxtDescription(HtmlparserUtils.extractText(company.getDescriptionEn()));
			}
				
		} catch (Exception e) {
			company.setTxtDescription(null);
		}
	}
	
	public List<Long> getCompanyIdsByName(String companyName){
		 String sql = "SELECT C FROM " + Company.class.getName()+" C " ;
		if(StringUtils.isNotEmpty(companyName)){
			sql=sql+" where C.nameZh LIKE '%"+companyName+"%' ";
		} 
		List<Company> companys = searchBySql(sql);
		List<Long> ids = new ArrayList<>();
		for(Company company:companys){
			ids.add(company.getObjectId());
		}
		return ids;
	}
	//询盘列表上方checkbox组合查询过滤出符合条件的companyId
	public List<Long> getCompanyIdsByCondition(HttpServletRequest request){
		List<Long> ids = new ArrayList<>();
		String table1 = "";
		String table2 = "";
		String condition1 = "";
		String condition2 = "";
		String[] company_types  = request.getParameterValues("company_type");
		if(company_types!=null){
			company_types = removeSpace(company_types);
			request.setAttribute("company_types", company_types);
			table1 = ",t_business_type B";
			String typeStr = "";
			for(String company_type : company_types){
				if(StringUtils.isBlank(typeStr)){
					typeStr += company_type;
				}else{
					typeStr += ","+company_type;
				}
			}
			condition1 = " AND A.object_id = B.company_id AND B.type in("+typeStr+")";
		}
		String[] certificas  = request.getParameterValues("quality_certifica");
		if(certificas!=null){
			certificas = removeSpace(certificas);
			request.setAttribute("certificas", certificas);
			table2 = ",t_company_certificate C ";
			String typeStr = "";
			for(String certifica : certificas){
				if(StringUtils.isBlank(typeStr)){
					typeStr += certifica;
				}else{
					typeStr += ","+certifica;
				}
			}
			condition2 = " AND A.object_id = C.company_id AND C.type in("+typeStr+")";
		}
		String sql = "SELECT DISTINCT(A.object_id) FROM t_company A"+table1+table2+" where 1=1"+condition1+condition2;;
		
		String[] countrys  = request.getParameterValues("country");
		if(countrys!=null){
			countrys = removeSpace(countrys);
			request.setAttribute("countrys", countrys);
			String countryIds = "";
			for(String countryId : countrys){
				if(StringUtils.isBlank(countryIds)){
					countryIds += countryId;
				}else{
					countryIds += ","+countryId;
				}
			}
			sql += " AND A.country_id in ("+countryIds+")";
		}
		String[] member_levels  = request.getParameterValues("member_level");
		if(member_levels!=null){
			member_levels = removeSpace(member_levels);
			request.setAttribute("member_levels", member_levels);
			String levels = "";
			for(String level : member_levels){
				if(StringUtils.isBlank(levels)){
					levels += level;
				}else{
					levels += ","+level;
				}
			}
			sql += " and A.level in ("+levels+")";
		}
		String is_check_factory = request.getParameter("is_check_factory");
		if(StringUtils.isNotBlank(is_check_factory)){
			sql += " and A.is_check="+Integer.parseInt(is_check_factory);
			request.setAttribute("is_check_factory", is_check_factory);
		}else{
			sql += " and A.is_check=0";
		}
		String is_allow = request.getParameter("is_check_factory");
		if(StringUtils.isNotBlank(is_allow)){
			sql += " and A.is_allow="+Integer.parseInt(is_allow);
			request.setAttribute("is_allow", is_allow);
		}else{
			sql += " and A.is_allow=0";
		}
		SQLQuery query = getSession().createSQLQuery(sql);
		List<BigInteger> list = query.list();
		for(BigInteger id:list){
			ids.add(id.longValue());
		}
		String urlParams = createStaticQueryUrlParam(request);
		request.setAttribute("urlParams", urlParams);
		return ids;
	}
	
	 private String[] removeSpace(String[] arry){
	    String[] a = new String[0];
	    if(arry==null){
	       return a;
	     }
	    for(int i=0;i<arry.length;i++){
	    	if(StringUtils.isNotBlank(arry[i])){
	            a= Arrays.copyOf(a, a.length+1);
	            a[a.length-1] = arry[i];
	         }
	    }
	    return a;
	 }
	 
	 private String createStaticQueryUrlParam(HttpServletRequest request){
	        //得到checkbox值
		 	String[] countrys = request.getParameterValues("country");
	        String[] memberLevel = request.getParameterValues("member_level");
	        String isCheckFactory = request.getParameter("is_check_factory");
	        String isAllow = request.getParameter("is_allow");
	        String[] qualityCertifica = request.getParameterValues("quality_certifica");
	        String[] companyType = request.getParameterValues("company_type");
	        StringBuilder strB = new StringBuilder("");
	        strB.append("is_allow="+(isAllow==null?"":isAllow)).append("&is_check_factory="+(isCheckFactory==null?"":isCheckFactory));
	        if(memberLevel!=null){
	            for(String i:memberLevel){
	                strB.append("&member_level="+i);
	            }
	        }
	        if(qualityCertifica!=null){
	            for(String i:qualityCertifica){
	                strB.append("&quality_certifica="+i);
	            }
	        }
	        if(companyType!=null){
	            for(String i:companyType){
	                strB.append("&company_type="+i);
	            }
	        }
	        if(countrys!=null){
	            for(String i:countrys){
	                strB.append("&country="+i);
	            }
	        }
	        return strB.toString();
	    }
}
