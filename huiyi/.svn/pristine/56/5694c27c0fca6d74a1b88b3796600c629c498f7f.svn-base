package com.mvc.member.model;

import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.BaseEntity;

@Entity(name="T_COMPANY_MEDIA")
public class CompanyMedia extends BaseEntity{
    private static final long serialVersionUID = 7712522012619548195L;
    public static final int MEDIA_TYPE_PICTURE = 1;     //图片
    public static final int MEDIA_TYPE_VIDEO = 2;       //视频
    public static final int MEDIA_TYPE_FILE = 3;        //附件
    @NotNull
    private Long companyId;//产品主表id
    @Length(max=50)
    private String name;//附件名称
    @NotNull
    private Integer type;//媒体类型
    @NotNull
    @Length(max=512)
    private String contentUrl;//媒体路径

 
    public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    public String getContentUrl() {
        return contentUrl;
    }
    public void setContentUrl(String contentUrl) {
        this.contentUrl = contentUrl;
    }


}
