package com.mvc.search.config;

public class SearchConfig {
    private static String httpUrl;
    private static String productCore;
    private static String companyCore;
    public static String getHttpUrl() {
        return httpUrl;
    }
    public void setHttpUrl(String httpUrl) {
        SearchConfig.httpUrl = httpUrl;
    }
    public static String getProductCore() {
        return productCore;
    }
    public void setProductCore(String productCore) {
        SearchConfig.productCore = productCore;
    }
    public static String getCompanyCore() {
        return companyCore;
    }
    public void setCompanyCore(String companyCore) {
        SearchConfig.companyCore = companyCore;
    }

}
