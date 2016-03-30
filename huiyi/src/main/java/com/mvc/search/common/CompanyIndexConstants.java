package com.mvc.search.common;

/**
 * Solr 索引名称
 * @author yandongquan
 *
 */
public interface CompanyIndexConstants {
    /**
     * 企业基本信息索引
     */
    public static final String ID = "id";//id
    public static final String NAME = "name";//企业名称
    public static final String MEMBER_LEVEL = "member_level";//会员级别
    public static final String IS_CHECK_FACTORY = "is_check_factory";//是否已验厂
    public static final String IS_ALLOW = "is_allow";//是否胥口
    public static final String COMPANY_TYPE = "company_type";//企业类型
    public static final String QUALITY_CERTIFICA = "quality_certifica";//资质证书，以逗号分隔的字符串
    public static final String DESCRIPTION = "description";//描述，说明
    public static final String COUNTRY_NAME = "country_name";//国家
    public static final String UPDATE_DATE = "update_date";//更新时间
    public static final String AUDIT_PROFILE = "audit_profile";//通过了哪些资质证书type
    /**
     * 主产品的索引
     */
    public static final String MAIN_PRODUCT_ID = "main_product_id";//主产品id
    public static final String MAIN_PRODUCT_NAME = "main_product_name";//主产品名称
    public static final String MAIN_PRODUCT_PICTURE_PATH = "main_product_picture_path";//主产品主图
    public static final String MAIN_PRODUCTS = "main_products";//主产品id

    public static final String SEARCH_TEXT = "search_text";

    public static final String QUALITY_CERTIFICAS = "quality_certificas";//证书
    public static final String NUM_EMPLOYEES = "num_employees";//企业规模
}
