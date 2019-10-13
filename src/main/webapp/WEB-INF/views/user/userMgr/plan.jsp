<!-- item我的计划列表-->
<%@page import="com.vduty.cms.web.utils.MD5Utils"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="/manageruser/user/plan/add">添加</a>' />
<c:set var="headerbar_title" value="${title_name }" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>


	<div class="content">
		<div class="list-block media-list">
      <div class="list-block media-list">
      <ul>
      <c:forEach items="${planlist}" var="plan">               
         <li>        
          <a href="#" class="item-link item-content">
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">${plan.title} </div>
                <div class="item-after">  <fmt:formatDate value="${plan.doTime}" pattern="yyyy-MM-dd  HH:mm:ss" /> </div>
              </div>
              <c:set var="repeatType" value="每天111"/>
              
              <c:if test="${plan.repeatType==0}">
              <c:set var="repeatType" value="一次"/>
              </c:if>
               <c:if test="${plan.repeatType==1}">
              <c:set var="repeatType" value="每天"/>
              </c:if>
               <c:if test="${plan.repeatType==2}">
              <c:set var="repeatType" value="每月"/>
              </c:if>
               <c:if test="${plan.repeatType==3}">
              <c:set var="repeatType" value="每年"/>
              </c:if>
                <c:if test="${plan.repeatType==4}">
              <c:set var="repeatType" value="每周"/>
              </c:if>
               <c:set var="alarmType" value="一次"/>
              
                <c:if test="${plan.alarmType==1}">
              <c:set var="alarmType" value="提醒一次"/>
              </c:if>
              
                 <c:if test="${plan.alarmType==2}">
              <c:set var="alarmType" value="提醒三次"/>
              </c:if>
              
               <c:if test="${plan.alarmType==3}">
              <c:set var="alarmType" value="直到确认"/>
              </c:if>
              
              <div class="item-text">${repeatType}，${alarmType}</div>
            </div>
          </a>
        </li>
        
       </c:forEach>
      </ul>
    </div>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/javascript_load.jsp"%>
<script>
	$(function() {
		console.log("$function--");
		$(document).on("pageInit", "#page_main", function(e, id, page) {
//执行
			
			

		});
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
