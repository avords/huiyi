package com.mvc.home.web;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mvc.HYConstants;
import com.mvc.base.model.Country;
import com.mvc.base.model.Message;
import com.mvc.base.service.CountryManager;
import com.mvc.base.service.MessageManager;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.member.model.BusinessType;
import com.mvc.member.model.Company;
import com.mvc.member.model.CompanyCertificate;
import com.mvc.member.model.CompanyCertificateFile;
import com.mvc.member.model.Exhibition;
import com.mvc.member.model.Member;
import com.mvc.member.service.BusinessTypeManager;
import com.mvc.member.service.CompanyCertificateFileManager;
import com.mvc.member.service.CompanyCertificateManager;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.ExhibitionManager;
import com.mvc.member.service.HistoryManager;
import com.mvc.member.service.MemberManager;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;
import com.mvc.util.I18NUtils;


/**
 * 前台企业相关控制器
 * @author Ace Lee
 *
 */
@Controller
@RequestMapping("/home/company")
public class HomeCompanyController {
	 private static Logger logger = Logger.getLogger(HomeCompanyController.class); 
	@Autowired
	private HistoryManager historyManager;
    @Autowired
    private CompanyManager companyManager;
    @Autowired
    private BusinessTypeManager businessTypeManager;
    @Autowired
    private ProductManager productManager;
    @Autowired
    private CountryManager countryManager;
    @Autowired
    private MessageManager messageManager;
    @Autowired
    private MemberManager memberManager;
    @Autowired
    private CompanyCertificateManager companyCertificateManager;
    @Autowired
    private CompanyCertificateFileManager companyCertificateFileManager;
    @Autowired
    private ExhibitionManager exhibitionManager;
    

