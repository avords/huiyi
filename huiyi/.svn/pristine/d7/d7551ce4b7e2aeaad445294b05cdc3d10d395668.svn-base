package com.mvc.search.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.HYConstants;
import com.mvc.framework.model.Dictionary;
import com.mvc.framework.service.DictionaryFacade;
import com.mvc.framework.util.LocaleUtils;
import com.mvc.search.common.ProductIndexConstants;
import com.mvc.search.model.Page;
import com.mvc.search.service.CompanySolrClientManager;
import com.mvc.search.service.ProductSolrClientManager;
import com.mvc.util.I18NUtils;

@Controller
@RequestMapping("/home/search")
public class SearchController {
    @Autowired
    private ProductSolrClientManager productSolrClientManager;
    @Autowired
    private CompanySolrClientManager companySolrClientManager;
    @Autowired
    private DictionaryFacade dictionaryFacade;

    @RequestMapping("")
    public String search(HttpServletRequest request,HttpServletResponse response,Integer type){
        Locale locale = LocaleUtils.getLocale(request);
        //会员级别的字典1402
        List<Dictionary> memberLevels = dictionaryFacade.getDictionariesByDictionaryId(1402);
        I18NUtils.transformDict(memberLevels, request);
        //资质证书的字典1015
        List<Dictionary> qualityCertificas = dictionaryFacade.getDictionariesByDictionaryId(1015);
        I18NUtils.transformDict(qualityCertificas, request);
        //企业性质的字典1013
        List<Dictionary> companyTypes = dictionaryFacade.getDictionariesByDictionaryId(1013);
        I18NUtils.transformDict(companyTypes, request);
        request.setAttribute("memberLevels", memberLevels);
        request.setAttribute("qualityCertificas", qualityCertificas);
        request.setAttribute("companyTypes", companyTypes);
        Page page = new Page();
        String currentPageStr = request.getParameter("ec_p");
        String queryWords = request.getParameter("queryWords");
        if(StringUtils.isNotBlank(currentPageStr)){
            page.setCurrent(Integer.valueOf(currentPageStr));
        }else{
            page.setCurrent(1);
        }
        page.setSize(15);
        page.setQueryWord(queryWords);
        //构造条件
        String[] conditions = request.getParameterValues("data-value");
        //去掉重复的conditions
        conditions = this.removeRepetition(conditions);
        page.setConditions(conditions);
        //将查询条件拼车链接
        String urlParam = this.createUrlParam(page);
        if(type==null||type==HYConstants.SEARCH_PRODUCT){
            //拼checkbox查询条件
            String pa = this.createSolrUrlParam(request,page);
            page.setQueryConditionsUrl(pa);
            productSolrClientManager.getByPage(page, locale);
            request.setAttribute("page", page);
            //将静态查询条件拼写到url
            String staticQueryUrlParam = this.createStaticQueryUrlParam(request, page);
            urlParam = urlParam+"&"+staticQueryUrlParam;
            request.setAttribute("urlParam", urlParam);
            return  "home/productList";
        }else if(type==HYConstants.SEARCH_COMPANY){
            //拼checkbox查询条件
            String pa = this.createSolrUrlParam(request,page);
            page.setQueryConditionsUrl(pa);
            companySolrClientManager.getByPage(page, locale);
            request.setAttribute("page", page);
            //将静态查询条件拼写到url
            String staticQueryUrlParam = this.createStaticQueryUrlParam(request, page);
            urlParam = urlParam+"&"+staticQueryUrlParam;
            request.setAttribute("urlParam", urlParam);
            return  "home/companyList";
        }
        return "";
    }

