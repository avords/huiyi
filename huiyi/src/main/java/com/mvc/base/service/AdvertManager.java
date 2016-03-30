package com.mvc.base.service;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.base.model.Advert;
import com.mvc.framework.service.BaseService;
@Service
public class AdvertManager extends BaseService<Advert, Serializable>{

	public void executeAudit(Long objectId,int advertStatus) {
        String hql = "update "+Advert.class.getName()+" set advertStatus=? where objectId=?";
        Query query = getSession().createQuery(hql);
        query.setParameter(0, advertStatus);
        query.setParameter(1, objectId);
        query.executeUpdate();
    }
	@SuppressWarnings("unchecked")
	public List<Advert> getPublishedAdertByPositionCode(String positionCode){
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT A FROM  ").append(getActualArgumentType().getName())
        .append(" A WHERE A.advertStatus="+Advert.ADVERT_STATUS_PUBLISH+" order by A.dispalyOrder asc");
        List<Advert> adverts= searchBySql(getActualArgumentType(), sql.toString());
        return adverts;
    }
}
