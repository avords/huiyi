package com.mvc.base.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.base.model.Area;
import com.mvc.framework.model.BaseTree;
import com.mvc.framework.service.BaseService;

@Service
public class AreaManager extends BaseService<Area, Long> {

	/**
	 * 根据地区编码查询它的子地区
	 *
	 * @param code
	 * @return
	 */
	public List<Area> getChildrenByCode(String code) {
		if (null != code && code.length() == 4) {
			String sql = "select A from " + Area.class.getName() + " A where A.code like ? and level=3 order by name";
			List<Area> list = searchBySql(Area.class, sql, code + "%");
			return list;
		} else if (null != code && code.length() == 2) {
			String sql = "select A from " + Area.class.getName() + " A where A.code like ? and level=2 order by name";
			List<Area> list = searchBySql(Area.class, sql, code + "%");
			return list;
		}
		return new ArrayList<Area>();
	}

	/**
	 * 获取地区的全名
	 * @param code
	 * @return
	 */
	public String getAreaFullNameByCode(String code) {
		String areaName = "";
		if(StringUtils.isNotBlank(code)){
			if(code.length()==6){
				areaName += getAreaByCode(code).getName();
			}else if(code.length() >= 4){
				String city = getAreaByCode(code.substring(0,4)).getName();
				city = city.replace("市辖区", "");
				city = city.replace("县", "");
				areaName += city;
			}else if(code.length() >= 2){
				Area  area = getAreaByCode(code.substring(0,2));
				if(area!=null){
					areaName = area.getName();
				}
			}
		}
		return areaName;
	}

	/**
	 * 根据地区编码查询它的地区
	 *
	 * @param code
	 * @return
	 */
	public Area getAreaByCode(String code) {
		if (null != code) {
			String sql = "select A from " + Area.class.getName() + " A where A.code ='" + code + "'";
			List<Area> list = searchBySql(Area.class, sql);
			if (list.size() > 0) {
				return list.get(0);
			}
		}
		return null;
	}

	/**
	 * 得到地区根目录
	 *
	 * @return
	 */
	public List<Area> getRoot() {
		return searchBySql(Area.class, "select A from " + Area.class.getName() + " A where A.parentId ="
				+ BaseTree.ROOT + " order by name");
	}

	/**
	 * 得到所有地区
	 *
	 * @return
	 */
	@Override
    public List<Area> getAll() {
		List<Area> list = super.getAll();
		list.add(Area.ROOT);
		return list;
	}

	/**
	 * 统计地区数量
	 *
	 * @param parentId
	 * @return
	 */
	public Long getAreaCount(Long parentId) {
		String sql = "select count(*) from " + Area.class.getName() + " where parentId=" + parentId;
		Query query = getSession().createQuery(sql);
		Long result = ((Long) query.iterate().next());
		return result;
	}

	/**
	 * 得到子地区
	 *
	 * @param parentId
	 * @return
	 */
	public List<Area> getChildren(Long parentId) {
		return searchBySql(Area.class, "select A from " + Area.class.getName() + " A where A.parentId =" + parentId
				+ " order by name");
	}
	/**
	 * 根据地区编码得到地区单价
	 *
	 * @param areaCode
	 * @return
	 */
	public Area getPriceByAreaCode(String areaCode) {
		String sql = "select A from " + Area.class.getName() + " A where  code='" + areaCode + "'";
		List<Area> areas = searchBySql(Area.class, sql);
		if (areas != null) {
			return areas.get(0);
		}
		return null;
	}

	/**
	 * 根据名称查询地区
	 *
	 * @param name
	 * @return
	 */
	public Area getAreaByName(String name) {
		if (null != name) {
			String sql = "select A from " + Area.class.getName() + " A where name =?";
			List<Area> list = searchBySql(Area.class, sql,name);
			if (list.size() > 0) {
				return list.get(0);
			}
		}
		return null;
	}

	public Area getParentAreaByCode(String code) {
        if (null != code) {
            String sql = "select B from " + Area.class.getName() + " B where B.objectId=(select A.parentId from " + Area.class.getName() + " A where code =?)";
            List<Area> list = searchBySql(Area.class, sql,code);
            if (list.size() > 0) {
                return list.get(0);
            }
        }
        return null;
    }


//	public void save(Area entity) {
//		//default
//		String parentLayer = "/" +BaseTree.ROOT;
//		if(StringUtils.isBlank(entity.getCode())){
//			entity.setCode(null);
//		}
//		if(entity.getParentId()!=null&&entity.getParentId()!=BaseTree.ROOT){
//			Area parent = getByObjectId(entity.getParentId());
//			if(parent!=null && !parent.isParent()){
//				parent.setParent(true);
//				super.save(parent);
//				entity.setLevelDeep(parent.getLevelDeep() + Area.DEFAULT_DEEP_LEVEL_STEP);
//				parentLayer = parent.getLayer();
//			}else{
//				entity.setLevelDeep(Area.DEFAULT_DEEP_LEVEL_STEP);
//			}
//		} else {
//			entity.setLevelDeep(Area.DEFAULT_DEEP_LEVEL);
//		}
//		entity.setLayer("");
//		if(entity.getObjectId()==null){
//			entity.setParent(false);
//		}else{
//			int childCount = getChildrenCount(entity.getObjectId());
//			if(childCount==0){
//				entity.setParent(false);
//			}else{
//				entity.setParent(true);
//			}
//		}
//		if(entity.getOrderId()==null){
//			if(entity.getParentId()!=null){
//				entity.setOrderId(getChildrenMaxOrderId(entity.getParentId()) + 1);
//			}else{
//				entity.setOrderId(Area.DEFAULT_ORDER_ID);
//			}
//		}
//		super.save(entity);
//		String newCodeNo = parentLayer + "/" + entity.getObjectId();
//		if(!entity.getLayer().equals(newCodeNo)){
//			entity.setLayer(newCodeNo);
//			super.save(entity);
//			updateLayerDirectChildren(entity);
//		}
//	}

//	protected void updateLayerDirectChildren(Area parent) {
//		List<Area> needUpdateMenu = getChildren(parent.getObjectId());
//		Session session = getSession();
//		for (Area tree : needUpdateMenu) {
//			String layer = parent.getLayer() + Menu.PATH_SEPARATOR + tree.getObjectId();
//			updateLayerDirectChildren(tree);
//			String hql = "UPDATE " + getActualArgumentType().getName() + " SET layer = ? WHERE objectId = ?";
//			Query query = session.createQuery(hql).setParameter(0, layer).setParameter(1, tree.getObjectId());
//			query.executeUpdate();
//		}
//	}

}
