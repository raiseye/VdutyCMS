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
      <ul>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">石头</div>
                <div class="item-after">17:14</div>
              </div>
              <div class="item-subtitle">New messages from John Doe</div>
              <div class="item-text">Lorem ipsum dolor sit amet...</div>
            </div>
          </label>
        </li>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">剪刀</div>
                <div class="item-after">17:14</div>
              </div>
              <div class="item-subtitle">New messages from John Doe</div>
              <div class="item-text">Lorem ipsum dolor sit amet...</div>
            </div>
          </label>
        </li>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">布</div>
                <div class="item-after">17:14</div>
              </div>
              <div class="item-subtitle">New messages from John Doe</div>
              <div class="item-text">Lorem ipsum dolor sit amet...</div>
            </div>
          </label>
        </li>
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
