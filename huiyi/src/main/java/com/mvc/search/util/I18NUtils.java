package com.mvc.search.util;

import java.util.Locale;

public class I18NUtils {

    public static String transformDBField(String name,Locale locale){
        String fieldName = "";
        if (locale.getLanguage().equalsIgnoreCase("ZH")) {
            fieldName = name + "_zh";
        } else if (locale.getLanguage().equalsIgnoreCase("EN")) {
            fieldName = name + "_en";
        }
        return fieldName;
    }

    public static String transformName(String chineseName, String englishName, Locale locale) {
        String fieldName = "";
        if (locale.getLanguage().equalsIgnoreCase("ZH")) {
            fieldName = chineseName;
        } else if (locale.getLanguage().equalsIgnoreCase("EN")) {
            fieldName = englishName;
        }
        return fieldName;
    }

}
