package com.mvc.member.web;

import java.awt.image.BufferedImage;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.base.model.Country;
import com.mvc.base.service.CountryManager;
import com.mvc.framework.FrameworkConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.model.Dictionary;
import com.mvc.framework.service.DictionaryFacade;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.BusinessType;
import com.mvc.member.model.Company;
import com.mvc.member.model.CompanyCertificate;
import com.mvc.member.model.CompanyCertificateFile;
import com.mvc.member.model.CompanyMedia;
import com.mvc.member.service.BusinessTypeManager;
import com.mvc.member.service.CompanyCertificateFileManager;
import com.mvc.member.service.CompanyCertificateManager;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.CompanyMediaManager;
import com.mvc.util.ImageUtils;

@Controller
@RequestMapping("/admin/company")
public class CompanyController  extends PageController<Company>{

	@Autowired
	private CompanyManager companyManager;

	@Autowired
	private CountryManager countryManager;

	@Autowired
	private BusinessTypeManager businessTypeManager;

	@Autowired
	private CompanyMediaManager companyMediaManager;

	@Autowired
	private CompanyCertificateManager companyCertificateManager;

	@Autowired
	private CompanyCertificateFileManager companyCertificateFileManager;

	@Autowired
    private DictionaryFacade dictionaryFacade;

	@Override
	public PageManager<Company> getEntityManager() {
		return companyManager;
	}
	@Override
	public String getFileBasePath() {
		return "member/";
	}
	//查看
	@Override
	protected String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		request.setAttribute(FrameworkConstants.VIEW, "1");
		Company entity =companyManager.getByObjectId(objectId);
		request.setAttribute("entity", entity);
		request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
        request.setAttribute("businessTypeSelect", businessTypeManager.getBusinessTypeByCompanyId(objectId));
        List<CompanyMedia> subpictures = companyMediaManager.getBycompanyIdAndType(entity.getObjectId(),CompanyMedia.MEDIA_TYPE_PICTURE);
        String subpictureStr = "";
        for(CompanyMedia pm:subpictures){
          subpictureStr = subpictureStr+pm.getContentUrl()+",";
        }
        if(subpictures.size()>0){
          subpictureStr = subpictureStr.substring(0,subpictureStr.length()-1);
        }

