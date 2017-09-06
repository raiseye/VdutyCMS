<%@ page contentType="text/html;charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SUI Mobile Demo</title>
<meta name="description"
	content="MSUI: Build mobile apps with simple HTML, CSS, and JS components.">
<meta name="author" content="阿里巴巴国际UED前端">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<link rel="shortcut icon" href="/favicon.ico">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">

<!-- Google Web Fonts -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/lib/sui/sm.css"
	charset='utf-8'>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/lib/sui/sm-extend.css"
	charset='utf-8'>

<style type="text/css">
.grid-demo .row {
	text-align: center;
}

.grid-demo .row+.row {
	margin-top: 0.75rem;
}

.grid-demo .row>[class*=col-] {
	border: 1px solid #ddd;
}

.icons-demo .icon {
	width: 2.5rem;
	height: 2.5rem;
	margin: 0.15rem;
	font-size: 1.2rem;
	line-height: 2.5rem;
	text-align: center;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 1.25rem;
	display: inline-block;
}

.icon.icon-f7 {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-f7.png");
}

.icon.icon-form-name {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-name.png");
}

.icon.icon-form-password {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-password.png");
}

.icon.icon-form-email {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-email.png");
}

.icon.icon-form-calendar {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-calendar.png");
}

.icon.icon-form-tel {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-tel.png");
}

.icon.icon-form-gender {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-gender.png");
}

.icon.icon-form-toggle {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-toggle.png");
}

.icon.icon-form-comment {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-comment.png");
}

.icon.icon-form-settings {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-settings.png");
}

.icon.icon-form-url {
	width: 1.45rem;
	height: 1.45rem;
	background-image: url("../img/i-form-url.png");
}
</style>
<script src="${pageContext.request.contextPath}/public/js/zepto.js"
	charset='utf-8'></script>
<script>
   
    $.config = {
       
        routerFilter: function($link) {
          
            if ($link.is('.disable-router a')) {
                return false;
            }

            return true;
        }
    };
    </script>

<script>
var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "//hm.baidu.com/hm.js?ba76f8230db5f616edc89ce066670710";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();
</script>

</head>
<body>
	<div class="page-group">
		<div id="page-picker" class="page">
			<header class="bar bar-nav">
				<a class="button button-link button-nav pull-left back"
					href="/demos"> <span class="icon icon-left"></span> 返回
				</a>
				<h1 class="title">${title_name }</h1>
			</header>
			<div class="content">
				<p>
				${message }
				</p>
				
		</div>

	</div>
	</div>
	<script src="${pageContext.request.contextPath}/public/lib/sui/sm.js"
		charset='utf-8'></script>
	<script
		src="${pageContext.request.contextPath}/public/lib/sui/sm-extend.js"
		charset='utf-8'></script>
	<script
		src="${pageContext.request.contextPath}/public/js/sm-city-picker.js"></script>
	
</body>
</html>

