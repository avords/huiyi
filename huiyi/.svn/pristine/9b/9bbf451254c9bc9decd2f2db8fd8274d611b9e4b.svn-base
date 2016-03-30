package com.mvc.base.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mvc.base.model.Message;
import com.mvc.base.service.MessageManager;
import com.mvc.framework.dao.PropertyFilter;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.util.PageSearch;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.Company;
import com.mvc.member.model.Member;
import com.mvc.member.service.CompanyManager;
import com.mvc.member.service.MemberManager;


@Controller
@RequestMapping("admin/message")
public class MessageController  extends PageController<Message> {
	@Autowired
	private MessageManager messageManager;

	@Autowired
	private CompanyManager companyManager;
	
	@Autowired
	private MemberManager memberManager;

	@Override
	public PageManager<Message> getEntityManager() {
		return messageManager;
	}

	@Override
	public String getFileBasePath() {
		return "base/";
	}

	@Override
	protected String handlePage(HttpServletRequest request, PageSearch page) {
		List<Company> companys=companyManager.getAll();
		List<Member> members=memberManager.getAll();
		request.setAttribute("companys", companys);
		request.setAttribute("members", members);
		page.getFilters().add(new PropertyFilter(Message.class.getName(),"EQI_type","1"));
		
		return super.handlePage(request, page);
	}
	
	
	@Override
	protected String handleView(HttpServletRequest request, HttpServletResponse response, Long objectId)
			throws Exception {
		List<Company> companys=companyManager.getAll();
		List<Member> members=memberManager.getAll();
		request.setAttribute("companys", companys);
		request.setAttribute("members", members);
		return super.handleView(request, response, objectId);
	}
}
