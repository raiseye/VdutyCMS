<!-- 个人中心首页 -->
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<c:set var="menu_active" value="nav_membercenter" />
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_back"
	value=""/>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="/user/logout">退出</a>' />
<c:set var="headerbar_title" value="${curUser}" />

<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<%@ include file="/WEB-INF/views/common/mainmenu.jsp"%>
 <div class="content">

	<div class="card" style="margin: 0 auto; margin-bottom: 0;">
		<div class="card-content">
			<div class="list-block media-list">
				<ul>
					<li>
						<div class="item-content">
							<div class="item-media">
								<img src="${pageContext.request.contextPath}/public/images/u=1463646346,1819797247&fm=21&gp=0.jpg" width="44">
							</div>
							<div class="item-inner">
								<div class="item-title-row">
									<div class="item-title"><shiro:principal />_${userId}</div>
								</div>
								<div class="item-subtitle">一群有趣的人做有性趣的事</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="card-footer three-center">

			<div>
				<div>888</div>
				<div>发言</div>
			</div>
			<div>

				<div>555</div>
				<div>关注</div>

			</div>
			<div>
				<div>999</div>
				<div>粉丝</div>
			</div>
		</div>
	</div>


	<div class="list-block " style="margin: 10px auto;">
		<ul>

			<li><a href="#" class="item-link item-content  ">
					<div class="item-media ">
						<span class="icon icon-message "
							style="font-size: 1rem; color: #0894ec;"></span>
					</div>
					<div class="item-inner">
						<div class="item-title" style="font-size: 0.7rem;">我的发言</div>
					</div>
			</a></li>
			<li><a href="${pageContext.request.contextPath}/manageruser/user/plan" class="item-link item-content">
					<div class="item-media">
						<span class="icon icon-clock"
							style="font-size: 0.9rem; color: #0894ec;"></span>
					</div>
					<div class="item-inner">

						<div class="item-title" style="font-size: 0.7rem;">我的计划</div>


					</div>
			</a></li>
			
			<li><a href="${pageContext.request.contextPath}/manageruser/user/item" class="item-link item-content">
					<div class="item-media">
						<span class="icon icon-clock"
							style="font-size: 0.9rem; color: #0894ec;"></span>
					</div>
					<div class="item-inner">

						<div class="item-title" style="font-size: 0.7rem;">我的记录</div>


					</div>
			</a></li>
			
			<li><a href="#" class="item-link item-content">
					<div class="item-media">
						<span class="icon icon-star"
							style="font-size: 1rem; color: #0894ec;"></span>
					</div>
					<div class="item-inner">
						<span style="font-size: 0.7rem;">我的收藏</span>
					</div>
			</a></li>

		</ul>
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




