package com.mvc.member.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.CompanyCertificateFile;
@Service
public class CompanyCertificateFileManager extends BaseService<CompanyCertificateFile, Long>{

    public List<CompanyCertificateFile> getByCompanyId(Long companyId) {
        String hql = "select A from "+CompanyCertificateFile.class.getName()+" A where A.companyId=?";
        return super.searchBySql(hql, companyId);
    }

	public void save(Long companyId, String isoPicture) {
		this.deleteByWhere("companyId="+companyId);
        if(StringUtils.isNotBlank(isoPicture)){
            String[] subPictures = isoPicture.split(",");
            for(String sp:subPictures){
                CompanyCertificateFile ccf=new CompanyCertificateFile();
                ccf.setCompanyId(companyId);
                ccf.setFilePath(sp);
                this.save(ccf);
            }
        }
		
	}
}