    private String createSolrUrlParam(HttpServletRequest request, Page page) {
        //得到checkbox值
        String[] memberLevel = request.getParameterValues("member_level");
        String isCheckFactory = request.getParameter("is_check_factory");
        String isAllow = request.getParameter("is_allow");
        String[] qualityCertifica = request.getParameterValues("quality_certifica");
        String[] companyType = request.getParameterValues("company_type");
        request.setAttribute("memberLevel", memberLevel);
        request.setAttribute("isCheckFactory", isCheckFactory);
        request.setAttribute("isAllow", isAllow);
        request.setAttribute("qualityCertifica", qualityCertifica);
        request.setAttribute("companyType", companyType);
        memberLevel = removeSpace(memberLevel);
        qualityCertifica = removeSpace(qualityCertifica);
        companyType = removeSpace(companyType);
        List<String> list = new ArrayList<String>();
        if(StringUtils.isNotBlank(isAllow)){
            list.add(ProductIndexConstants.IS_ALLOW+":"+isAllow);
        }
        if(StringUtils.isNotBlank(isCheckFactory)){
            list.add(ProductIndexConstants.IS_CHECK_FACTORY+":"+isCheckFactory);
        }
        if(memberLevel!=null&&memberLevel.length>0){
            StringBuilder strB = new StringBuilder("");
            strB.append("(");
            for(int i=0;i<memberLevel.length;i++){
                if(i==0){
                    strB.append(ProductIndexConstants.MEMBER_LEVEL+":"+memberLevel[i]);
                }else{
                    strB.append(" OR "+ProductIndexConstants.MEMBER_LEVEL+":"+memberLevel[i]);
                }
            }
            strB.append(")");
            list.add(strB.toString());
        }
        if(qualityCertifica!=null&&qualityCertifica.length>0){
            StringBuilder strB = new StringBuilder("");
            strB.append("(");
            for(int i=0;i<qualityCertifica.length;i++){
                if(i==0){
                    strB.append(ProductIndexConstants.QUALITY_CERTIFICA+":"+qualityCertifica[i]);
                }else{
                    strB.append(" OR "+ProductIndexConstants.QUALITY_CERTIFICA+":"+qualityCertifica[i]);
                }
            }
            strB.append(")");
            list.add(strB.toString());
        }
        if(companyType!=null&&companyType.length>0){
            StringBuilder strB = new StringBuilder("");
            strB.append("(");
            for(int i=0;i<companyType.length;i++){
                if(i==0){
                    strB.append(ProductIndexConstants.COMPANY_TYPE+":"+companyType[i]);
                }else{
                    strB.append(" AND "+ProductIndexConstants.COMPANY_TYPE+":"+companyType[i]);
                }
            }
            strB.append(")");
            list.add(strB.toString());
        }
        //拼链接
        StringBuilder strB = new StringBuilder("");
        for(int i=0;i<list.size();i++){
            if(list.size()==1){
                strB.append(list.get(i));
            }else{
                if(i==0){
                    strB.append(list.get(i));
                }else{
                    strB.append(" AND "+list.get(i));
                }
            }
        }
        return strB.toString();
    }

    private String createStaticQueryUrlParam(HttpServletRequest request, Page page){
        //得到checkbox值
        String[] memberLevel = request.getParameterValues("member_level");
        String isCheckFactory = request.getParameter("is_check_factory");
        String isAllow = request.getParameter("is_allow");
        String[] qualityCertifica = request.getParameterValues("quality_certifica");
        String[] companyType = request.getParameterValues("company_type");
        StringBuilder strB = new StringBuilder("");
        strB.append("is_allow="+(isAllow==null?"":isAllow)).append("&is_check_factory="+(isCheckFactory==null?"":isCheckFactory));
        if(memberLevel!=null){
            for(String i:memberLevel){
                strB.append("&member_level="+i);
            }
        }
        if(qualityCertifica!=null){
            for(String i:qualityCertifica){
                strB.append("&quality_certifica="+i);
            }
        }
        if(companyType!=null){
            for(String i:companyType){
                strB.append("&company_type="+i);
            }
        }
        return strB.toString();
    }
    private String createUrlParam(Page page) {
        String queryWord = page.getQueryWord();
        String[] conditions = page.getConditions();
        StringBuffer urlParam = new StringBuffer();
        urlParam.append("queryWords="+(queryWord==null?"":queryWord));
        if(conditions!=null){
            for(String condition:conditions){
                String[] cond = condition.split(":");
                if(cond.length>1){
                    urlParam.append("&data-value"+"="+cond[0]+":"+cond[1]);
                }
            }
        }
        return urlParam.toString();
    }

    private String[] removeRepetition(String[] conditions){
        if(conditions!=null){
            Set<String> set = new HashSet<String>();
            for(String con:conditions){
                set.add(con);
            }
            String[] s = new String[set.size()];
            return set.toArray(s);
        }
        return null;
    }
    private String[] removeSpace(String[] arry){
        String[] a = new String[0];
        if(arry==null){
            return a;
        }
        for(int i=0;i<arry.length;i++){
            if(StringUtils.isNotBlank(arry[i])){
                a= Arrays.copyOf(a, a.length+1);
                a[a.length-1] = arry[i];
            }
        }
        return a;
    }
}
