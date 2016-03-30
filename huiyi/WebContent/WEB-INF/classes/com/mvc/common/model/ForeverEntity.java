package com.mvc.common.model;

public class ForeverEntity extends AuditEntity {
    private static final long serialVersionUID = 6147049793947304975L;
    public static final int DELETED_YES = 1;
    public static final int DELETED_NO = 0;

    private Integer deleted;

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }
}
