package com.mvc.member.service;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.mvc.framework.service.BaseService;
import com.mvc.member.model.Member;
import com.mvc.security.util.SecurityUtils;

@Service
public class MemberManager extends BaseService<Member, Serializable> {

	public void updatePassword(Member member) {
		StringBuilder hql = new StringBuilder();
		hql.append("UPDATE ").append(Member.class.getName()).append(" SET password = '").append(member.getPassword())
				.append("' WHERE ").append("objectId = ").append(member.getObjectId());
		Query query = getSession().createQuery(hql.toString());
		query.executeUpdate();
	}

	public void save(Member entity) {
		if (null == entity.getObjectId()) { // 新增
			entity.setPassword(SecurityUtils.generatePassword(entity.getPassword()));
		} 
		super.save(entity);
	}
	
	public boolean checkMemberName(String loginName) {
		if (searchByWhere("loginName=?", loginName) != null) {
			return false;
		}
		return true;
	}
	
	public Member getMemberByLoginName(String loginName) {
		String sql = "select A from " + Member.class.getName() + " A where loginName=?";
		List<Member> users = searchBySql(sql, new Object[] { loginName });
		if (users.size() > 0) {
			Member user = users.get(0);
			return user;
		}
		return null;
	}
	
	public boolean authentication(Member member) {
		boolean result = false;
		String loginName = member.getLoginName();
		String password = member.getPassword();
		Member realUser = null;
		if (loginName != null && loginName.length() > 0) {
			if (password != null && password.length() > 0) {
				realUser = getMemberByLoginName(loginName);
			}
		}
		if (null != realUser && null != realUser.getPassword()
				&& realUser.getPassword().equals(SecurityUtils.generatePassword(member.getPassword()))) {
			result = true;
		}
		return result;
	}
}
