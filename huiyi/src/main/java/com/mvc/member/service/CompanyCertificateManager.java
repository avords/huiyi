package com.mvc.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.CompanyCertificate;
@Service
public class CompanyCertificateManager extends BaseService<CompanyCertificate, Long>{

    public void save(Long companyId, List<CompanyCertificate> pas) {
        this.deleteByWhere("companyId="+companyId);
        if(pas!=null){
            for(CompanyCertificate pa:pas){
                pa.setCompanyId(companyId);
                this.save(pa);
            }
        }
    }
    public List<CompanyCertificate> getByCompanyId(Long companyId) {
        String hql = "select A from "+CompanyCertificate.class.getName()+" A where A.companyId=?";
        return super.searchBySql(hql, companyId);
    }
}
