package com.mvc.framework.model;

import org.apache.commons.lang.StringUtils;

import com.mvc.framework.model.BaseEntity;

/**
 * 国际化实体基类
 * 用于判断记录是否包含中文或英文
 * @author bob.pu
 *
 */
public abstract class I18n extends BaseEntity {
	
	/**
	 * 是否包含中文内容
	 * @return
	 */
	public boolean hasChinese(){
		return StringUtils.isNotBlank(getNameZh());
	}
	
	/**
	 * 是否包含英文内容
	 * @return
	 */
	public boolean hasEnglish(){
		return StringUtils.isNotBlank(getNameEn());
	}
	
	public abstract String getNameZh();
	
	public abstract String getNameEn();
	
}
