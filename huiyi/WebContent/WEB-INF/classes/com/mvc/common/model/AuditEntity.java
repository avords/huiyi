package com.mvc.common.model;

import java.util.Date;

import javax.validation.constraints.NotNull;

import com.mvc.framework.model.BaseEntity;

public class AuditEntity extends BaseEntity {
    private static final long serialVersionUID = -473963780792692589L;
    @NotNull
    private Long createdBy;
    @NotNull
    private Date createdOn;

    private Date updatedOn;

    private Long updatedBy;

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Date getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(Date updatedOn) {
        this.updatedOn = updatedOn;
    }

    public Long getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(Long updatedBy) {
        this.updatedBy = updatedBy;
    }
}

