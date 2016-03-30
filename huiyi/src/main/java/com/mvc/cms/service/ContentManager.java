package com.mvc.cms.service;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.cms.model.Channel;
import com.mvc.cms.model.Content;
import com.mvc.cms.model.ContentChannel;
import com.mvc.framework.dao.HibernateWebUtils;
import com.mvc.framework.service.BaseService;
import com.mvc.framework.util.PageSearch;

/**
 * 内容
 */
@Service
public class ContentManager extends BaseService<Content, Serializable> {

	@Autowired
	private ContentChannelManager contentChannelManager;

	// 通过关键字文章搜索
	public List<Content> getContentByKeyWord(String keyword) {
		List<Content> contents = null;
		String sql = "select A from " + Content.class.getName() + " A where 1=1 ";
		contents = searchBySql(sql);
		return contents;
	}

	// 文章列表
	public List<Content> getRecommendContents(Long channelId, int size) {
		Date now = new Date();
		String sql = "select A from " + Content.class.getName() + " A," + ContentChannel.class.getName() + " B where A.status= ? "
				+ "and A.objectId = B.contentId and B.channelId = ? and A.beginDate <= ? and A.endDate >= ? ORDER BY A.updatedOn desc";
		return pageSearchBySql(sql, 0, size, Content.STATUS_PUBLISH, channelId, now, now);
	}

	// 文章详情
	public Content getContentById(Long id) {
		String sql = "select A from " + Content.class.getName() + " A where status= ? and objectId=?";
		return searchObjectBySql(sql, Content.STATUS_PUBLISH, id);
	}

	public List<Content> getChannelContent(Channel channel, Integer begin, Integer end) {
		String sql = "SELECT A FROM " + Content.class.getName() + " A, " + ContentChannel.class.getName()
				+ " B WHERE A.objectId = B.contentId and B.channelId = ? AND A.status= ?" + " ORDER BY A.priority";
		return pageSearchBySql(sql, begin, end, channel.getObjectId(), Content.STATUS_PUBLISH);
	}
	
	@SuppressWarnings("unchecked")
    public void getChannelContent(PageSearch pageSearch,Channel channel,int start) {
	    if(channel==null){
            return;
        }
        int currentPage = pageSearch.getPage()<=0?1:pageSearch.getPage();
        int pageSize = pageSearch.getPageSize();
        int begin = (currentPage-1)*pageSize+start;
        List<Content> list = getChannelContent(channel, begin, pageSize);
        pageSearch.setList(list);
        String sql = "SELECT count(*) FROM " + Content.class.getName() + " A, "
                + ContentChannel.class.getName()
                + " B WHERE A.objectId = B.contentId and B.channelId = "
                + channel.getObjectId() + "  AND A.status="
                + Content.STATUS_PUBLISH
                + " ORDER BY A.priority desc";
        Session session = getSession();
        Query query = session.createQuery(sql);
        List<Long> countList = query.list();
        if(countList.size()>0){
            pageSearch.setTotalCount(countList.get(0).intValue()-start);
        }else{
            pageSearch.setTotalCount(0);
        }
    }

	public void find(final PageSearch page, String channelCode) {
		DetachedCriteria detachedCriteria = HibernateWebUtils.createCriteria(page);
		Criteria criteria = detachedCriteria.getExecutableCriteria(getSession());
		if (StringUtils.isNotBlank(channelCode)) {
			criteria.add(Restrictions.sqlRestriction(
					" EXISTS (SELECT 1 from CMS_CONTENT_CHANNEL a,CMS_CHANNEL b where a.channel_Id = b.object_id and a.content_id = this_.object_id and b.position_Code = '"
							+ channelCode + "')"));
		}
		if (0 == page.getTotalCount()) {
			criteria.setProjection(Projections.rowCount());
			Object object = criteria.uniqueResult();
			int total = object == null ? 0 : ((Number) object).intValue();
			page.setTotalCount(total);
		}
		addOrder(page, criteria);
		criteria.setProjection(null);
		page.setList(criteria.setFirstResult(page.getBegin()).setMaxResults(page.getPageSize()).list());
	}

}