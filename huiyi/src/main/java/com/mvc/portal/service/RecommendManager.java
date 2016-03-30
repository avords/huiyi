package com.mvc.portal.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.Company;
import com.mvc.member.service.CompanyManager;
import com.mvc.portal.model.Recommend;
import com.mvc.product.model.Product;
import com.mvc.product.service.ProductManager;
import com.mvc.product.service.SkuManager;

@Service
public class RecommendManager extends BaseService<Recommend, Serializable> {
	@Autowired
	private CompanyManager companyManager;

	@Autowired
	private ProductManager productManager;

	@Autowired
	private SkuManager skuManager;

	/**
	 * 首页显示的推荐产品列表
	 */
	public List<Product> getProducts(int size, String language) {
		String sql = "select B from " + Product.class.getName() + " B, " + Recommend.class.getName()
				+ " A where B.objectId = A.itemId AND A.type=? order by A.priority)";
		List<Product> products = pageSearchBySql(Product.class, sql, 0, size, Recommend.TYPE_PRODUCT);
		if (language!=null) {
			for(Product product : products){
				product.setSellPrice(productManager.getSellPrice(product.getObjectId(), language));
			}
		}
		return products;
	}

	/**
	 * 首页显示的推荐企业列表 
	 */
	public List<Company> getCompanys(int size) {
		String sql = "select B from " + Company.class.getName() + " B, " + Recommend.class.getName()
				+ " A where B.objectId = A.itemId AND A.type=? order by A.priority)";
		return pageSearchBySql(Company.class, sql, 0, size, Recommend.TYPE_COMPANY);
	}

	/**
	 * 通过itemId获得对象 add by caipenghu
	 */
	public Recommend getByItemId(Long itemId) {
		if (null == itemId) {
			return null;
		}
		String sql = "select A from " + getActualArgumentType().getName() + " A" + " where A.itemId= " + itemId;
		List<Recommend> list = searchBySql(sql);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void deleteByItemId(Long itemId) {
		deleteByWhere("itemId = " + itemId);
	}
}
