package com.mvc.base.service;

import java.io.Serializable;
import java.util.List;
import org.springframework.stereotype.Service;
import com.mvc.base.model.SearchWords;
import com.mvc.framework.service.BaseService;
@Service
public class SearchWordsManager extends BaseService<SearchWords,Serializable>{
	
	public List<SearchWords> getSearchWord(int size) {
		String sql = "select A from " + SearchWords.class.getName() + " A order by A.sortNo asc";
		return pageSearchBySql(sql, 0, size);
	}
}
