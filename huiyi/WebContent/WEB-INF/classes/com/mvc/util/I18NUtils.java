package com.mvc.util;

import java.lang.reflect.Method;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import com.mvc.framework.util.LocaleUtils;

public class I18NUtils {

    public static String transform(Object t,String name ,HttpServletRequest request) throws RuntimeException {
        if (t != null) {
            Locale locale = LocaleUtils.getLocale(request);
            if (locale.getLanguage().equalsIgnoreCase("ZH")) {
                String fieldName = name + "Zh";
                Object value = invokeGet(fieldName, t);
                return value.toString();
            } else if (locale.getLanguage().equalsIgnoreCase("EN")) {
                String fieldName = name + "En";
                Object value = invokeGet(fieldName, t);
                return value.toString();
            }
        }
        return "";
    }

    public static Object invokeGet(String fieldName, Object t) throws RuntimeException {
        Class cl = t.getClass();
        String methodName = "get" + captureName(fieldName);
        Object result= null;
        try{
            Method method = cl.getDeclaredMethod(methodName, null);
            if(method != null){
                result = method.invoke(t, null);
            }
        }catch(Exception e){
            throw new RuntimeException(e);
        }
        return result;
    }

    public static void invokeSet(String fieldName, Object t, Object value) throws RuntimeException {
        if(value!=null){
            Class cl = t.getClass();
            String methodName = "set" + captureName(fieldName);
            try{
                Method method = cl.getDeclaredMethod(methodName, value.getClass());
                if(method != null){
                    method.invoke(t, value);
                }
            }catch(Exception e){
                throw new RuntimeException(e);
            }
        }
    }

    public static String captureName(String name) {
        char[] cs = name.toCharArray();
        cs[0] -= 32;
        return String.valueOf(cs);
    }
}
