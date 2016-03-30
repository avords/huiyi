package com.mvc.product.service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mvc.HYConstants;
import com.mvc.framework.dao.HibernateWebUtils;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;
import com.mvc.member.model.History;
import com.mvc.product.model.Product;
import com.mvc.product.model.ProductAttached;
import com.mvc.product.model.Sku;
import com.mvc.util.I18NUtils;

@Service
public class ProductManager extends BaseService<Product, Long> {
    private static final Logger LOGGER = Logger.getLogger(ProductManager.class);
    @Autowired
    private SkuAttributeAttachedManager skuAttributeAttachedManager;
    @Autowired
    private ProductAttributeManager productAttributeManager;
    @Autowired
    private ProductAttachedManager productAttachedManager;
    @Autowired
    private ProductMediaManager productMediaManager;
    @Autowired
    private SkuManager skuManager;
    @Override
    public void save(Product entity) {
        entity.setMinSellPriceEn(0.0);
        entity.setMinSellPriceZh(0.0);
        entity.setMaxSellPriceEn(0.0);
        entity.setMaxSellPriceZh(0.0);
        super.save(entity);
    }
    public void save(Long memberId, Product product, String[] attributeValIds, String[] attributeValNameZh,
            String[] attributeValNameEn, Map<String, Object> baseAttrs, List<ProductAttached> pas,
            String subPicture, String[] skuObjectId, String[] skuNo, String[] skuStatus,String[] attributeValueIds,
            String[] sellPriceZh, String[] sellPriceEn, Integer status) {
        // 保存主产品
        boolean isCreate = true;
        if (product.getObjectId() != null) {
            isCreate = false;
        }
        product.setIsInSale(HYConstants.STATUS_NO);
        product.setHasChinese(true);
        product.setHasEnglish(true);
        this.save(product);
        Long productId = product.getObjectId();
        // 保存选择的sku规格,如果是新增
        if (isCreate) {
            skuAttributeAttachedManager.save(productId, attributeValIds, attributeValNameZh,
                    attributeValNameEn);
        }
        // 保存基本规格
        productAttributeManager.save(productId, baseAttrs);
        // 支付方式
        productAttachedManager.save(productId, pas);
        // 子图
        productMediaManager.save(productId, subPicture);
        // 保存sku
        if (attributeValueIds == null || attributeValueIds.length == 0) {
            attributeValueIds = new String[] { "0" };
            sellPriceZh = new String[] { product.getRmbPrice().toString() };
            sellPriceEn = new String[] { product.getUsdPrice().toString() };
            skuObjectId = new String[1];
            skuNo = new String[1];
        }
        skuManager.save(memberId,productId, skuObjectId, skuNo,skuStatus, attributeValueIds, sellPriceZh, sellPriceEn,
                status,isCreate);
    }

    public void updateIsInSale(Long productId) {
        String hql = "select count(A) from " + Sku.class.getName()
                + " A where A.status=? and A.deleted=0 and A.productId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, Sku.PRODUCT_STATUS_IN_SALE);
        query.setParameter(1, productId);
        Long count = (Long) query.list().get(0);
        Integer status = null;
        if (count > 0) {
            status = HYConstants.STATUS_YES;
        } else {
            status = HYConstants.STATUS_NO;
        }
        // 更新是否上架中,以及时间
        String hqlP = "update " + Product.class.getName()
                + " A set A.isInSale=?,A.updatedOn=? where A.objectId=?";
        query = getSession().createQuery(hqlP);
        query.setParameter(0, status);
        query.setParameter(1, new Date());
        query.setParameter(2, productId);
        query.executeUpdate();
    }

    public void updateFieldValue(Long productId, String fieldName, Object fieldValue) {
        String hql = "update " + Product.class.getName() + " A set A." + fieldName
                + "=? where A.objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, fieldName);
        query.setParameter(1, productId);
        query.executeUpdate();
    }

