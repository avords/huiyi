package com.mvc.base.model;

import java.util.Date;
import javax.persistence.Entity;
import com.mvc.framework.model.BaseEntity;

/**
 * 附件
 *
 */
@Entity(name = "T_FILE")
public class File extends BaseEntity {

	private static final long serialVersionUID = 1L;

	// 文件路径
	private String filePath;
	// 文件名称
	private String fileName;
	// 优先级
	private Integer priority;

	// 对应的 用户id、企业id、服务的id、文章id、国家id（是否考虑产品的附件？）
	private Long entityId;
	// 存入的附件所属主体类型
	/**
	 * 字典表配置： 
	 * 0：用户id 
	 * 1：企业id 
	 * 2：服务id
	 * 3：文章id 
	 * 4：展会id
	 * 5：国家id
	 */
	private Integer entityType;
	// 图片类型
	/**
	 * 字典表配置： 
	 * 用户：0：头像；1：手持身份证认证图；2：护照认证图 
	 * 企业：0：企业LOGO；1：营业执照；2：税务登记证；3：组织机构代码；4：企业主图；5：企业非主图 
	 * 服务id or 文章：0：主图； 1：辅助主图； 2：详情主图；3：详情非主图（三个是否分开）
	 * 国家图标
	 */
	private Integer msgTyep;

	/**
	 * 系统记录
	 */
	// 状态
	private Integer status;
	// 是否删除
	private Integer delete;
	// 创建时间
	private Date createdDate;
	// 创建人
	private String createdBy;
	// 修改时间
	private Date updatedDate;
	// 修改人
	private String updatedBy;

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Long getEntityId() {
		return entityId;
	}

	public void setEntityId(Long entityId) {
		this.entityId = entityId;
	}

	public Integer getEntityType() {
		return entityType;
	}

	public void setEntityType(Integer entityType) {
		this.entityType = entityType;
	}

	public Integer getMsgTyep() {
		return msgTyep;
	}

	public void setMsgTyep(Integer msgTyep) {
		this.msgTyep = msgTyep;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getDelete() {
		return delete;
	}

	public void setDelete(Integer delete) {
		this.delete = delete;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
}