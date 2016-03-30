package com.mvc.member.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.member.model.History;
import com.mvc.product.model.Product;
import com.mvc.product.model.Sku;

@Service
public class HistoryManager extends BaseService<History, Serializable>{
	public void createVisitRecord(Long entityId,Integer isDelete,Integer type,Long companyId) {
		   History visitRecord = new History();
		   visitRecord.setEntityId(entityId);
		   visitRecord.setIsDelete(isDelete);
		   visitRecord.setType(type);
		   visitRecord.setVisitDate(new Date());
		   visitRecord.setCompanyId(companyId);
		   this.save(visitRecord);
	}
	
	public List<History> getAllHistoryByType(Integer type){
		String sql="select A from " + History.class.getName() + " A where A.type= " +type+"and A.isDelete=1";
		return searchBySql( sql);
	}

	public boolean checkHistoryExtensive(Long entityId) {
		if (searchByWhere("entityId=?", entityId)!= null) {
			return false;
		}
		return true;
	}
	//取四个相似的产品
    public List<Product> getProductsByCategoryId(int size,Long categoryId) {
    	 String sql = "SELECT DISTINCT C FROM " + Product.class.getName() + " C," + Sku.class.getName()
                 + " D WHERE C.categoryId="+categoryId+"and D.status=5 and C.objectId=D.productId";
		return pageSearchBySql(Product.class, sql, 0, size);
	}
    
    public History getByCompanyId(Long companyId) {
		if (null == companyId) {
			return null;
		}
		Class entityClass = getActualArgumentType();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT A FROM  ").append(entityClass.getName()).append(" A WHERE A.entityId = ?");
		List<History> list = searchBySql(entityClass, sql.toString(), new Object[] { companyId });
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}


    
}