    public List<Product> getByCategoryId(Long categoryId, Long productId, Locale locale, int n) {
        String language = locale.getLanguage();
        String fieldName = "";
        if (language.equals("zh")) {
            fieldName = "nameZh";
        } else if (language.equals("en")) {
            fieldName = "nameEn";
        }
        String hql = "select A from " + Product.class.getName()
                + " A where A.categoryId=? and A.objectId!=? and (select count(B) from "
                + Sku.class.getName() + " B where B.productId=A.objectId and B.status=?)>0 and (A."
                + fieldName + " is not null and A." + fieldName + " !='')";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, categoryId);
        query.setParameter(1, productId);
        query.setParameter(2, Sku.PRODUCT_STATUS_IN_SALE);
        query.setFirstResult(0);
        query.setMaxResults(n);
        return query.list();
    }

    public String getSellPrice(Long productId, String language) {
        Product product = getByObjectId(productId);
        if(product==null){
            return "";
        }
        double minPrice = Double.valueOf(I18NUtils.transform(product, "minSellPrice", language));
        double maxPrice = Double.valueOf(I18NUtils.transform(product, "maxSellPrice", language));
        String price = "";
        DecimalFormat df = null;
        if (language.equalsIgnoreCase("ZH")) {
            df = new DecimalFormat("￥,###,##0.00");
        } else if (language.equalsIgnoreCase("EN")) {
            df = new DecimalFormat("$,###,##0.00");
        }
        if (Math.abs(minPrice - maxPrice) > 0.01 && df != null) {
            // 不相等
            price = df.format(minPrice) + "-" + df.format(maxPrice);
        } else {
            // 相等
            price = df.format(minPrice);
        }
        return price;
    }

    public List<Product> getMainProductsBySupplierId(Long supplierId) {
        String hql = "select A from " + Product.class.getName()
                + " A where A.supplierId=? and A.isMain=1 and (select count(B) from "
                + Sku.class.getName() + " B where B.productId=A.objectId and B.status=?)>0";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, supplierId);
        query.setParameter(1, Sku.PRODUCT_STATUS_IN_SALE);
        return query.list();
    }

    public List<Product> getProductsBySuppilerId(Long id) {
        String hql = "select A from " + Product.class.getName()
                + " A where A.supplierId=? and (select count(B) from " + Sku.class.getName()
                + " B where B.productId=A.objectId and B.status=?)>0";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, id);
        query.setParameter(1, Sku.PRODUCT_STATUS_IN_SALE);
        return query.list();
    }

    public List<Product> searchProducts(String keyword,Long memberId) {
        String sql = "SELECT C FROM " + Product.class.getName() + " C," + History.class.getName()
                + " D WHERE D.companyId="+memberId+" and D.entityId=C.objectId and D.isDelete=1";
        if (StringUtils.isNotEmpty(keyword)) {
            sql = sql + " AND C.nameZh LIKE '%" + keyword + "%' order by D.visitDate asc";
        }
        return searchBySql(sql);
    }

    public List<Long> getSupplierIds(Long categoryId) {
        String sql = "select DISTINCT(supplierId) from " + Product.class.getName()
                + " A where A.categoryId=?";
        Session session = getSession();
        Query query = session.createQuery(sql);
        query.setParameter(0, categoryId);
        List<Long> list = query.list();
        return list;
    }

    @Transactional
    public String importProduct(byte[] fileData, int platform) {
        StringBuilder message = new StringBuilder();
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
                String nameZh = getStringCellValue(row.getCell(1));
                nameZh = nameZh==null?"":nameZh;
                String subNameZh = getStringCellValue(row.getCell(2));
                subNameZh = subNameZh==null?"":subNameZh;
                String keywordsZh = getStringCellValue(row.getCell(3));
                keywordsZh = keywordsZh==null?"":keywordsZh;
                String nameEn = getStringCellValue(row.getCell(4));
                nameEn = nameEn==null?"":nameEn;
                String subNameEn = getStringCellValue(row.getCell(5));
                subNameEn = subNameEn==null?"":subNameEn;
                String keywordsEn = getStringCellValue(row.getCell(6));
                keywordsEn = keywordsEn==null?"":keywordsEn;
                Double rmbPrice = Double.parseDouble(getStringCellValue(row.getCell(7)));
                Double usdPrice = Double.parseDouble(getStringCellValue(row.getCell(8)));
                Integer isMain = Integer.valueOf(getStringCellValue(row.getCell(9)));
                Integer minBuyNumber = Integer.valueOf(getStringCellValue(row.getCell(10)));

                if(StringUtils.isBlank(nameZh)&&StringUtils.isBlank(nameEn)){
                    empty++;
                    continue;
                }
                Product product = new Product();
                product.setSupplierId(-1L);
                product.setBuyUnit(-1);
                product.setCategoryId(-1L);
                product.setDescriptionEn("待完善内容");
                product.setDescriptionZh("待完善内容");
                product.setCountryId(-1L);
                product.setType(Product.TYPE_COMMON_PRODUCT);
                product.setIsInSale(HYConstants.STATUS_NO);
                product.setPlatform(platform);

                product.setNameZh(nameZh);
                product.setNameEn(nameEn);
                product.setSubNameZh(subNameZh);
                product.setSubNameEn(subNameEn);
                product.setKeywordsZh(keywordsZh);
                product.setKeywordsEn(keywordsEn);
                product.setRmbPrice(rmbPrice);
                product.setUsdPrice(usdPrice);
                product.setIsMain(isMain);
                product.setMinBuyNumber(minBuyNumber);
                product.setHasChinese(product.hasChinese());
                product.setHasEnglish(product.hasEnglish());
                try{
                    this.save(product);
                    sucessed++;
                }catch(Exception e){
                    LOGGER.error(e);
                }
            }
            message.append("成功导入").append(sucessed).append("条记录,");
            message.append("共").append(sheet.getLastRowNum()+1 - empty - sucessed - 2)
                    .append("行数据异常，请检查!");
        } catch (IOException e) {
        }
        return message.toString();
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

    public void findBySql(PageSearch page) {
        String sql = "from p_product product "
                + "left join p_category category on (product.category_id=category.object_id) "
                + "left join t_company company on (product.supplier_id=company.object_id) where 1=1";
        String whereSql = HibernateWebUtils.buildSql(page.getFilters());
        Object[] params = HibernateWebUtils.getQueryParameter(page.getFilters());

        if (0 == page.getTotalCount()) {
            String countSql = "SELECT COUNT(*) "+sql+whereSql;
             SQLQuery query = getSession().createSQLQuery(countSql);
            HibernateWebUtils.setQueryParameter(query, params);
            List<Long> count = query.list();
            int total = count == null ? 0 : ((Number) count.get(0)).intValue();
            page.setTotalCount(total);
        }
        SQLQuery query = getSession().createSQLQuery("select product.* "+sql+whereSql+" order by product.object_id desc");
        HibernateWebUtils.setQueryParameter(query, params);
        query.addEntity("product", Product.class);
        List<Product> items = query.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list();
        page.setList(items);
    }

    public void updateMinAndMaxSellPrice(Long productId){
        String sql = "select min(s.sell_price_zh),min(s.sell_price_en),max(s.sell_price_zh),max(s.sell_price_en) from p_sku s "
                + "where s.deleted=0 and s.product_id=? and s.status=?";
        SQLQuery query = getSession().createSQLQuery(sql);
        query.setParameter(0, productId);
        query.setParameter(1, Sku.PRODUCT_STATUS_IN_SALE);
        List<Object[]> list = query.list();
        Object[] objs = list.get(0);
        sql = "update p_product set min_sell_price_zh=?,min_sell_price_en=?,max_sell_price_zh=?,max_sell_price_en=? "
                + "where object_id=?";
        query = getSession().createSQLQuery(sql);
        query.setParameter(0, objs[0]==null?0:objs[0]);
        query.setParameter(1, objs[1]==null?0:objs[1]);
        query.setParameter(2, objs[2]==null?0:objs[2]);
        query.setParameter(3, objs[3]==null?0:objs[3]);
        query.setParameter(4, productId);
        query.executeUpdate();
    }

    //取四个相似的产品
    public List<Product> getProductsByCategoryId(int size,Long categoryId) {
    	 String sql = "SELECT C FROM " + Product.class.getName() + " C," + Sku.class.getName()
                 + " D WHERE C.objectId=D.productId and D.status=5 and  C.categoryId= " +categoryId;
		return pageSearchBySql(Product.class, sql, 0, size);
	}
    
    //得到上架的产品
    public List<Product> getOnSellProducts() {
        String sql = "SELECT C FROM " + Product.class.getName() + " C," + Sku.class.getName()
                + " D WHERE C.objectId=D.productId and D.status=5";
        return searchBySql(sql);
    }
    
    
}
