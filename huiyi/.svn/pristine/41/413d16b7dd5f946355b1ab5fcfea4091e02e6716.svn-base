package com.mvc.cms.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.I18nFilter;

/**
 * 栏目表
 **/
@Entity(name = "CMS_CHANNEL")
public class Channel extends I18nFilter {

	private static final long serialVersionUID = -5145948516232308244L;
	
	public static final String POSITIONCODE_JISHUZHISHI ="jszs";
	public static final String POSITIONCODE_LAWS ="laws";
	// 文章标题
	@NotNull
	@Length(max = 64)
	private String nameZh;
	@NotNull
	@Length(max = 64)
	private String nameEn;
	// 父栏目,顶级栏目为-1
	@NotNull
	private Long parentId;

	// 栏目排序
	private Double priority;

	// 栏目分类:一级/二级/三级分类
	@NotNull
	private Integer level;

	// 栏目编号:
	@Length(max = 32)
	private String positionCode;

	// 状态:是否有效
	@NotNull
	private Integer status;

	// 备注
	@Length(max = 128)
	private String remark;

	// 完整名称
	@NotNull
	private String fullName;

	/**
	 * SEO: KEYWORDS
	 */
	@Length(max = 128)
	private String keywords;
	/**
	 * SEO:DESCRIPTION
	 */
	@Length(max = 256)
	private String description;

	@Transient
	private List<Content> contents;
	
	@Transient
	private Content firstContent;

	public Content getFirstContent() {
		return firstContent;
	}

	public void setFirstContent(Content firstContent) {
		this.firstContent = firstContent;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Double getPriority() {
		return priority;
	}

	public void setPriority(Double priority) {
		this.priority = priority;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getPositionCode() {
		return positionCode;
	}

	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getNameZh() {
		return nameZh;
	}

	public void setNameZh(String nameZh) {
		this.nameZh = nameZh;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}
}
