package com.mvc.member.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.CompanyMedia;
@Service
public class CompanyMediaManager extends BaseService<CompanyMedia, Long>{

    public void save(Long companyId, String subPicture) {
        this.deleteByWhere("companyId="+companyId);
        if(StringUtils.isNotBlank(subPicture)){
            String[] subPictures = subPicture.split(",");
            for(String sp:subPictures){
                CompanyMedia pm = new CompanyMedia();
                pm.setCompanyId(companyId);
                pm.setType(CompanyMedia.MEDIA_TYPE_PICTURE);
                pm.setContentUrl(sp);
                this.save(pm);
            }
        }
    }

    public List<CompanyMedia> getBycompanyIdAndType(Long companyId, Integer type) {
        String hql = "select A from "+CompanyMedia.class.getName()+" A where A.companyId=? and A.type=?";
        return super.searchBySql(hql, companyId,type);
    }

}
