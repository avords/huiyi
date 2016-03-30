package com.mvc.config;


public final class ApplicationConfig {

    private static final String DEFAULT_TEMP_DIR = System.getProperty("java.io.tmpdir");

    private static String imageUploadFolder;
    private static String mailFrom;
    private static String reportHost;
    private static String nodePassword;
    private static String nodeId;
    private static String basePath;
    private static String imageFile;
    private static String productFile;
    private static String tempDir = DEFAULT_TEMP_DIR;
    private static String dynamicDomain;

    public static String getImageUploadFolder() {
        return imageUploadFolder;
    }

    public void setImageUploadFolder(String imageUploadFolder) {
        ApplicationConfig.imageUploadFolder = imageUploadFolder;
    }

    public static String getMailFrom() {
        return mailFrom;
    }

    public void setMailFrom(String mailFrom) {
        ApplicationConfig.mailFrom = mailFrom;
    }

    public static String getReportHost() {
        return reportHost;
    }

    public void setReportHost(String reportHost) {
        ApplicationConfig.reportHost = reportHost;
    }

    public static String getNodePassword() {
        return nodePassword;
    }

    public void setNodePassword(String nodePassword) {
        ApplicationConfig.nodePassword = nodePassword;
    }

    public static String getNodeId() {
        return nodeId;
    }

    public void setNodeId(String nodeId) {
        ApplicationConfig.nodeId = nodeId;
    }

    public static String getTempDir() {
        return tempDir;
    }

    public void setTempDir(String tempDir) {
        ApplicationConfig.tempDir = tempDir;
    }

    public static String getBasePath() {
        return basePath;
    }

    public void setBasePath(String basePath) {
        ApplicationConfig.basePath = basePath;
    }

    public static String getImageFile() {
        return imageFile;
    }

    public void setImageFile(String imageFile) {
        ApplicationConfig.imageFile = imageFile;
    }

    public static String getProductFile() {
        return productFile;
    }

    public void setProductFile(String productFile) {
        ApplicationConfig.productFile = productFile;
    }

    public static String getDynamicDomain() {
        return dynamicDomain;
    }

    public void setDynamicDomain(String dynamicDomain) {
        ApplicationConfig.dynamicDomain = dynamicDomain;
    }

}