    /**
     * 企业展示首页
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/index/{companyId}")
    public String companyIndex(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
    	Long memberId=(Long)request.getSession().getAttribute(HYConstants.MEMBER_ID);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }else if(historyManager.checkHistoryExtensive(companyId)==true&&company!=null&&memberId!=null){
    		historyManager.createVisitRecord(companyId, 1, 1, memberId);
        }
		
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
		
		//商业类型
		List<BusinessType> businessTypes=businessTypeManager.getBusinessTypeByCompanyId(companyId);
		request.setAttribute("businessTypes", businessTypes);
		
		//资质
		List<CompanyCertificate> certificates=companyCertificateManager.getByCompanyId(companyId);
		request.setAttribute("certificates", certificates);
		
		//主要产品
		List<Product> mainProducts=productManager.getMainProductsBySupplierId(companyId);
		if (mainProducts.size()>0) {
			for (Product product : mainProducts) {
				//展示价格范围
		        product.setSellPrice(productManager.getSellPrice(product.getObjectId(), LocaleUtils.getLocale(request).getLanguage()));
			}
		}
 		request.setAttribute("mainProducts", mainProducts);
 		
 		//国家
 		if (company.getCountryId()!=null) {
 			Country country=countryManager.getByObjectId(company.getCountryId());
 			request.setAttribute("country", country);
		}else{
			request.setAttribute("country", null);
		}
 				
		request.setAttribute("company", company);
    	return "home/companyIndex";
    }
    
    /**
     * 站内信的保存
     * @param request
     * @param modelMap
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/saveCompanyMessage")
    @ResponseBody
	public ModelMap saveCompanyMessage(HttpServletRequest request,HttpServletResponse response){
		Message t = new Message();
		ModelMap modelMap = new ModelMap();
		String msg=com.mvc.search.util.I18NUtils.transformName("发送成功！", "Success！", LocaleUtils.getLocale(request));
		//登录人的ID
		HttpSession session = request.getSession();
		if(session.getAttribute(HYConstants.MEMBER_ID)==null){
			msg=com.mvc.search.util.I18NUtils.transformName("请先登录！", "Sign In first please！", LocaleUtils.getLocale(request));
			modelMap.addAttribute("msg",msg);
			modelMap.addAttribute("result", false);
			return modelMap;
		}
		Long userId = Long.parseLong(session.getAttribute(HYConstants.MEMBER_ID).toString());
		t.setFromUser(userId);
		Member member=memberManager.getByObjectId(userId);
		if (member!=null && member.getCompanyId()!=null) {
			t.setFromCompany(member.getCompanyId());
		}
		t.setToCompany(Long.parseLong(request.getParameter("toCompany")));
		t.setTitle(request.getParameter("title"));
		t.setContent(request.getParameter("content"));
		t.setIsSee(HYConstants.STATUS_NO);
		t.setSendDate(new Date());
		t.setType(HYConstants.MESSAGE_TYPE_PLATFORM);
		try {
			messageManager.save(t);
			modelMap.addAttribute("result", true);
		} catch (Exception e) {
			msg=com.mvc.search.util.I18NUtils.transformName("发送成功！", "Success！", LocaleUtils.getLocale(request));
			modelMap.addAttribute("result", false);
		}
		modelMap.addAttribute("msg",msg);
		return modelMap;
	}
    
    /**
     * 供应产品下拉列表
     * @param request
     * @param response
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/getProductsByCompanyId/{id}")
    @ResponseBody
	public ModelMap getProductsByCompanyId(HttpServletRequest request,HttpServletResponse response,@PathVariable Long id) throws Exception {
    	if (id==null) {
			return null;	
		}
    	//获取企业下属产品的一级分类
    	List<Category> categories=companyManager.getProductFirstCategoriesBycompanyId(id);
    	I18NUtils.transform(categories, request);
    	
    	ModelMap modelMap=new ModelMap();
    	modelMap.addAttribute("result", true);
    	modelMap.addAttribute("categories", categories);
    	
    	//搜索条件Key的国际化
    	Locale locale = LocaleUtils.getLocale(request);
    	String fieldName = com.mvc.search.util.I18NUtils.transformDBField("category_name1", locale);
    	modelMap.put("fieldName", fieldName);
    	return modelMap;
	}
    
    /**
     * 供应产品
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/product/{companyId}")
    public String companyProduct(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
        
		//获取所有产品
		List<Product> products=productManager.getProductsBySuppilerId(companyId);
		if (products.size()>0) {
			for (Product product : products) {
				//展示价格范围
		        product.setSellPrice(productManager.getSellPrice(product.getObjectId(), LocaleUtils.getLocale(request).getLanguage()));
			}
		}
		request.setAttribute("products", products);
		
		request.setAttribute("company", company);
    	return "home/companyProductList";
    }
    
    /**
     * 联系我们
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/contact/{companyId}")
    public String companyContact(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
        
		request.setAttribute("company", company);
    	return "home/companyContact";
    }
    
    /**
     * 公司展示-----风采视频
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/video/{companyId}")
    public String companyVideos(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
		request.setAttribute("company", company);
    	return "home/companyVideos";
    }
    
    /**
     * 公司展示-----公司公告
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/bulletin/{companyId}")
    public String companyBulletin(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
		request.setAttribute("company", company);
    	return "home/companyBulletin";
    }
    
    /**
     * 公司展示-----荣誉证书
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/certificates/{companyId}")
    public String companyCertificates(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
		request.setAttribute("company", company);
		
		List<CompanyCertificateFile> certificateFiles=companyCertificateFileManager.getByCompanyId(companyId);
		request.setAttribute("certificateFiles", certificateFiles);
		
    	return "home/companyCertificates";
    }
    
    /**
     * 展会
     * @param request
     * @param response
     * @param companyId
     * @return
     */
    @RequestMapping("/exhibition/{companyId}")
    public String companyExhibition(HttpServletRequest request, HttpServletResponse response,@PathVariable Long companyId) {
    	Company company=companyManager.getByObjectId(companyId);
		if(company==null){
            try {
                response.getWriter().write("企业不存在！");
                return null;
            } catch (IOException e) {
            	logger.info(e.getMessage());
            }
        }
		//获取纯文本
        companyManager.getTxtFromDesc(company, request);
		List<Exhibition> exhibitions=exhibitionManager.getBycompanyId(companyId);
		request.setAttribute("exhibitions", exhibitions);
		
		request.setAttribute("company", company);
    	return "home/companyExhibition";
    }
    
    
    
}
