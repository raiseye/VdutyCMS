<!-- item我的计划列表-->
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
                <div class="item-after">${plan.doTime }</div>
              </div>
              <div class="item-subtitle">${plan.repeatType}</div>
              <div class="item-text">此处是文本内容...</div>
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
