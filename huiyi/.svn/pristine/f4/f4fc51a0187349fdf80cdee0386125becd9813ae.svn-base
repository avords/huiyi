package com.mvc.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mvc.framework.service.PageManager;
import com.mvc.framework.web.PageController;
import com.mvc.member.model.History;
import com.mvc.member.service.HistoryManager;

@Controller
@RequestMapping("/history")
public class HistoryController extends PageController<History>{
	@Autowired
	private HistoryManager historyManager;
	
	@Override
	public PageManager<History> getEntityManager() {
		return historyManager;
	}

	@Override
	public String getFileBasePath() {
		return "member/";
	}

}
