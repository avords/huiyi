package com.mvc.service.model;

import javax.persistence.Entity;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.mvc.framework.model.AuditEntity;

/**
 * 服务申请列表
 *
 */
@Entity(name = "T_SERVICE_APPLY")
public class ServiceApply extends AuditEntity {

    private static final long serialVersionUID = 1L;
    /*
	 * 已提交
	 */
	public static final int STATUS_SUBMIT = 1;
	
	@NotNull
	private Long memberId;

	private Long companyId;
    // 服务id
	@NotNull
    private Long serviceId;
    // 申请详细内容
	@Length(max=256)
    private String content;
    /**
     * 字典表配置： 1：提交申請(待處理)2：撤銷申請3：已接受 4：已拒绝
     */
	@NotNull
    private Integer status;
	
	@Length(max=256)
	private String handleContent;//处理方案
	
	@Transient
    private Service service;
	
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getHandleContent() {
		return handleContent;
	}
	public void setHandleContent(String handleContent) {
		this.handleContent = handleContent;
	}
	public Service getService() {
		return service;
	}
	public void setService(Service service) {
		this.service = service;
	}
	
	
}