        //得到资质证书
        List<CompanyCertificate> qualifications = companyCertificateManager.getByCompanyId(entity.getObjectId());
        //资质字典
        List<Dictionary> qualificationDic = dictionaryFacade.getDictionariesByDictionaryId(1015);
        request.setAttribute("qualificationDic", qualificationDic);
        request.setAttribute("qualifications", qualifications);
        request.setAttribute("subpictures", subpictures);
        request.setAttribute("subpictureStr", subpictureStr);
		return getFileBasePath() + "viewCompany";
	}

	@Override
	protected String handleSave(HttpServletRequest request, ModelMap modelMap, Company t) throws Exception {
		companyManager.saveCompany(t);
		companyManager.update(t.getObjectId());
		String subPicture = request.getParameter("subPicture");
		companyMediaManager.save(t.getObjectId(),subPicture);

		String businessTypeSelect[]=request.getParameterValues("businessType");
		businessTypeManager.deleteByCompanyId(t.getObjectId());
		if (businessTypeSelect!=null) {
			for(int i=0;i<businessTypeSelect.length;i++){
				BusinessType businessType = new BusinessType();
				businessType.setType((Integer.parseInt(businessTypeSelect[i])));
				businessType.setCompanyId(t.getObjectId());
				businessTypeManager.save(businessType);
			}
		}

		//得到资质的信息
		List<CompanyCertificate> pas = new ArrayList<CompanyCertificate>();//资质信息的集合
        String[] qualification = request.getParameterValues("qualification");
        if(qualification!=null&&qualification.length>0){
            for(String qualiValue:qualification){
                String remark = request.getParameter("qualificationContent_"+qualiValue);
                CompanyCertificate pa = new CompanyCertificate();
                pa.setCompanyId(t.getObjectId());
                pa.setType(Integer.valueOf(qualiValue));
                pa.setContent(remark);
                pas.add(pa);
            }
        }
        companyCertificateManager.save(t.getObjectId(), pas);
		return "redirect:/admin/company/edit/"+t.getObjectId()+"?message=success";
	}

	@RequestMapping("/check/page")
    public String checkPage(HttpServletRequest request,Integer backPage) throws Exception{
   	    PageSearch page  = preparePage(request);
   	    String status=""+Company.COMPANY_STATUS_WAIT_CHECK;
	    page.getFilters().add(new PropertyFilter(Company.class.getName(), "EQI_status",status));
        page.setSortProperty("registerDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
        request.setAttribute("status", status);
        request.setAttribute("searchPath","/admin/company/check/page");
        afterPage(request, page,backPage);
    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
    }

	@RequestMapping("/contractEnd/page")
    public String publishPage(HttpServletRequest request,Integer backPage) throws Exception{
   	    PageSearch page  = preparePage(request);
   	    String status=""+Company.COMPANY_STATUS_PASSED;
	    page.getFilters().add(new PropertyFilter(Company.class.getName(), "EQI_status",status));
        page.setSortProperty("registerDate");
        page.setSortOrder("desc");
        getEntityManager().find(page);
        request.setAttribute("action", "page");
        request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
        request.setAttribute("status", status);
        request.setAttribute("searchPath","/admin/company/contractEnd/page");
        afterPage(request, page,backPage);
    	return getFileBasePath() + "list" + getActualArgumentType().getSimpleName()+"Check";
    }

	@RequestMapping("/audit/{objectId}")
    public String audit(HttpServletRequest request, HttpServletResponse response,@PathVariable Long objectId,int status){
		companyManager.executeAudit(objectId,status);
		companyManager.update(objectId);
    	request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
    	if (status==Company.COMPANY_STATUS_CONTRACT_END) {
    		return "redirect:/admin/company/contractEnd/page";
		}else{
			return "redirect:/admin/company/check/page";
		}
    }

	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
		return super.handlePage(request, page);
	}

    @Override
    public String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)throws Exception{
    	Company entity =companyManager.getByObjectId(objectId);
        request.setAttribute("entity",entity);
        request.setAttribute("countries",countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL));
        request.setAttribute("businessTypeSelect",businessTypeManager.getBusinessTypeByCompanyId(objectId));
        List<CompanyMedia> subpictures = companyMediaManager.getBycompanyIdAndType(objectId,CompanyMedia.MEDIA_TYPE_PICTURE);
        String subpictureStr = "";
        for(CompanyMedia pm:subpictures){
            subpictureStr = subpictureStr+pm.getContentUrl()+",";
        }
        if(subpictures.size()>0){
            subpictureStr = subpictureStr.substring(0,subpictureStr.length()-1);
        }

        //得到资质证书
        List<CompanyCertificate> qualifications = companyCertificateManager.getByCompanyId(objectId);
        List<CompanyCertificateFile> companyCertificateFiles=companyCertificateFileManager.getByCompanyId(objectId);
        request.setAttribute("companyCertificateFiles", companyCertificateFiles);

        //资质字典
        List<Dictionary> qualificationDic = dictionaryFacade.getDictionariesByDictionaryId(1015);
        request.setAttribute("qualificationDic", qualificationDic);
        request.setAttribute("qualifications", qualifications);
        request.setAttribute("subpictures",subpictures);
        request.setAttribute("subpictureStr",subpictureStr);
    	return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

	/**
	 * 运营增加企业用户时选择企业
	 */
	@RequestMapping(value = "/selectCompany")
	public String selectCompany(HttpServletRequest request) throws Exception {
		PageSearch page = preparePage(request);

		// 过滤为已审核企业
		String status = "" + Company.COMPANY_STATUS_PASSED;
		page.getFilters().add(new PropertyFilter(Company.class.getName(), "EQI_status", status));

		getEntityManager().find(page);
		request.setAttribute("action", "page");
		String result = "member/selectCompany";

		afterPage(request, page, IS_NOT_BACK);
		return result;
	}

	/**
	 * 供应商单选模板
	 * @param request
	 * @param t
	 * @param backPage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/companyTemplate")
    public String companyTemplate(HttpServletRequest request, Company t, Integer backPage) throws Exception {
        PageSearch page  = preparePage(request);
        page.getFilters().add(new PropertyFilter(Company.class.getName(),"EQI_status",Company.COMPANY_STATUS_PASSED+""));
        page.getFilters().add(new PropertyFilter(Company.class.getName(),"EQI_isSupplier",HYConstants.STATUS_YES+""));
        getEntityManager().find(page);
        afterPage(request, page,backPage);
        request.setAttribute("inputName", request.getParameter("inputName"));
        return "member/listCompanyTemplate";
    }

	/**
	 * add by zengruhui
	 */
	private static final String SUB_DIR = "Leaguer";

	@RequestMapping(value = "/leaguerList")
	public String pageLeaguer(HttpServletRequest request, Company t, Integer backPage) throws Exception {
		PageSearch page = preparePage(request);
		// String result = handlePage(request, page);
		getEntityManager().find(page);
		request.setAttribute("action", "page");
		String result = getFileBasePath() + "list" + SUB_DIR;

		afterPage(request, page, backPage);
		return result;
	}

	@RequestMapping(value = "/leaguerEdit/{objectId}")
	public String editLeaguer(HttpServletRequest request, HttpServletResponse response, @PathVariable Long objectId)
			throws Exception {
		if (null != objectId) {
			Company entity = getManager().getByObjectId(objectId);
			this.getEntityManager().save(entity); // 重要
			request.setAttribute("entity", entity);
		}
		return getFileBasePath() + "edit" + SUB_DIR;
	}

	@RequestMapping(value = "/leaguerSave")
	public String saveLeaguer(HttpServletRequest request, ModelMap modelMap, @Valid Company t, BindingResult result)
			throws Exception {
		String[] updatedFileds = new String[] { "level", "isCheck", "isAllow" };
		companyManager.update(t, updatedFileds);

		String url = "redirect:leaguerEdit/" + ((AbstractEntity) t).getObjectId()
				+ getMessage("common.base.success", request) + "&" + appendAjaxParameter(request) + "&action="
				+ request.getParameter("action");
		return url;
	}


	@RequestMapping("/importCompanyPage")
    public String importCompanyPage(HttpServletRequest request, HttpServletResponse response){
        return "member/importCompanyPage";
    }
    @RequestMapping("/importCompany")
    public String importCompany(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //导入
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request);
        String fileName = uploadFile.getFileName();
        if (StringUtils.isNotBlank(fileName) && fileName.endsWith(".xls")) {
        	byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
            String message = companyManager.importCompany(fileData);
            return "redirect:/admin/company/importCompanyPage?message="+URLEncoder.encode(message,"utf-8");
        } else {
        	return "redirect:/admin/company/importCompanyPage?message="+URLEncoder.encode("文件格式不正确！","utf-8");
        }
    }
}