package com.mvc.search.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.util.ClientUtils;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.stereotype.Service;

import com.mvc.search.common.CompanyIndexConstants;
import com.mvc.search.config.SearchConfig;
import com.mvc.search.model.CompanyDocument;
import com.mvc.search.model.CompanySearchData;
import com.mvc.search.model.FacetResult;
import com.mvc.search.model.MainProductView;
import com.mvc.search.model.Page;
import com.mvc.search.util.I18NUtils;

@Service
public class CompanySolrClientManager{

	private static final Logger LOGGER = Logger.getLogger(CompanySolrClientManager.class);

	private HttpSolrClient  httpSolrClient ;
	@PostConstruct
	private void getHttpSolrClient() {
	    String httpUrl = SearchConfig.getHttpUrl();
	    String core = SearchConfig.getCompanyCore();
	    httpSolrClient = new HttpSolrClient(httpUrl+core);
	    httpSolrClient.setConnectionTimeout(6000);
	    httpSolrClient.setParser(new XMLResponseParser()); // binary parser is used by default

	    httpSolrClient.setSoTimeout(6000); // socket read timeout
	    httpSolrClient.setDefaultMaxConnectionsPerHost(100);
	    httpSolrClient.setMaxTotalConnections(100);
	    httpSolrClient.setFollowRedirects(false); // defaults to false
	    httpSolrClient.setAllowCompression(true);
	}
    public void getByPage(Page page, Locale locale) {

        SolrQuery query = new SolrQuery();
        String[] conditions = page.getConditions();
        if (conditions != null) {
            for(String condition:conditions){
                query.addFilterQuery(condition);
            }
        }
        String queryStr = "";
        if(StringUtils.isNotBlank(page.getQueryWord())){
            queryStr = queryStr + I18NUtils.transformDBField(CompanyIndexConstants.SEARCH_TEXT, locale)+":"+ClientUtils.escapeQueryChars(page.getQueryWord());
        }else{
            queryStr = queryStr + I18NUtils.transformDBField(CompanyIndexConstants.SEARCH_TEXT, locale)+":*";
        }
        queryStr = queryStr +" AND "+I18NUtils.transformDBField(CompanyIndexConstants.NAME, locale)+":*";
        String pageQueryUrl = page.getQueryConditionsUrl();
        if(StringUtils.isNotBlank(pageQueryUrl)){
            queryStr = queryStr + " AND " +pageQueryUrl;
        }
        query.setQuery(queryStr);
        query.setFacet(true);// 开启facet
        query.addFacetField(new String[] {I18NUtils.transformDBField(CompanyIndexConstants.COUNTRY_NAME, locale),
                CompanyIndexConstants.QUALITY_CERTIFICAS,CompanyIndexConstants.NUM_EMPLOYEES});
        query.setFacetLimit(10);// 限制facet返回的数量
        query.setFacetMissing(false);// 不统计null的值
        query.setFacetMinCount(1);//
        // set default search index: search_text
        query.set("df", I18NUtils.transformDBField(CompanyIndexConstants.SEARCH_TEXT, locale));// 处理中文和英文
        // query.addSort("create_time", SolrQuery.ORDER.desc);
        query.setStart((int) page.getStart());
        query.setRows(page.getSize());
        query.setSort(CompanyIndexConstants.ID, SolrQuery.ORDER.desc);

        List<CompanyDocument> companys = new ArrayList<CompanyDocument>();
        try {
            QueryResponse rsp = httpSolrClient.query(query);
            SolrDocumentList docs = rsp.getResults(); // 返回文档
            List<FacetField> facets = rsp.getFacetFields();// 返回的facet列表

            Iterator<SolrDocument> iter = docs.iterator();
            while (iter.hasNext()) {
                CompanyDocument cd = new CompanyDocument();
                SolrDocument doc = iter.next();
                String idStr = doc.getFieldValue(CompanyIndexConstants.ID).toString();
                //Date date = (Date) doc.getFieldValue("updated_on");
                Long id = Long.parseLong(idStr);
                String name = doc.getFieldValue(I18NUtils.transformDBField(CompanyIndexConstants.NAME, locale))
                        .toString();
                cd.setName(name);
                Integer memberLevel = (Integer) doc.getFieldValue(CompanyIndexConstants.MEMBER_LEVEL);
                Integer isCheck = (Integer) doc.getFieldValue(CompanyIndexConstants.IS_CHECK_FACTORY);
                Integer isAllow = (Integer) doc.getFieldValue(CompanyIndexConstants.IS_ALLOW);
                //主产品字符串
                String mainProductStr = (String) doc.getFieldValue(I18NUtils.transformDBField(CompanyIndexConstants.MAIN_PRODUCTS, locale));
                cd.setMainProductStr(mainProductStr);
                //公司类型多值得处理
                Object companyType = doc.getFieldValue(CompanyIndexConstants.COMPANY_TYPE);
                if(companyType instanceof List){
                    List<Integer> temp = (List<Integer>) companyType;
                    cd.setCompanyType(temp);
                }else{
                    List<Integer> temp = new ArrayList<Integer>();
                    if(companyType!=null){
                        temp.add((Integer)companyType);
                    }
                    cd.setCompanyType(temp);
                }
                String qualityCertifica = (String) doc.getFieldValue(CompanyIndexConstants.QUALITY_CERTIFICA);
                //已通过的资质审核
                Object auditProfile = doc.getFieldValue(CompanyIndexConstants.AUDIT_PROFILE);
                if(auditProfile instanceof List){
                    List<Integer> temp = (List<Integer>) auditProfile;
                    cd.setAuditProfile(temp);
                }else{
                    List<Integer> temp = new ArrayList<Integer>();
                    if(auditProfile!=null){
                        temp.add((Integer)auditProfile);
                    }
                    cd.setAuditProfile(temp);
                }
                String countryName = (String) doc.getFieldValue(CompanyIndexConstants.COUNTRY_NAME);
                cd.setId(id);//id
                cd.setMemberLevel(memberLevel);
                cd.setIsCheck(isCheck);
                cd.setIsAllow(isAllow);
                cd.setQualityCertifica(qualityCertifica);
                cd.setCountryName(countryName);
                //构建主产品
                Object obj = doc.getFieldValue(CompanyIndexConstants.MAIN_PRODUCT_ID);
                if(obj instanceof List){
                    List<Long> mainProductIds = (List<Long>) obj;
                    if(mainProductIds!=null&&mainProductIds.size()>0){
                        List<String> mainProductNames = (List<String>) doc.getFieldValue(I18NUtils.transformDBField(CompanyIndexConstants.MAIN_PRODUCT_NAME, locale));
                        List<String> mainProductPictures = (List<String>) doc.getFieldValue(CompanyIndexConstants.MAIN_PRODUCT_PICTURE_PATH);
                        List<MainProductView> mainProducts = new ArrayList<MainProductView>();
                        for(int i=0;i<mainProductIds.size();i++){
                            MainProductView mpv = new MainProductView();
                            mpv.setMainPicture(mainProductPictures.get(i));
                            mpv.setName(mainProductNames.get(i));
                            mpv.setProductId(mainProductIds.get(i));
                            mainProducts.add(mpv);
                        }
                        cd.setMainProducts(mainProducts);
                    }
                }else{
                    if(obj!=null){
                        List<MainProductView> mainProducts = new ArrayList<MainProductView>();
                        MainProductView mpv = new MainProductView();
                        mpv.setMainPicture((String)doc.getFieldValue(CompanyIndexConstants.MAIN_PRODUCT_PICTURE_PATH));
                        mpv.setName((String)doc.getFieldValue(I18NUtils.transformDBField(CompanyIndexConstants.MAIN_PRODUCT_NAME, locale)));
                        mpv.setProductId((Long)obj);
                        mainProducts.add(mpv);
                        cd.setMainProducts(mainProducts);
                    }else{
                        cd.setMainProducts(new ArrayList<MainProductView>());
                    }
                }

                companys.add(cd);
            }
            List<FacetResult> companyAttributeFacets = new ArrayList<FacetResult>();
            List<FacetResult> leftSideAttributeFacets = new ArrayList<FacetResult>();
            for (FacetField facetField : facets) {
                String fieldName = facetField.getName();
                List<Count> counts = facetField.getValues();
                FacetResult fr = new FacetResult();
                if(I18NUtils.transformDBField(CompanyIndexConstants.COUNTRY_NAME, locale).equalsIgnoreCase(fieldName)){
                    String name = I18NUtils.transformName("国家","Country", locale);
                    fr.setName(name);
                }else if(CompanyIndexConstants.QUALITY_CERTIFICAS.equalsIgnoreCase(fieldName)){
                    String name = I18NUtils.transformName("资质证书","Certification", locale);
                    fr.setName(name);
                }else if(CompanyIndexConstants.NUM_EMPLOYEES.equalsIgnoreCase(fieldName)){
                    String name = I18NUtils.transformName("企业规模","No. of Employees", locale);
                    fr.setName(name);
                }else{
                    fr.setName(fieldName);
                }
                fr.setFieldName(fieldName);//字段名称
                for (Count count : counts) {
                    fr.getSubFacetResults().add(new FacetResult(count.getName(), fieldName,count.getName(),count.getCount()));
                }
                if(fr.getSubFacetResults().size()>0){
                    if(I18NUtils.transformDBField(CompanyIndexConstants.COUNTRY_NAME, locale).equalsIgnoreCase(fieldName)){
                        companyAttributeFacets.add(fr);
                    }else{
                        leftSideAttributeFacets.add(fr);
                    }
                }
            }
            CompanySearchData csd = new CompanySearchData();
            csd.setCompanys(companys);
            csd.setCompanyAttributeFacets(companyAttributeFacets);
            csd.setLeftSideAttributeFacets(leftSideAttributeFacets);
            page.setData(csd);
            page.setCount(docs.getNumFound());

        } catch (Exception e) {
            LOGGER.error("从solr根据Page查询产品分页文档时遇到错误", e);
        }

    }

    /**
     * 增量/全量建立索引 。
     * @param delta ture，增量建立索引；false，重建所有索引
     */
    public void buildIndex(boolean delta) {
        SolrQuery query = new SolrQuery();
        // 指定RequestHandler，默认使用/select
        query.setRequestHandler("/dataimport");

        String command = delta ? "delta-import" : "full-import";
        String clean = delta ? "false" : "true";
        String optimize = delta ? "false" : "true";

        query.setParam("command", command).setParam("clean", clean).setParam("commit", "true").setParam("optimize",
                optimize);
        try {
            httpSolrClient.query(query);
        } catch (Exception e) {
            LOGGER.error("建立供应商索引时遇到错误，delta:" + delta, e);
        }
    }
}
