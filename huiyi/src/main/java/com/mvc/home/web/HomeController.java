package com.mvc.home.web;

import java.text.CollationKey;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.base.model.Country;
import com.mvc.base.model.SearchWords;
import com.mvc.base.service.AdvertManager;
import com.mvc.base.service.CountryManager;
import com.mvc.base.service.SearchWordsManager;
import com.mvc.business.model.Inquiry;
import com.mvc.business.model.MallCategory;
import com.mvc.business.model.MallCategoryMapping;
import com.mvc.business.model.Quotation;
import com.mvc.business.model.Standard;
import com.mvc.business.service.InquiryItemManager;
import com.mvc.business.service.InquiryManager;
import com.mvc.business.service.MallCategoryManager;
import com.mvc.business.service.MallCategoryMappingManager;
import com.mvc.business.service.QuotationManager;
import com.mvc.business.service.StandardManager;
import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.service.ChannelManager;
import com.mvc.cms.service.ContentManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.Dictionary;
import com.mvc.framework.service.DictionaryFacade;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.member.model.Company;
import com.mvc.member.model.Exhibition;
import com.mvc.member.model.Member;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.ExhibitionManager;
import com.mvc.member.service.MemberManager;
import com.mvc.portal.service.RecommendManager;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.service.CategoryManager;
import com.mvc.product.service.ProductManager;
import com.mvc.service.model.Service;
import com.mvc.service.model.ServiceApply;
import com.mvc.service.service.ServiceApplyManager;
import com.mvc.service.service.ServiceManager;
import com.mvc.util.I18NUtils;

