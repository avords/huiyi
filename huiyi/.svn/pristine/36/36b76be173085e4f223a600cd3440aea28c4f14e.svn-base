package com.mvc.member.web;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.mvc.HYConstants;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.model.Dictionary;
import com.mvc.framework.service.DictionaryFacade;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.PageUtils;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.model.Member;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.MemberManager;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.model.ProductAttached;
import com.mvc.product.model.ProductAttribute;
import com.mvc.product.model.ProductMedia;
import com.mvc.product.model.Sku;
import com.mvc.product.model.SkuAttributeAttached;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.AttributeValManager;
import com.mvc.product.service.CategoryManager;
import com.mvc.product.service.ProductAttachedManager;
import com.mvc.product.service.ProductAttributeManager;
import com.mvc.product.service.ProductManager;
import com.mvc.product.service.ProductMediaManager;
import com.mvc.product.service.SkuAttributeAttachedManager;
import com.mvc.product.service.SkuManager;
import com.mvc.util.I18NUtils;

@Controller
@RequestMapping("/member/product")
public class MemberProductController extends PageController<Product>{
    private static final String BASE_PATH="member/";
    @Autowired
    private ProductManager productManager;
    @Autowired
    private CategoryManager categoryManager;
    @Autowired
    private ProductAttachedManager productAttachedManager;
    @Autowired
    private ProductAttributeManager productAttributeManager;
    @Autowired
    private AttributeManager attributeManager;
    @Autowired
    private AttributeValManager attributeValManager;
    @Autowired
    private SkuManager skuManager;
    @Autowired
    private SkuAttributeAttachedManager skuAttributeAttachedManager;
    @Autowired
    private ProductMediaManager productMediaManager;
    @Autowired
    private CompanyManager companyManager;
    @Autowired
    private DictionaryFacade dictionaryFacade;
    @Autowired
    private MemberManager memberManager;
    @Override
    public PageManager<Product> getEntityManager() {
        return productManager;
    }

    @Override
    public String getFileBasePath() {
        return BASE_PATH;
    }

