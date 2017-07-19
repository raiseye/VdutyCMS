<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<c:set var="menu_active" value="nav_membercenter"/>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<div class="page">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<%@ include file="/WEB-INF/views/user/mainmenu.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->
		<div class="page-index">
			<div class="card">
				<div
					style="background-image: url(//gqianniu.alicdn.com/bao/uploaded/i4//tfscom/i3/TB10LfcHFXXXXXKXpXXXXXXXXXX_!!0-item_pic.jpg_250x250q60.jpg)"
					valign="bottom" class="card-header color-white no-border">旅途的山</div>
				<div class="card-content">
					<div class="card-content-inner">
						<p class="color-gray">发表于 2015/01/15</p>
						<p>此处是内容...</p>
					</div>
				</div>
				<div class="card-footer">
					<a href="#" class="link">赞</a> <a href="#" class="link">更多</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/user/foot.jsp"%>
