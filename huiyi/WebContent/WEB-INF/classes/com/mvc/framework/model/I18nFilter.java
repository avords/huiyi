package com.mvc.framework.model;

import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotNull;


/**
 * 国际化查询过滤
 * 增加是否包含中文、英文内容的字段，提升查询速度
 * @author bob.pu
 *
 */
@MappedSuperclass
public abstract class I18nFilter extends I18n {
	
	@NotNull
	private Boolean hasChinese;
	@NotNull
	private Boolean hasEnglish;
	
	public Boolean getHasCheninese() {
		return hasChinese;
	}
	public Boolean getHasEnglish() {
		return hasEnglish;
	}
	public void setHasEnglish(Boolean hasEnglish) {
		this.hasEnglish = hasEnglish;
	}
	public Boolean getHasChinese() {
		return hasChinese;
	}
	public void setHasChinese(Boolean hasChinese) {
		this.hasChinese = hasChinese;
	}
}