    @Override
    protected String handleEdit(HttpServletRequest request, HttpServletResponse response, Long objectId)
            throws Exception {
        //所有三级分类
        List<Category> categorys = categoryManager.getAllCategory(2,HYConstants.STATUS_VALID);
        for(Category ca:categorys){
            Category parentCate = categoryManager.getByObjectId(ca.getParentId());
            if(parentCate!=null){
                ca.setNameZh(parentCate.getNameZh()+">"+ca.getNameZh());
            }
        }
        I18NUtils.transform(categorys, request);
        request.setAttribute("categorys", categorys);
        Member member = memberManager.getByObjectId((Long)request.getSession().getAttribute(HYConstants.MEMBER_ID));
        if(member!=null&&member.getCompanyId()!=null){
            Company company = companyManager.getByObjectId(member.getCompanyId());
            I18NUtils.transform(company, request);
            request.setAttribute("company", company);
            request.setAttribute("supplierName", company==null?"":company.getNameZh());
        }
        if (null != objectId) {
            Product entity = getManager().getByObjectId(objectId);
            //得到支付方式
            List<ProductAttached> payment = productAttachedManager.getByProductIdAndType(entity.getObjectId(),ProductAttached.TYPE_PAYMENT);
            //得到资质证书
            List<ProductAttached> qualifications = productAttachedManager.getByProductIdAndType(entity.getObjectId(),ProductAttached.TYPE_QUALIFICATION);
            //得到基本属性
            List<ProductAttribute> productAttributes = productAttributeManager.getByProductId(entity.getObjectId());
            for(ProductAttribute pa:productAttributes){
                pa.setAttribute(attributeManager.getByObjectId(pa.getAttributeId()));
                pa.setAttributeVals(attributeValManager.getByAttributeId(pa.getAttributeId()));
            }
            //显示下面的sku
            List<Sku> skus = skuManager.getByProductId(entity.getObjectId());
            for(Sku sku:skus){
                //产品属性
                String avs = sku.getAttributeVals();
                StringBuilder attributeValuesZh = new StringBuilder();
                StringBuilder attributeValuesEn = new StringBuilder();
                String[] attributeVals = avs.split(",");
                for(String attributeValueIdStr:attributeVals){
                    Long attributeValueId = Long.parseLong(attributeValueIdStr);
                    SkuAttributeAttached skuAttributeAttached = skuAttributeAttachedManager.getByProductIdAndAttributeValId(sku.getProductId(),attributeValueId);
                    if(skuAttributeAttached!=null){
                        Attribute att = attributeManager.getByObjectId(skuAttributeAttached.getAttributeId());
                        attributeValuesZh.append(att.getNameZh()).append(":").append(skuAttributeAttached.getNameZh()).append(",");
                        attributeValuesEn.append(att.getNameEn()).append(":").append(skuAttributeAttached.getNameEn()).append(",");
                    }
                }
                if(attributeVals.length>0&&attributeValuesZh.length()>0&&attributeValuesEn.length()>0){
                    sku.setAttributeValsZh(attributeValuesZh.substring(0, attributeValuesZh.length()-1));
                    sku.setAttributeValsEn(attributeValuesEn.substring(0, attributeValuesEn.length()-1));
                }

            }
            //显示产品子图
            List<ProductMedia> subpictures = productMediaManager.getByProductIdAndType(entity.getObjectId(),ProductMedia.MEDIA_TYPE_PICTURE);
            String subpictureStr = "";
            for(ProductMedia pm:subpictures){
                subpictureStr = subpictureStr+pm.getContentUrl()+",";
            }
            if(subpictures.size()>0){
                subpictureStr = subpictureStr.substring(0,subpictureStr.length()-1);
            }
            request.setAttribute("entity", entity);
            request.setAttribute("payment", payment);
            request.setAttribute("qualifications", qualifications);
            request.setAttribute("productAttributes", productAttributes);
            request.setAttribute("skus", skus);
            request.setAttribute("subpictures", subpictures);
            request.setAttribute("subpictureStr", subpictureStr);
            request.setAttribute("message", request.getParameter("message"));
        }
        //资质字典
        List<Dictionary> qualificationDic = dictionaryFacade.getDictionariesByDictionaryId(1015);
        I18NUtils.transformDict(qualificationDic, request);
        request.setAttribute("qualificationDic", qualificationDic);
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

    @Override
    protected String handleSave(HttpServletRequest request, ModelMap modelMap, Product t) throws Exception {
        //计算产品类型
        Long categoryId = t.getCategoryId();
        Category category = categoryManager.getByObjectId(categoryId);
        Company company = companyManager.getByObjectId(t.getSupplierId());//企业不能为空
        Long memberId = (Long) request.getSession().getAttribute(HYConstants.MEMBER_ID);
        t.setType(category.getType());
        t.setCountryId(company.getCountryId());
        t.setPlatform(Product.platform_supplier);
        //得到规格值
        Integer status = Integer.parseInt(request.getParameter("status"));
        String[] attributeValIds = request.getParameterValues("attributeValueId");
        String[] attributeValNameZh = null;
        String[] attributeValNameEn = null;
        if(attributeValIds!=null&&attributeValIds.length!=0){
            attributeValNameZh = new String[attributeValIds.length];
            attributeValNameEn = new String[attributeValIds.length];
            for(int i=0;i<attributeValIds.length;i++){
                attributeValNameZh[i]=request.getParameter("attributeValueNameZh_"+attributeValIds[i]);
                attributeValNameEn[i]=request.getParameter("attributeValueNameEn_"+attributeValIds[i]);
            }
        }

        //得到基本的规格属性值
        Map<String, Object> baseAttrs = WebUtils.getParametersStartingWith(request, "baseAttr_");
        //得到payment terms
        List<ProductAttached> pas = new ArrayList<ProductAttached>();//附属信息的集合
        String[] paymentWay = request.getParameterValues("paymentWay");
        if(paymentWay!=null&&paymentWay.length>0){
            for(String pw:paymentWay){
                ProductAttached pa = new ProductAttached();
                pa.setProductId(t.getObjectId());
                pa.setType(ProductAttached.TYPE_PAYMENT);
                pa.setValue(Long.valueOf(pw));
                pas.add(pa);
            }
        }
        //得到资质的信息
        String[] qualification = request.getParameterValues("qualification");
        if(qualification!=null&&qualification.length>0){
            for(String qualiValue:qualification){
                String remark = request.getParameter("qualificationRemark_"+qualiValue);
                ProductAttached pa = new ProductAttached();
                pa.setProductId(t.getObjectId());
                pa.setType(ProductAttached.TYPE_QUALIFICATION);
                pa.setRemark(remark);
                pa.setValue(Long.valueOf(qualiValue));
                pas.add(pa);
            }
        }
        //得到细节图
        String subPicture = request.getParameter("subPicture");
        //得到sku相关的信息
        String[] skuObjectId = request.getParameterValues("skuObjectId");
        String[] skuNo = request.getParameterValues("skuNo");
        String[] skuStatus = request.getParameterValues("skuStatus");
        String[] attributeValueIds = request.getParameterValues("attributeValueIds");
        String[] sellPriceZh = request.getParameterValues("sellPriceZh");
        String[] sellPriceEn = request.getParameterValues("sellPriceEn");
        productManager.save(memberId,t,attributeValIds,attributeValNameZh,attributeValNameEn,
                baseAttrs,pas,subPicture,skuObjectId,skuNo,skuStatus,attributeValueIds,sellPriceZh,sellPriceEn,status);
        productManager.update(t.getObjectId());
        return "redirect:edit/" + ((AbstractEntity) t).getObjectId() + getMessage("common.base.success", request)
                + "&" + appendAjaxParameter(request) + "&action=" + request.getParameter("action");
    }
    @RequestMapping("/listSku")
    public String skuList(HttpServletRequest request, HttpServletResponse response, Sku t, Integer backPage) {
        PageSearch page = prepareSkuPage(request);
        String result = handleSkuPage(request, page);
        request.setAttribute("pageSearch", page);
        return result;
    }

    protected String handleSkuPage(HttpServletRequest request, PageSearch page) {
        page.getFilters().add(new PropertyFilter(Sku.class.getName(), "EQI_sku.deleted", "0"));
        Member member = (Member) request.getSession().getAttribute(HYConstants.SESSION_MEMBER);
        if (member != null) {
            page.getFilters().add(new PropertyFilter(Product.class.getName(), "EQL_product.supplier_id", member.getCompanyId()==null?"":member.getCompanyId() + ""));
        }
        skuManager.searchSku(page);
        List<Object[]> list = page.getList();
        for (Object[] obj : list) {
            Long productId = ((BigInteger) obj[0]).longValue();
            Product product = productManager.getByObjectId(productId);
            // 产品类别
            product.setCategoryName(categoryManager.getCategoryNameByCategoryId(product.getCategoryId(), HYConstants.STATUS_VALID));
            // 产品属性
            // 判断product下面有几个sku,如果只有一个则不需要算属性
            Long count = skuManager.getCountByProductId(productId);
            if (count > 1) {
                String avs = (String) obj[6];
                StringBuilder attributeValues = new StringBuilder();
                String[] attributeVals = avs.split(",");
                for (String attributeValueIdStr : attributeVals) {
                    Long attributeValueId = Long.parseLong(attributeValueIdStr);
                    SkuAttributeAttached skuAttributeAttached = skuAttributeAttachedManager.getByProductIdAndAttributeValId(productId,
                            attributeValueId);
                    if (skuAttributeAttached != null) {
                        Attribute att = attributeManager.getByObjectId(skuAttributeAttached.getAttributeId());
                        attributeValues.append(att.getNameZh()).append(":").append(skuAttributeAttached.getNameZh()).append(",");
                    }
                }
                if (attributeValues.length() > 0) {
                    obj[6] = attributeValues.substring(0, attributeValues.length() - 1);
                } else {
                    obj[6] = "";
                }
            } else {
                obj[6] = "";
            }

        }
        request.getSession().setAttribute("action", "/member/product/listSku");
        List<Category> firstCategory = categoryManager.getAllCategory(1);
        I18NUtils.transform(firstCategory, request);
        request.setAttribute("firstCategory", firstCategory);
        return  "member/listSku";
    }

    protected PageSearch prepareSkuPage(HttpServletRequest request) {
        return PageUtils.preparePage(request, Sku.class, true);
    }
}