/**
 * 前台首页控制器
 *
 * @author bob.pu
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	private static final String BASE_DIR = "home/";
	private static int START_TITLE= 1;
    private static int TOP_ARTICLE= 5;
	@Autowired
	private CountryManager countryManager;
	@Autowired
	private QuotationManager quotationManager;
	@Autowired
	private CategoryManager categoryManager;

	@Autowired
	private RecommendManager recommendManager;

	@Autowired
	private SearchWordsManager searchWordsManager;

	@Autowired
	private AdvertManager advertManager;

	@Autowired
	private ContentManager contentManager;

	@Autowired
	private ServiceManager serviceManager;

	@Autowired
	private ServiceApplyManager serviceApplyManager;

	@Autowired
	private MemberManager memberManager;

	@Autowired
	private MallCategoryManager mallCategoryManager;

	@Autowired
	private MallCategoryMappingManager mallCategoryMappingManager;

	@Autowired
	private ChannelManager channelManager;

	@Autowired
	private StandardManager standardManager;
	
	@Autowired
	private ProductManager productManager;
	
	@Autowired
	private InquiryManager inquiryManager;
	
	@Autowired
	private InquiryItemManager inquiryItemManager ;
	
	@Autowired
	private ExhibitionManager exhibitionManager;
	
	@Autowired
	private CompanyManager companyManager;
	
	@Autowired
    private DictionaryFacade dictionaryFacade;
	
	public String getFileBasePath() {
		return BASE_DIR;
	}

	// 装饰页面
	@RequestMapping(value = "homeDecorator")
	public String homeDecorator(HttpServletRequest request) throws Exception {
		List<SearchWords> searchWords = searchWordsManager.getSearchWord(5);
		I18NUtils.transform(searchWords, request);
		request.setAttribute("searchKeyWord", searchWords);
		List<Channel> footChannels = channelManager.getChildChannelByParentCode("PAGE_FOOTER");
		I18NUtils.transform(footChannels, request);
		request.setAttribute("footChannels", footChannels);
		List<Category> menuProduct = categoryManager.getCategoryTreeByType(Category.TYPE_COMMON_PRODUCT);
		I18NUtils.transform(menuProduct, request);
		request.setAttribute("menuProduct", menuProduct);
		Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
		if(member!=null){
			if(member.getCompanyId()!=null){
				Company company = companyManager.getByObjectId(member.getCompanyId());
				String companyName = company.getNameZh();
				request.setAttribute("companyName", companyName);
			}
		}
		return BASE_DIR + "homeDecorator";
	}

	// 首页
	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Category> serviceDirectory = categoryManager.getCategoryTreeByType(Category.TYPE_SERVICE);
		List<Category> productDirectory = categoryManager.getCategoryTreeByType(Category.TYPE_COMMON_PRODUCT);

		List<Product> recommendProducts = recommendManager.getProducts(12,null);
		List<Company> recommendCompanys = recommendManager.getCompanys(6);

		List<Channel> channels = channelManager.getChildChannelByParentCode("NEWS");
		for (Channel channel : channels) {
			List<Content> contents=contentManager.getRecommendContents(channel.getObjectId(), 5);
			channel.setFirstContent(contents.get(0));
			channel.setContents(contents.subList(1, contents.size()));
		}
		I18NUtils.transform(serviceDirectory, request);
		I18NUtils.transform(productDirectory, request);
		I18NUtils.transform(recommendProducts, request);
		I18NUtils.transform(recommendCompanys, request);
		I18NUtils.transform(channels, request);

		request.setAttribute("serviceDirectory", serviceDirectory);
		request.setAttribute("productDirectory", productDirectory);

		request.setAttribute("recommendProducts", recommendProducts);
		request.setAttribute("recommendCompanys", recommendCompanys);
		
		request.setAttribute("channels", channels);
		request.setAttribute("bannerAdvert", advertManager.getPublishedAdertByPositionCode("home_banner"));
		return getFileBasePath() + "index";
	}

	// 普通产品目录
	@RequestMapping("/products")
	public String productCategory(HttpServletRequest request) {
		List<Category> categories = categoryManager.getAllValidByType(Category.TYPE_COMMON_PRODUCT);
		List<MallCategory> mallCategories = mallCategoryManager.getMappedByType(Category.TYPE_COMMON_PRODUCT);
		I18NUtils.transform(categories, request);
		I18NUtils.transform(mallCategories, request);
		List<MallCategoryMapping> mappings = mallCategoryMappingManager.getAll();
		mapping(mallCategories, categories, mappings);
		request.setAttribute("mallcategories", mallCategories);
		request.setAttribute("categories", categories);
		List<Category> clone = new ArrayList<Category>(Arrays.asList(new Category[categories.size()]));
		I18NUtils.transform(clone, request);
		Collections.copy(clone, categories);
		Collections.sort(clone, new CategoryAZComparator());
		request.setAttribute("azcategories", clone);
		return getFileBasePath() + "products";
	}

	public static class CategoryAZComparator implements Comparator<Category> {
		private Collator collator = Collator.getInstance();

		@Override
		public int compare(Category o1, Category o2) {
			CollationKey key1 = collator.getCollationKey(o1.getNameZh());
			CollationKey key2 = collator.getCollationKey(o2.getNameZh());
			return key1.compareTo(key2);
		}
	}

	private void mapping(List<MallCategory> mallCategories, List<Category> categories, List<MallCategoryMapping> mappings) {
		for (Category category : categories) {
			if (category.getLayer() == 2) {
				for (MallCategoryMapping mapping : mappings) {
					if (category.getObjectId().equals(mapping.getCategoryId())) {
						MallCategory mallCategory = getMallCategoryByObjectId(mallCategories, mapping.getMallCategoryId());
						if (mallCategory != null) {
							Category parent = getCategoryByObjectId(categories, category.getParentId());
							if(parent!=null){
								if (!mallCategory.getCategories().contains(parent)) {
									mallCategory.getCategories().add(parent);
								}
								parent.getChildren().add(category);
							}
						}
					}
				}
			}
		}
	}

	private Category getCategoryByObjectId(List<Category> categories, long parentId) {
		for (Category category : categories) {
			if (category.getLayer() == 1 && category.getObjectId() == parentId) {
				return category;
			}
		}
		return null;
	}

	private MallCategory getMallCategoryByObjectId(List<MallCategory> categories, long parentId) {
		for (MallCategory category : categories) {
			if (category.getObjectId() == parentId) {
				return category;
			}
		}
		return null;
	}

	// 服务产品目录
	@RequestMapping("/productServices")
	public String productServices(HttpServletRequest request) {
		List<Category> categories = categoryManager.getAllValidByType(Category.TYPE_SERVICE);
		I18NUtils.transform(categories, request);
		request.setAttribute("categories", categories);
		List<Category> clone = new ArrayList<Category>(Arrays.asList(new Category[categories.size()]));
		I18NUtils.transform(clone, request);
		Collections.copy(clone, categories);
		Collections.sort(clone, new CategoryAZComparator());
		request.setAttribute("azcategories", clone);
		return getFileBasePath() + "productServices";
	}

	// 买家询盘页面
	@RequestMapping("/inquireList")
	public String inquireList(HttpServletRequest request, HttpServletResponse response) {
		Locale locale = LocaleUtils.getLocale(request);
	    //会员级别的字典1402
	    List<Dictionary> memberLevels = dictionaryFacade.getDictionariesByDictionaryId(1402);
	    //资质证书的字典1015
	    List<Dictionary> qualityCertificas = dictionaryFacade.getDictionariesByDictionaryId(1015);
	    //企业性质的字典1013
	    List<Dictionary> companyTypes = dictionaryFacade.getDictionariesByDictionaryId(1013);
	    request.setAttribute("memberLevels", memberLevels);
	    request.setAttribute("qualityCertificas", qualityCertificas);
	    request.setAttribute("companyTypes", companyTypes);
		List<Category> productDirectory = categoryManager.getCategoryTreeByType(Category.TYPE_COMMON_PRODUCT);
		PageSearch pageSearch = PageUtils.preparePage(request, Inquiry.class, true);
		pageSearch.setPageSize(10);
		pageSearch.setSortProperty("sendDate");
		pageSearch.setSortOrder("desc");
		String fromCompanyIds = "";
		//判断是否是询盘列表页面查询
		if(StringUtils.isNotBlank(request.getParameter("topquery"))){
			request.setAttribute("topquery", request.getParameter("topquery"));
			//通过询盘列表页面checkbox框复选过滤出符合的companyId
			List<Long> companyIds = companyManager.getCompanyIdsByCondition(request);
			fromCompanyIds = "";
			if(companyIds.size()>0){
				for(Long companyId:companyIds){
					if(StringUtils.isBlank(fromCompanyIds)){
						fromCompanyIds += companyId;
					}else{
						fromCompanyIds += ","+companyId;
					}
				}
			}else{
				fromCompanyIds = "-1";//如果没有符合条件的company，至为-1，查询不到结果
			}
		}
		//如果有发布询盘公司Id的过滤条件，加入查询条件进行查询
		if(StringUtils.isNotBlank(fromCompanyIds)){
			pageSearch.getFilters().add(new PropertyFilter(Inquiry.class.getName(), "ICL_fromCompanyId", fromCompanyIds));
		}
		inquiryManager.find(pageSearch);
		request.setAttribute("fromCompanyIds",fromCompanyIds);
		request.setAttribute("pageSearch", pageSearch);
		List<Inquiry> inquirys = pageSearch.getList();
		List<Country> countries = countryManager.getCountryByStatus(Country.COUNTRY_STATUS_NORMAL);
		
		// 询盘报价个数
		for (int j = 0; j < inquirys.size(); j++) {
			Long o = inquirys.get(j).getObjectId();
			List<Quotation> ss = quotationManager.getByInquireId(inquirys.get(j).getObjectId());
			inquirys.get(j).setNumber(ss.size());
			if(inquirys.get(j).getProductId()!=0){
				Product product = productManager.getByObjectId(inquirys.get(j).getProductId());
				if(product!=null){
					String productImg = product.getMainPicture();
					inquirys.get(j).setProductImg(productImg);
				}
			}
		}
		request.setAttribute("countries", countries);
		I18NUtils.transform(countries, request);
		request.setAttribute("inquirys", inquirys);
		I18NUtils.transform(productDirectory, request);
		request.setAttribute("productDirectory", productDirectory);
		request.setAttribute("pageSearch", pageSearch);
		return getFileBasePath() + "inquireList";
	}

	// 汇医服务
	@RequestMapping("/services")
	public String serviceCatalog(HttpServletRequest request, HttpServletResponse response, Integer type) {
		String businessType=request.getParameter("businessType");
		if(type!=null){
			List<Service> services = serviceManager.getByTypeAndBusinessType(type,businessType);
			request.setAttribute("services_" + type, services);
		}else{
			List<Service> buyerServices = serviceManager.getByTypeAndBusinessType(Service.SERVICE_TYPE_BUYER,businessType);
			request.setAttribute("services_" + Service.SERVICE_TYPE_BUYER, buyerServices);
			List<Service> supplierServices = serviceManager.getByTypeAndBusinessType(Service.SERVICE_TYPE_SUPPLIER,businessType);
			request.setAttribute("services_" + Service.SERVICE_TYPE_SUPPLIER, supplierServices);
		}
		return getFileBasePath() + "serviceCatalog";
	}

	/**
	 * 服务列表("业务类型(1.优化采购,2.优化推广,3.汇医助手)")
	 * @param request
	 * @param response
	 * @param businessType
	 * @return
	 */
	@RequestMapping("/servicesList/{businessType}")
	public String servicesList(HttpServletRequest request, HttpServletResponse response,@PathVariable Integer businessType) {
		//获取服务列表
		List<Service> services=serviceManager.getPublishServiceByBusinessType(businessType);
		request.setAttribute("businessType", businessType);
		request.setAttribute("services", services);
		return BASE_DIR + "listServices";
	}
	
	/**
	 * 批量服务申请
	 * @param request
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/applyServices")
	public String applyServices(HttpServletRequest request, HttpServletResponse response, String ids, ModelMap map) throws Exception {
		String message = com.mvc.search.util.I18NUtils.transformName("服务申请成功！", "Success！", LocaleUtils.getLocale(request));
		Long memberId = (Long) request.getSession().getAttribute(HYConstants.MEMBER_ID);
		if (memberId == null) {
			message=com.mvc.search.util.I18NUtils.transformName("请先登录！", "Sign In first please！", LocaleUtils.getLocale(request));
			map.addAttribute("message", message);
			map.addAttribute("result", false);
			return "jsonView";
		}
		Member member=memberManager.getByObjectId(memberId);
		if (StringUtils.isNotBlank(ids)) {
			String[] idStrs = ids.split(",");
			for (String idStr : idStrs) {
				Long serviceId = Long.parseLong(idStr);
				ServiceApply serviceApply=new ServiceApply();
				serviceApply.setMemberId(memberId);
				if (member.getCompanyId()!=null) {
					serviceApply.setCompanyId(member.getCompanyId());
				}
				serviceApply.setServiceId(serviceId);
				serviceApply.setStatus(ServiceApply.STATUS_SUBMIT);
				serviceApplyManager.save(serviceApply);
			}
		} else {
			message = com.mvc.search.util.I18NUtils.transformName("你未选择任何服务！", "Please select at least one record！", LocaleUtils.getLocale(request));
		}
		map.addAttribute("result", true);
		map.addAttribute("message", message);
		return "jsonView";
	}
	
	// 汇医服务详细页面
	@RequestMapping("/serviceDetail/{serviceId}")
	public String serviceDetail(HttpServletRequest request, HttpServletResponse response, @PathVariable Long serviceId) {
		request.setAttribute("service", serviceManager.getByObjectId(serviceId));
		return getFileBasePath() + "serviceCatalogDetail";
	}

	// 汇医服务申请
	@RequestMapping("/saveServiceApply")
	public String saveServiceApply(HttpServletRequest request, ServiceApply serviceApply, ModelMap modelMap) throws Exception {
		Member mem = memberManager.getByObjectId((Long) request.getSession().getAttribute(HYConstants.MEMBER_ID));
		if (mem.getCompanyId() == null) {
			modelMap.addAttribute("noCompany", true);
		} else {
			serviceApply.setMemberId(mem.getObjectId());
			serviceApply.setCompanyId(mem.getCompanyId());
			serviceApply.setStatus(ServiceApply.STATUS_SUBMIT);
			serviceApplyManager.save(serviceApply);
			modelMap.addAttribute("result", true);
		}
		return "jsonView";
	}

	// 文章列表页
	@RequestMapping("/article/{positionCode}")
    public String channel(HttpServletRequest request,@PathVariable String positionCode) throws Exception {
        PageSearch pageSearch = PageUtils.getPageSearch(request);
        Channel channel = channelManager.getChannelByPositionCode(positionCode);
        if(channel!=null){
            request.setAttribute("parentModuleId", channel.getParentId());
                //通过栏目得到文章的列表
                //取5篇最新的文章
                List<Content> topArticles = contentManager.getChannelContent(channel, 0, TOP_ARTICLE);
                //从第五篇开始分页
                contentManager.getChannelContent(pageSearch, channel,TOP_ARTICLE);
                I18NUtils.transform(topArticles, request);
                request.setAttribute("topArticles", topArticles);
        }
        //推荐产品
        List<Product> recommendProducts = recommendManager.getProducts(3, LocaleUtils.getLocale(request).getLanguage());
		I18NUtils.transform(recommendProducts, request);
		request.setAttribute("recommendProducts", recommendProducts);
		//展会信息
		List<Exhibition> exhibitions = exhibitionManager.getExhibitions(6);
		I18NUtils.transform(exhibitions, request);
		request.setAttribute("exhibitions", exhibitions);
		//法律法规
		Channel lawChannel = channelManager.getChannelByPositionCode(Channel.POSITIONCODE_LAWS);
		if (lawChannel!=null) {
			List<Content> lawArticles = contentManager.getChannelContent(lawChannel, 0, 6);
			I18NUtils.transform(lawArticles, request);
			request.setAttribute("lawArticles", lawArticles);
			request.setAttribute("lawPositionCode", Channel.POSITIONCODE_LAWS);
		}
        request.setAttribute("positionCode", positionCode);
        request.setAttribute("pageSearch", pageSearch);
        request.setAttribute("channel", channel);
        return "home/articleList";
    }

	// 文章详情页
	@RequestMapping("/article/{positionCode}/{articleId}")
	public String articlePage(HttpServletRequest request, @PathVariable String positionCode, @PathVariable Long articleId) {
		Content content = contentManager.getContentById(articleId);
		Channel channel = channelManager.getChannelByPositionCode(positionCode);
		return contenDetail(request, channel, content);
	}

	@RequestMapping("directDetail/{channelId}")
	public String directDetail(HttpServletRequest request, @PathVariable Long channelId) throws Exception {
		Channel channel = channelManager.getByObjectId(channelId);
		if (channel != null) {
			// 通过栏目得到文章的列表
			List<Content> contents = contentManager.getChannelContent(channel, 0, 1);
			if (contents.size() > 0) {
				return contenDetail(request, channel, contents.get(0));
			}
		}
		return "redirect:/home";
	}

	private String contenDetail(HttpServletRequest request, Channel channel, Content content) {
		I18NUtils.transform(channel, request);
		I18NUtils.transform(content, request);
		request.setAttribute("content", content);
		request.setAttribute("channel", channel);
		//推荐产品
        List<Product> recommendProducts = recommendManager.getProducts(3, LocaleUtils.getLocale(request).getLanguage());
		I18NUtils.transform(recommendProducts, request);
		request.setAttribute("recommendProducts", recommendProducts);
		//展会信息
		List<Exhibition> exhibitions = exhibitionManager.getExhibitions(6);
		I18NUtils.transform(exhibitions, request);
		request.setAttribute("exhibitions", exhibitions);
		//法律法规
		Channel lawChannel = channelManager.getChannelByPositionCode(Channel.POSITIONCODE_LAWS);
		if (lawChannel!=null) {
			List<Content> lawArticles = contentManager.getChannelContent(lawChannel, 0, 6);
			I18NUtils.transform(lawArticles, request);
			request.setAttribute("lawArticles", lawArticles);
			request.setAttribute("lawPositionCode", Channel.POSITIONCODE_LAWS);
		}
		return getFileBasePath() + "articlePage";
	}
	@RequestMapping("stdDetail/{stdId}")
    public String stdDetail(HttpServletRequest request, @PathVariable Long stdId) throws Exception {
	    Standard standard = standardManager.getByObjectId(stdId);
	    I18NUtils.transform(standard, request);
	    request.setAttribute("standard", standard);
        return "/home/stdDetail";
    }
	
	@RequestMapping("/getSecondCategoryByFisrt")
	public String getProductsByMenu(ModelMap modelMap,HttpServletRequest request){
		String categoryStr = request.getParameter("categoryId");
		if(StringUtils.isNotBlank(categoryStr)){
			Long categoryId = Long.parseLong(categoryStr);
			List<Category> categories = categoryManager.getSecondCategoryByParentId(categoryId, HYConstants.STATUS_VALID);
			I18NUtils.transform(categories, request);
			modelMap.addAttribute("categories", categories);
		}
		return "jsonView";
	}
	
	
}
