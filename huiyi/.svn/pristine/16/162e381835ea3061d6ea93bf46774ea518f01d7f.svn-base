package com.mvc.search.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.PivotField;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.client.solrj.util.ClientUtils;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.util.NamedList;
import org.springframework.stereotype.Service;

import com.mvc.search.common.ProductIndexConstants;
import com.mvc.search.config.SearchConfig;
import com.mvc.search.model.FacetResult;
import com.mvc.search.model.Page;
import com.mvc.search.model.ProductDocument;
import com.mvc.search.model.ProductSearchData;
import com.mvc.search.util.I18NUtils;

@Service
public class ProductSolrClientManager {

    private static final Logger LOGGER = Logger.getLogger(ProductSolrClientManager.class);

    private HttpSolrClient httpSolrClient;

    @PostConstruct
    private void getHttpSolrClient() {
        String httpUrl = SearchConfig.getHttpUrl();
        String core = SearchConfig.getProductCore();
        httpSolrClient = new HttpSolrClient(httpUrl + core);
        httpSolrClient.setConnectionTimeout(6000);
        httpSolrClient.setParser(new XMLResponseParser()); // binary parser is
                                                           // used by default
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
            queryStr = queryStr + I18NUtils.transformDBField(ProductIndexConstants.SEARCH_TEXT, locale)+":"+ClientUtils.escapeQueryChars(page.getQueryWord());
        }else{
            queryStr = queryStr + I18NUtils.transformDBField(ProductIndexConstants.SEARCH_TEXT, locale)+":*";
        }
        queryStr = queryStr +" AND "+I18NUtils.transformDBField(ProductIndexConstants.NAME, locale)+":*";
        String pageQueryUrl = page.getQueryConditionsUrl();
        if(StringUtils.isNotBlank(pageQueryUrl)){
            queryStr = queryStr + " AND " +pageQueryUrl;
        }
        query.setQuery(queryStr);
        query.setFacet(true);// 开启facet
        query.addFacetField(new String[] { I18NUtils.transformDBField(ProductIndexConstants.SKU_ATTRIBUTE_NAME, locale),
                I18NUtils.transformDBField(ProductIndexConstants.COUNTRY_NAME, locale),
                I18NUtils.transformDBField(ProductIndexConstants.PRODUCT_ATTRIBUTE_NAME, locale) });
        //facet.pivot高级查询
        String categoryFacetName = I18NUtils.transformDBField(ProductIndexConstants.CATEGORY_NAME1, locale)+","+I18NUtils.transformDBField(ProductIndexConstants.CATEGORY_NAME2, locale);
        query.add("facet.pivot", categoryFacetName);
        query.setFacetLimit(10);// 限制facet返回的数量
        query.setFacetMissing(false);// 不统计null的值
        query.setFacetMinCount(1);//
        // set default search index: search_text
        query.set("df", I18NUtils.transformDBField(ProductIndexConstants.SEARCH_TEXT, locale));// 处理中文和英文
        // query.addSort("create_time", SolrQuery.ORDER.desc);
        query.setStart((int) page.getStart());
        query.setRows(page.getSize());
        query.setSort(ProductIndexConstants.ID, SolrQuery.ORDER.desc);
        // 设置高亮
/*        query.setHighlight(false);// 开启高亮组件
        query.addHighlightField(I18NUtils.transformDBField(ProductIndexConstants.NAME, locale));// 高亮字段
        query.addHighlightField(I18NUtils.transformDBField(ProductIndexConstants.SUB_NAME, locale));// 高亮字段
        query.setHighlightSimplePre("<font color='red'>");// 标记，高亮关键字前缀
        query.setHighlightSimplePost("</font>");// 后缀
        query.setHighlight(true).setHighlightSnippets(1); // 获取高亮分片数，一般搜索词可能分布在文章中的不同位置，其所在一定长度的语句即为一个片段，默认为1，但根据业务需要有时候需要多取出几个分片。
                                                          // -
                                                          // 此处设置决定下文中titleList,
                                                          // contentList中元素的个数
        query.setHighlightFragsize(150);// 每个分片的最大长度，默认为100。适当设置此值，如果太小，高亮的标题可能会显不全；设置太大，摘要可能会太长。
*/
        List<ProductDocument> products = new ArrayList<ProductDocument>();
        try {
            QueryResponse rsp = httpSolrClient.query(query);
            SolrDocumentList docs = rsp.getResults(); // 返回文档
            List<FacetField> facets = rsp.getFacetFields();// 返回的facet列表
            NamedList<List<PivotField>> facetPivots = rsp.getFacetPivot();//返回的facet pivot列表
            Map<String, Map<String, List<String>>> highlightMap = rsp.getHighlighting();// 获取所有高亮的字段

            Iterator<SolrDocument> iter = docs.iterator();
            while (iter.hasNext()) {
                ProductDocument pd = new ProductDocument();
                SolrDocument doc = iter.next();
                String idStr = doc.getFieldValue(ProductIndexConstants.ID).toString();
                //Date date = (Date) doc.getFieldValue("updated_on");
                Long id = Long.parseLong(idStr);
                String mainPicture = doc.getFieldValue(ProductIndexConstants.MAIN_PICTURE).toString();
                Double minPrice = (Double) doc
                        .getFieldValue(I18NUtils.transformDBField(ProductIndexConstants.MIN_PRICE, locale));
                String name = doc.getFieldValue(I18NUtils.transformDBField(ProductIndexConstants.NAME, locale))
                        .toString();
                String subName = doc.getFieldValue(I18NUtils.transformDBField(ProductIndexConstants.SUB_NAME, locale))
                        .toString();
                pd.setName(name);
                pd.setSubName(subName);
                pd.setMainPicture(mainPicture);
                pd.setMinPrice(minPrice);
                pd.setId(id);
                Integer minBuyNumber = doc.getFieldValue(ProductIndexConstants.MIN_BUY_NUMBER)==null?null:Integer.parseInt(doc.getFieldValue(ProductIndexConstants.MIN_BUY_NUMBER).toString());
                pd.setMinBuyNumber(minBuyNumber);
                Long supplierId = doc.getFieldValue(ProductIndexConstants.SUPPLIER_ID)==null?null:Long.valueOf(doc.getFieldValue(ProductIndexConstants.SUPPLIER_ID).toString());
                pd.setSupplierId(supplierId);
                //企业信息
                String companyName = doc.getFieldValue(I18NUtils.transformDBField(ProductIndexConstants.COMPANY_NAME, locale))==null?"":doc.getFieldValue(I18NUtils.transformDBField(ProductIndexConstants.COMPANY_NAME, locale)).toString();
                Integer memberLevel = doc.getFieldValue(ProductIndexConstants.COMPANY_NAME)==null?null:Integer.valueOf(doc.getFieldValue(ProductIndexConstants.COMPANY_NAME).toString());
                Integer isCheckFactory = doc.getFieldValue(ProductIndexConstants.IS_CHECK_FACTORY)==null?null:Integer.valueOf(doc.getFieldValue(ProductIndexConstants.IS_CHECK_FACTORY).toString());
                String companyCertifica = doc.getFieldValue(ProductIndexConstants.COMPANY_CERTIFICA)==null?"":doc.getFieldValue(ProductIndexConstants.COMPANY_CERTIFICA).toString();
                pd.setCompanyName(companyName);
                pd.setMemberLevel(memberLevel);
                pd.setIsCheckFactory(isCheckFactory);
                pd.setCompanyCertifica(companyCertifica);
                products.add(pd);
            }
            // 对facet的处理
            List<FacetResult> skuAttributeFacets = new ArrayList<FacetResult>();
            List<FacetResult> productAttributeFacets = new ArrayList<FacetResult>();
            for (FacetField facetField : facets) {
                String fieldName = facetField.getName();
                List<Count> counts = facetField.getValues();
                Map<String, List<FacetResult>> mapSku = new HashMap<String, List<FacetResult>>();
                Map<String, List<FacetResult>> mapProduct = new HashMap<String, List<FacetResult>>();
                if (I18NUtils.transformDBField(ProductIndexConstants.SKU_ATTRIBUTE_NAME, locale).equalsIgnoreCase(fieldName)
                        || I18NUtils.transformDBField(ProductIndexConstants.PRODUCT_ATTRIBUTE_NAME, locale)
                                .equalsIgnoreCase(fieldName)) {
                    for (Count count : counts) {
                        if (StringUtils.isNotBlank(count.getName())) {
                            String[] attrVals = count.getName().split("_");
                            if (attrVals.length > 1) {
                                if (I18NUtils.transformDBField(ProductIndexConstants.SKU_ATTRIBUTE_NAME, locale)
                                        .equals(fieldName)) {
                                    List<FacetResult> list = mapSku.get(attrVals[0]);
                                    if (list == null) {
                                        list = new ArrayList<FacetResult>();
                                    }
                                    list.add(new FacetResult(attrVals[1],fieldName,attrVals[0]+"_"+attrVals[1], count.getCount()));
                                    mapSku.put(attrVals[0], list);
                                } else {
                                    List<FacetResult> list = mapProduct.get(attrVals[0]);
                                    if (list == null) {
                                        list = new ArrayList<FacetResult>();
                                    }
                                    list.add(new FacetResult(attrVals[1],fieldName,attrVals[0]+"_"+attrVals[1],count.getCount()));
                                    mapProduct.put(attrVals[0], list);
                                }

                            }
                        }
                    }
                    for (Entry<String, List<FacetResult>> e : mapSku.entrySet()) {
                        FacetResult fr = new FacetResult();
                        fr.setName(e.getKey());
                        fr.setFieldName(fieldName);
                        fr.getSubFacetResults().addAll(e.getValue());
                        skuAttributeFacets.add(fr);
                    }
                    for (Entry<String, List<FacetResult>> e : mapProduct.entrySet()) {
                        FacetResult fr = new FacetResult();
                        fr.setName(e.getKey());
                        fr.setFieldName(fieldName);
                        fr.getSubFacetResults().addAll(e.getValue());
                        productAttributeFacets.add(fr);
                    }
                } else {
                    FacetResult fr = new FacetResult();
                    if(I18NUtils.transformDBField(ProductIndexConstants.COUNTRY_NAME, locale).equalsIgnoreCase(fieldName)){
                        String name = I18NUtils.transformName("国家","country", locale);
                        fr.setName(name);
                    }else{
                        fr.setName(fieldName);
                    }
                    fr.setFieldName(fieldName);//字段名称
                    for (Count count : counts) {
                        fr.getSubFacetResults().add(new FacetResult(count.getName(), fieldName,count.getName(),count.getCount()));
                    }
                    if(fr.getSubFacetResults().size()>0){
                        productAttributeFacets.add(fr);
                    }
                }

            }
            //对facet pivot的处理
            List<FacetResult> categoryFacets = new ArrayList<FacetResult>();
            if(facetPivots != null){
                List<PivotField> pivotList =facetPivots.get(categoryFacetName);
                if(pivotList != null){
                    for(PivotField pivot:pivotList){
                        FacetResult  fr = new FacetResult(pivot.getValue().toString(), pivot.getField(),pivot.getValue().toString(),pivot.getCount());
                        List<PivotField> fieldList = pivot.getPivot();
                        if(fieldList != null){
                            for(PivotField field:fieldList){
                                fr.getSubFacetResults().add(new FacetResult(field.getValue().toString(),field.getField(),field.getValue().toString(), field.getCount()));
                            }
                        }
                        categoryFacets.add(fr);
                    }
                }
            }
            ProductSearchData psd = new ProductSearchData();
            psd.setProducts(products);
            psd.setSkuAttributeFacets(skuAttributeFacets);
            psd.setProductAttributeFacets(productAttributeFacets);
            psd.setCategoryFacets(categoryFacets);
            page.setData(psd);
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
            LOGGER.error("建立产品索引时遇到错误，delta:" + delta, e);
        }
    }
}
