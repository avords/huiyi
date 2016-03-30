/*
 * HomeManager.java 2012-9-19
 * Copyright(c) 20012-2015 by covidien
 * ALL Rights Reserved.
 */
package com.mvc.portal.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.framework.util.DateUtils;
import com.mvc.report.domain.IntegerChartData;
import com.mvc.report.service.ChartDataManager;

/**
 * 
 * @author bangxiong.pu
 * @version V1.0 Create Time: 2012-9-19
 */
@Service
public class HomeManager {

    @Autowired
    private ChartDataManager chartDataManager;

    public List<IntegerChartData> getLastWeekLoginData() {
        Date date = DateUtils.getPreviousOrNextDaysOfNow(-7);
        int begin = Integer.parseInt(DateUtils.getDateFormat(DateUtils.FORMAT_YYYYMMDD).format(date));
        int end = Integer.parseInt(DateUtils.getDateFormat(DateUtils.FORMAT_YYYYMMDD).format(new Date()));
        String appsql = "select a.date_key,count(b.user_id),ifnull(sum(b.online_time),0) from dim_date a left join login_log_yyyymmdd b on a.date_key = b.op_time where a.date_key between ? and ? group by a.date_key;";
        return chartDataManager.searchIntegerChartDataBySql(appsql, new Object[]{begin,end});
    }
}
