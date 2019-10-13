package com.vduty.cms.web.user.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;

import com.mysql.jdbc.ResultSetMetaData;
import com.vduty.cms.web.user.dao.ItemDataDAO;
import com.vduty.cms.web.user.dao.ItemMainDAO;
import com.vduty.cms.web.user.dao.PlanDAO;
import com.vduty.cms.web.user.entity.ItemDefine;
import com.vduty.cms.web.user.entity.ItemMain;
import com.vduty.cms.web.user.entity.Plan;
import com.vduty.cms.web.utils.MD5Utils;


@Service
public class PlanService {

	@Autowired
	private PlanDAO planDAO;

	@CacheEvict(value = "plan", allEntries = true)
	public long addItem(Plan plan) {
		long planid = planDAO.addPlan(plan);
		return planid;
	}
	
	public List<Plan> getPlans(long userId, int pageIndex, int pageSize)
	{
		Map<String , Long> map = new HashMap<String,Long>();
		map.put("userId",  userId);
		int start = pageIndex * pageSize;
		int end = pageSize;
//long uerId,int startRecord,int endRecord
		map.put("startRecord",(long) start);
		map.put("endRecord", (long) end);
		planDAO.getPlans(map);
		
		return planDAO.getPlans(map);
	}
	
	
	public Plan planInfo(long planId)	
	{
		Plan plan =planDAO.planInfo(planId);
		return plan;
	}
	
	
	public int deletePlan(long id)
	{
		 return planDAO.deletePlan(id);
	}
	

	
}
