<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>后台登录</title>

<!-- Bootstrap core CSS -->
<link href="${ctx}/css/bootstrap-core/bootstrap.min.css"
	rel="stylesheet">
<link href="${ctx}/css/bootstrap-core/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link href="${ctx}/css/bootstrap-core/font-awesome.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="${ctx}/css/bootstrap-core/style.css" rel="stylesheet">
<link href="${ctx}/css/bootstrap-core/style-responsive.css"
	rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
<!--[if lt IE 9]>
    <script src="${BASE_PATH}/static/manage/js/html5shiv.js"></script>
    <script src="${BASE_PATH}/static/manage/js/respond.min.js"></script>
    <![endif]-->
<script src="${ctx}/js/plugins/jquery-core/jquery.js"></script>
<script src="${ctx}/js/plugins/jquery-core/jquery.form.min.js"></script>
<style type="text/css">
p.error {
	color: #DE5959;
}

.form-signin input[type="text"].error, .form-signin input[type="password"].error
	{
	border-color: #b94a48;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

input.error:focus {
	border-color: #953b39;
	color: #b94a48;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px
		#d59392;
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 6px #d59392;
}
</style>
</head>

<body class="login-body">

	<div class="container">

		<form class="form-signin" id="adminForm"
			action="${BASE_PATH}/admin/login/validate" autocomplete="off"
			method="post">
			<div class="login-wrap">
				<div class="form-group">
					<label for="exampleInputEmail1">用户名</label> <input type="text"
						name="name" class="form-control" placeholder="用户名" value=""
						style="*width: 250px;" autofocus onfocus="clearErrors();">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">密码</label> <input type="password"
						name="password" class="form-control" placeholder="密码" value=""
						style="*width: 250px;" onfocus="clearErrors();">
				</div>
				<div class="clearfix"></div>
				<div>
					<p class="error" for="captcha" style="display: none;"></p>
				</div>
				<button class="btn btn-lg btn-login btn-block" type="submit">登录</button>
			</div>
		</form>

	</div>
	<script type="text/javascript">
	
		function clearErrors(){
			$('#adminForm').find('p[class=error]').hide();
		}
		/**
		 * 显示表单的错误提示
		 * @param id 表单ID
		 * @param errors 错误列表
		 */
		function showErrors(id, errors) {
			var errors = id.find('p[class=error]');
			errors.html("用户名或密码错误！");
			errors.show();
		}
		$(function() {
			$('#adminForm').ajaxForm(
					{
						dataType : 'json',
						success : function(data) {
							if (data.result) {
								window.location.href = "${BASE_PATH}/manageradmin/admin";
							} else {
								showErrors($('#adminForm'), data.msg);
							}
						}
					});
		});
	</script>
</body>
</html>