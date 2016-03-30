package com.mvc.base.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;
@Entity(name="B_Advert_Position")
public class AdvertPosition extends BaseEntity{

    private static final long serialVersionUID = -8955135408305666858L;

    @Length(max=64)
    @NotNull
    private String positionName;
    @Length(max=32)
    @NotNull
    private String positionCode;

    private int height;

    private int width;

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getPositionCode() {
        return positionCode;
    }

    public void setPositionCode(String positionCode) {
        this.positionCode = positionCode;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

}
