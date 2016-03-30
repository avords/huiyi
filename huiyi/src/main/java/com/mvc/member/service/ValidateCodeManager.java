package com.mvc.member.service;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import com.mvc.framework.service.BaseService;
import com.mvc.member.model.ValidateCode;

@Service
public class ValidateCodeManager  extends BaseService<ValidateCode, Serializable>{
	
	public boolean checkValidateCode(String email, int type, String validateCode) {
		String sql = "SELECT A FROM " + ValidateCode.class.getName()
				+ " A WHERE 1 = 1 AND A.type=:type AND A.account=:account AND A.code=:code AND A.validateTime>:date";
		Query query = getSession().createQuery(sql);
		query.setInteger("type", type);
		query.setString("account", email);
		query.setString("code", validateCode);
		query.setTimestamp("date", Calendar.getInstance().getTime());

		@SuppressWarnings("unchecked")
		List<ValidateCode> codes = query.list();
		if (codes != null && codes.size() > 0) {
			return true;
		}
		return false;
	}
	
	public void clearValidateRecords(String account,int type) {
		String sql = "DELETE FROM " + ValidateCode.class.getName()
				+ " A WHERE 1 = 1 AND A.type="+type+" AND A.account='"+account +"'";
		this.getSession().createQuery(sql).executeUpdate();
	}
}
