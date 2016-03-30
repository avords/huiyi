package com.mvc.util;

import org.htmlparser.Parser;
import org.htmlparser.beans.StringBean;

public class HtmlparserUtils {
    public static String extractText(String inputHtml) throws Exception {
        StringBean bean=new StringBean();
        Parser parser = Parser.createParser(inputHtml, "utf-8");
        parser.visitAllNodesWith(bean);
        parser.reset();
        return bean.getStrings();
      }

    public static void main(String[] args){
        try {
            String text = extractText("<p>你是什么呀<b>sfdd</b></p><img/>");
            System.out.println(text);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
