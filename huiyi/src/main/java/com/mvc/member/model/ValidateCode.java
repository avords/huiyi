package com.mvc.member.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.Length;
import com.mvc.framework.model.BaseEntity;

@Entity(name = "B_VALIDATE_CODE")
public class ValidateCode extends BaseEntity {
	private static final long serialVersionUID = 6884040101098540766L;

	public static final int VALIDATE_TYPE_FIND = 1;

	public static final int VALIDATE_TYPE_REGISTER = 2;

	// 1验证码
	@Length(max = 6)
	private String code;

	// 2验证类型
	@NotNull
	private Integer type;

	// 3时间
	@NotNull
	private Date validateTime;

	// 4手机号或者邮箱
	@NotNull
	private String account;

	// 5会员Id
	private Long memberId;

	public String getAccount() {
		return account;
	}

	public String getCode() {
		return code;
	}

	public Long getMemberId() {
		return memberId;
	}

	public Integer getType() {
		return type;
	}

	public Date getValidateTime() {
		return validateTime;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setValidateTime(Date validateTime) {
		this.validateTime = validateTime;
	}

}