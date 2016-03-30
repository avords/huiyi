package com.mvc.product.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import com.mvc.HYConstants;
import com.mvc.framework.model.AbstractEntity;
import com.mvc.framework.model.Dictionary;
import com.mvc.framework.service.DictionaryFacade;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.FileUpDownUtils;
import com.mvc.framework.util.FrameworkContextUtils;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.util.UploadFile;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;
import com.mvc.product.model.Attribute;
import com.mvc.product.model.Category;
import com.mvc.product.model.Product;
import com.mvc.product.model.ProductAttached;
import com.mvc.product.model.ProductAttribute;
import com.mvc.product.model.ProductMedia;
import com.mvc.product.model.Sku;
import com.mvc.product.model.SkuAttributeAttached;
import com.mvc.product.model.SkuCheck;
import com.mvc.product.service.AttributeManager;
import com.mvc.product.service.AttributeValManager;
import com.mvc.product.service.CategoryManager;
import com.mvc.product.service.ProductAttachedManager;
import com.mvc.product.service.ProductAttributeManager;
import com.mvc.product.service.ProductManager;
import com.mvc.product.service.ProductMediaManager;
import com.mvc.product.service.SkuAttributeAttachedManager;
import com.mvc.product.service.SkuManager;

@Controller
@RequestMapping("/admin/product")
public class ProductController extends PageController<Product>{
    private static final String BASE_PATH="product/";
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
        request.setAttribute("categorys", categorys);
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

            //供应商名字
            Company company = companyManager.getByObjectId(entity.getSupplierId());
            if(company!=null){
                request.setAttribute("supplierName", company.getNameZh());
            }
            //判断产品是否有sku
            Long skuSize = skuManager.getCountByProductId(objectId);
            boolean isHaveSku = true;
            if(skuSize==0){
                isHaveSku = false;
            }
            request.setAttribute("isHaveSku", isHaveSku);
        }
        //资质字典
        List<Dictionary> qualificationDic = dictionaryFacade.getDictionariesByDictionaryId(1015);
        request.setAttribute("qualificationDic", qualificationDic);
        return getFileBasePath() + "edit" + getActualArgumentType().getSimpleName();
    }

    @Override
    protected String handleSave(HttpServletRequest request, ModelMap modelMap, Product t) throws Exception {
        //计算产品类型
        Long categoryId = t.getCategoryId();
        Category category = categoryManager.getByObjectId(categoryId);
        Company company = companyManager.getByObjectId(t.getSupplierId());//企业不能为空
        Long memberId = FrameworkContextUtils.getCurrentUserId();
        t.setType(category.getType());
        t.setCountryId(company.getCountryId());
        t.setPlatform(Product.platform_operation);
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

    @Override
    protected String handlePage(HttpServletRequest request, PageSearch page) {
        productManager.findBySql(page);
        List<Product> list = page.getList();
        for(Product p:list){
            p.setCategoryName(categoryManager.getCategoryNameByCategoryId(p.getCategoryId(), HYConstants.STATUS_VALID));
            Company company = companyManager.getByObjectId(p.getSupplierId());
            if(company!=null){
                p.setSupplierName(company.getNameZh());
            }
        }
        request.setAttribute("action", "/admin/product/page");
        List<Category> firstCategory = categoryManager.getAllCategory(1,HYConstants.STATUS_VALID);
        request.setAttribute("firstCategory", firstCategory);
        return getFileBasePath() + "list" + getActualArgumentType().getSimpleName();
    }

    @RequestMapping(value = "/check/{productId}")
    public String checkProduct(HttpServletRequest request, HttpServletResponse response, @PathVariable Long productId) throws Exception{
        String result =  this.handleEdit(request, response, productId);
        result = getFileBasePath() + "edit" + getActualArgumentType().getSimpleName()+"Check";
        return result;
    }
    @RequestMapping(value = "/checkPass/{productId}")
    public String checkPass(HttpServletRequest request, HttpServletResponse response, @PathVariable Long productId,ModelMap map) throws Exception {
        boolean result = true;
        String message = "整组操作成功!";
        //记录sku审核记录
        List<Sku> skusCheck = skuManager.getByProductId(productId);
        List<Long> skuIds = new ArrayList<Long>();
        for(Sku sk:skusCheck){
            if(!sk.getStatus().equals(Sku.PRODUCT_STATUS_WAIT_CHECK)){
                message = "一些产品审核失败，不在待审核状态!";
                result = false;
                break;
            }
            SkuCheck sc = new SkuCheck();
            sc.setExamineDate(new Date());
            sc.setExamineUserId(FrameworkContextUtils.getCurrentUserId());
            sc.setProductId(productId);
            sc.setSkuId(sk.getObjectId());
            sc.setType(SkuCheck.TYPE_PASS);
            skuManager.executeCheck(sk.getObjectId(),Sku.PRODUCT_STATUS_WAIT_SALE,sc);
            skuManager.update(sk.getObjectId());
        }
        map.addAttribute("result", result);
        map.addAttribute("message",message);
        return "jsonView";
    }
    @RequestMapping(value = "/checkNotPass/{productId}")
    public String checkNotPass(HttpServletRequest request, HttpServletResponse response, @PathVariable Long productId,Product t) throws Exception {
        request.setAttribute("productId", productId);
        return getFileBasePath()+"checkProduct";
    }
    @RequestMapping(value = "/saveCheckReason")
    public String saveCheckReason(HttpServletRequest request, HttpServletResponse response) throws Exception {
        boolean result = true;
        String message = "整组操作成功!";
        Long productId = Long.parseLong(request.getParameter("productId"));
        String remark = request.getParameter("remark");
      //记录sku审核记录
        List<Sku> skus = skuManager.getByProductId(productId);
        for(Sku sk:skus){
            if(!sk.getStatus().equals(Sku.PRODUCT_STATUS_WAIT_CHECK)){
                message = "一些产品审核失败，不在待审核状态!";
                result = false;
                break;
            }
            SkuCheck sc = new SkuCheck();
            sc.setExamineDate(new Date());
            sc.setExamineUserId(FrameworkContextUtils.getCurrentUserId());
            sc.setProductId(productId);
            sc.setSkuId(sk.getObjectId());
            sc.setCheckReason(remark);
            sc.setType(SkuCheck.TYPE_NOT_PASS);
            skuManager.executeCheck(sk.getObjectId(), Sku.PRODUCT_STATUS_CHECK_NOT, sc);
            skuManager.update(sk.getObjectId());
        }
        return "redirect:/admin/product/checkNotPass/"+productId+getMessage(message, request)
                + "&" + appendAjaxParameter(request)+"&result="+result;
    }
    @RequestMapping("/importProductPage")
    public String importProductPage(HttpServletRequest request, HttpServletResponse response){
        return "product/importProductPage";
    }
    @RequestMapping("/importProduct")
    public String importProduct(HttpServletRequest request, HttpServletResponse response) throws Exception{
        //导入
        UploadFile uploadFile = FileUpDownUtils.getUploadFile(request);
        byte[] fileData = FileUpDownUtils.getFileContent(uploadFile.getFile());
        String message = productManager.importProduct(fileData, Product.platform_operation);
        return "redirect:/admin/product/importProductPage?message="+URLEncoder.encode(message,"utf-8")+"&result=true&ajax=1";
    }
}
