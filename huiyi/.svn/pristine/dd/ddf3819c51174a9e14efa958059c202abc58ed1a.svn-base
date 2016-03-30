package com.mvc.search.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class FacetResult implements Serializable{

    private static final long serialVersionUID = -6283504858891768509L;
    private String name;//名称
    private long count;//数量
    private String fieldName;//索引字段名称
    private String fieldValue;//索引字段值
    private List<FacetResult> subFacetResults;
    public FacetResult(){}
    public FacetResult(String name,long count){
        this.name = name;
        this.count = count;
    }
    public FacetResult(String name,String fieldName,String fieldValue,long count){
        this.name = name;
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
        this.count = count;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public long getCount() {
        return count;
    }
    public void setCount(long count) {
        this.count = count;
    }
    public List<FacetResult> getSubFacetResults() {
        if(subFacetResults==null){
            subFacetResults = new ArrayList<FacetResult>();
        }
        return subFacetResults;
    }
    @Override
    public String toString(){
        return this.name+":"+this.count;
    }
    public String getFieldName() {
        return fieldName;
    }
    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }
    public static void main(String[] args) {
        FacetResult f = new FacetResult();
        f.setName("品牌");
        f.setCount(3);
        f.getSubFacetResults().add(new FacetResult("康佳", 12));
        System.out.println(f.toString()+f.getSubFacetResults());
    }
    public String getFieldValue() {
        return fieldValue;
    }
    public void setFieldValue(String fieldValue) {
        this.fieldValue = fieldValue;
    }

}