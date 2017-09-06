<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<c:set var="menu_active" value="nav_discover"/>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainmenu.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->
		<div class="page-index">
 <div class="list-block " style="margin: 10px auto;">
                    <ul>

                        <li>
                            <a href="#" class="item-link item-content">
                                <div class="item-media"><span class="icon icon-clock"  style="font-size: 0.9rem; color: #0894ec;"></span></div>
                                <div class="item-inner">

                                    <div class="item-title" style="font-size:0.7rem;">计划</div>


                                </div>
                            </a>
                        </li>
 <li>
                            <a href="#" class="item-link item-content">
                                <div class="item-media"><span class="icon icon-clock"  style="font-size: 0.9rem; color: #0894ec;"></span></div>
                                <div class="item-inner">

                                    <div class="item-title" style="font-size:0.7rem;">记录</div>


                                </div>
                            </a>
                        </li>

                    </ul>
                </div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/javascript_load.jsp"%>
<script>
	$(function() {
		console.log("$function--");
		$(document).on("pageInit", "#page_main", function(e, id, page) {
console.log("will add menu_active addclass");
			$("#${menu_active}").addClass("active");

		});
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
