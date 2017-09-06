<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<c:set var="menu_active" value="nav_homepage" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>两只猫</title>
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">

<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
<link rel="stylesheet"
	href="//g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">

</head>
<body>

	<div class="page-group">
		<!-- 你的html代码 -->
		<div class="page" id="home_page">
				<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>

			<%@ include file="/WEB-INF/views/common/mainmenu.jsp"%>
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
	</div>


	<script type='text/javascript'
		src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	<script type='text/javascript'
		src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js'
		charset='utf-8'></script>
	<script>
		$(function() {

			$(document).on("pageInit", "#home_page", function(e) {
				console.log("pageInit");

				$("#${menu_active}").addClass("active");

			});

			$.init();
		})
	</script>
</body>
</html>


