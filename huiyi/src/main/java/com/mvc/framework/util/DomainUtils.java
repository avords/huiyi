package com.mvc.framework.util;

import com.mvc.config.ApplicationConfig;

public final class DomainUtils {
	private DomainUtils() {
	}
	public static final String STATIC_ROOT = "static";
	private static final String STATIC_DOMAIN;
	static{
	    STATIC_DOMAIN = ApplicationConfig.getDynamicDomain()+"/"+STATIC_ROOT+"/";
	}
	public static String getStaticDomain() {
		return STATIC_DOMAIN;
	}

	public static String getDynamicDomain() {
		return ApplicationConfig.getDynamicDomain();
	}
}
