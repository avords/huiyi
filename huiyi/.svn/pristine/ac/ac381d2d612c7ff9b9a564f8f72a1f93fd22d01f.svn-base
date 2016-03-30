package com.mvc.business.service;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SQLQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.HYConstants;
import com.mvc.business.model.Inquiry;
import com.mvc.business.model.InquiryItem;
import com.mvc.framework.dao.HibernateWebUtils;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;
import com.mvc.member.model.Company;
import com.mvc.member.model.Member;
import com.mvc.member.service.CompanyManager;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;
import com.mvc.search.util.I18NUtils;

@Service
public class InquiryManager extends BaseService<Inquiry, Serializable>{
	@Autowired
	private InquiryItemManager inquiryItemManager ;
	@Autowired
	private ProductManager productManager;
	@Autowired
	private CompanyManager companyManager;
	
	public String saveInquiryInfo(HttpServletRequest request){
		String message = "";
		String[] productNames= request.getParameterValues("productName");
		String[] descriptions= request.getParameterValues("description");
		String[] categoryIds= request.getParameterValues("categoryId");
		String[] secondCategoryIds= request.getParameterValues("secondCategoryId");
		String productIdStr= request.getParameter("productId");
		String[] quantitys= request.getParameterValues("quantity");
		String[] units= request.getParameterValues("unit");
		//设置过期时间7天
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(calendar.DATE, 7);
		date = calendar.getTime();
		Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
		if(member.getCompanyId()==null){
			 message = I18NUtils.transformName("请先维护企业信息", "Please first maintain enterprise information", request.getLocale());;
			 return message;
		}else{
			Company company = companyManager.getByObjectId(member.getCompanyId());
			if(company.getStatus()!=Company.COMPANY_STATUS_PASSED){
				message = I18NUtils.transformName("企业不在审核通过状态", "Enterprises are not audited by the state", request.getLocale());;
				return message;
			}else{
				for(int i = 0;i<productNames.length;i++){
					Inquiry inquiry = new Inquiry();
					inquiry.setProductName(productNames[i]);
					inquiry.setDescription(descriptions[i]);
					inquiry.setFromCompanyId(member.getCompanyId());
					inquiry.setMemberId(member.getObjectId());
					inquiry.setCatogoryId(Long.parseLong(categoryIds[i]));
					inquiry.setSecondCatogoryId(Long.parseLong(secondCategoryIds[i]));
					inquiry.setProductId(Long.parseLong(productIdStr));
					inquiry.setQuantity(Double.parseDouble(quantitys[i]));
					inquiry.setUnit(Integer.parseInt(units[i]));
					inquiry.setSendDate(new Date());
					inquiry.setExpiredDate(date);
					if(Long.parseLong(categoryIds[i])==0){  //单个产品询盘处理
						inquiry.setStatus(HYConstants.SINGLE_INQUIRY);
						save(inquiry);
						Product product = productManager.getByObjectId(inquiry.getProductId());
						InquiryItem inquiryItem = new InquiryItem();
						inquiryItem.setInquiryId(inquiry.getObjectId());
						inquiryItem.setToCompanyId(product.getSupplierId());
						inquiryItem.setStatus(HYConstants.NOT_READ);
						inquiryItemManager.save(inquiryItem);
					}else{									//批量询盘处理
						inquiry.setStatus(HYConstants.BATCH_INQUIRY);
						save(inquiry);
						List<Long> supplierIds = productManager.getSupplierIds(Long.parseLong(secondCategoryIds[i]));
						for(Long supplierId : supplierIds){
							InquiryItem inquiryItem = new InquiryItem();
							inquiryItem.setInquiryId(inquiry.getObjectId());
							inquiryItem.setToCompanyId(supplierId);
							inquiryItem.setStatus(HYConstants.NOT_READ);
							inquiryItemManager.save(inquiryItem);
						}
					}
				}
				return "success";
			}
		}
	}
	
	
	public void getInquiryPage(PageSearch page,Long companyId,String searchText,String startDate,String endDate,String status) throws Exception{
	        Object[] params = HibernateWebUtils.getQueryParameter(page.getFilters());
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        String sql = "select A.object_id,A.from_company_id,A.description,A.send_date,A.expired_date,A.product_id,"
					+"A.product_name,A.catogory_id,A.quantity,A.unit,A.member_id,B.status as offerStatus,"
	        		+"(select main_picture from p_product  where object_Id=A.product_id) as productImg"
					+" from  t_inquiry A ,t_inquiry_item B where A.object_Id in (select B.inquiry_Id from t_inquiry_item B where to_company_id="+companyId+") AND A.object_Id = B.inquiry_Id AND B.to_company_id = "+ companyId;
	        if(searchText!=null&&!searchText.equals("")){
	            sql=sql+" and A.product_name like '%"+searchText+"%' ";
	        }
	        if(startDate!=null&&!startDate.equals("")){
//	        	Date startDate1=df.parse(startDate);
	            sql=sql+" and A.send_date >= '"+startDate+"' ";
	        }
	        if(endDate!=null&&!endDate.equals("")){
//	        	Date endDate1=df.parse(endDate);
	            sql=sql+" and A.send_date <= '"+endDate+"' ";
	        }
	        if(status!=null&&!status.equals("")){
	        	int sta=Integer.parseInt(status);
	            sql=sql+" and B.status ="+sta;
	        }
	        if (0 == page.getTotalCount()){
	            String countSql = "select count(*) from (" + sql +") a";
	            SQLQuery query = getSession().createSQLQuery(countSql);
	            HibernateWebUtils.setQueryParameter(query, params);
	            List<Long> count = query.list();
	            int total = count == null ? 0 : ((Number)count.get(0)).intValue();
	            page.setTotalCount(total);
	        }
	        String orderSql = " order by  offerStatus ,A.send_date desc ";
	        SQLQuery query = getSession().createSQLQuery(sql+orderSql);
	        HibernateWebUtils.setQueryParameter(query, params);
	        List<Object[]> items = query.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list();
	        page.setList(items);
	}
	
	public List<Inquiry> getByMemberId(Long memberId){
		  String sql = "select A from " + getActualArgumentType().getName() + " A"+" where A.memberId= " +memberId;
          return searchBySql( sql);
	}
	
	/**
	 * 会员中心显示的询盘未处理列表
	 */
	public List<Inquiry> getInquiries(Long companyId, Integer begin, Integer end) {
		String sql = "SELECT A FROM " + Inquiry.class.getName() + " A, " + InquiryItem.class.getName()
				+ " B WHERE A.objectId = B.inquiryId and B.toCompanyId = ? AND B.status= ?" + " ORDER BY A.sendDate desc";
		return pageSearchBySql(sql, begin, end, companyId, HYConstants.NOT_READ);
	}
}
