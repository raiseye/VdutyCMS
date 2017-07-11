<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>职道后台管理</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
		<link rel="shortcut icon" href="${main_ctx}/img/favicon.ico"/>
		<link rel="bookmark" href="${main_ctx}/img/favicon.ico"/>
<!--         <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> -->
        <link href="${ctx}/css/bootstrap-core/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!--         <link href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
		<link href="${ctx}/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--         Ionicons -->
<!--         <link href="//code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" rel="stylesheet" type="text/css" /> -->
        <!-- Morris chart -->
        <link href="${ctx}/css/morris/morris.css" rel="stylesheet" type="text/css" />
        <!-- jvectormap -->
        <link href="${ctx}/css/jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <!-- bootstrap wysihtml5 - text editor -->
        <link href="${ctx}/css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="${ctx}/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        
        <!--[if IE 7]>
			<link rel="stylesheet" href="${ctx}/css/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
        
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
        <script src="${ctx}/js/plugins/jquery-core/jquery.min.js"></script>
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            <a href="#" class="logo">
                <!-- Add the class icon to your logo image or logo icon to add the margining -->
                	微 广 角
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="glyphicon glyphicon-user"></i>
                                <span><shiro:principal />&nbsp;&nbsp;<i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu">
	                          <li class="user-body" style="text-align:center"><a href="##" data-target="#myModal"  data-toggle="modal"><i class="fa fa-cog"></i>修改密码</a></li>
	                          <li class="user-body" style="text-align:center"><a href="${BASE_PATH}/admin/logout"><i class="fa fa-key"></i> 安全退出</a></li>
	                        </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="left-side sidebar-offcanvas">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="${ctx}/img/avatar3.png" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                           	 您好，<shiro:principal />
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="${active_weibo}">
                            <a href="${BASE_PATH}/manager/weibo">
                                <i class="fa fa-th"></i> <span>微博资源管理</span>
                            </a>
                        </li>
                        <li class="${active_wechat}">
                            <a href="${BASE_PATH}/manager/wechat">
                                <i class="fa fa-th"></i> <span>微信资源管理</span>
                            </a>
                        </li>
                        <li class="${active_web}">
                            <a href="${BASE_PATH}/manager/web">
                                <i class="fa fa-th"></i> <span>网络资源管理</span>
                            </a>
                        </li>
                        <li class="${active_newspaper}">
                            <a href="${BASE_PATH}/manager/newspaper">
                                <i class="fa fa-th"></i> <span>报纸资源管理</span>
                            </a>
                        </li>
<%--                         <li class="${active_pic}"> --%>
<%--                             <a href="${BASE_PATH}/manager/pic"> --%>
<!--                                 <i class="fa fa-desktop"></i> <span>展示图片管理</span> -->
<!--                             </a> -->
<!--                         </li> -->
                        <li class="${active_admin}">
                            <a href="${BASE_PATH}/manager/admin">
                                <i class="fa fa-users"></i> <span>管理员管理</span>
                            </a>
                        </li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>
            
            <!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog" >
      <div class="modal-content" style="height:500px">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               	修改管理员<shiro:principal />密码
            </h4>
         </div>
         <div class="modal-body">
           <form id="update_cur_admin_pwd" class="form-horizontal" role="form" action="" method="post">
  			<div class="form-group">
    			<label class="col-sm-2 control-label">新密码</label>
    				<div class="col-sm-10">
      					<input type="password" name="new_pwd" class="form-control" id="inputPassword" 
         					placeholder="请输入8-12个字符之间的密码" onfocus="clearError($('#no_new_pwd'),0);">
         				<p id="no_new_pwd"
								style="font-size: 15px;display:none;padding-left:6px;color:#ff0000;"></p>
    				</div>
  			</div>
  			<div class="form-group">
    			<label for="inputPassword" class="col-sm-2 control-label">确认密码</label>
    				<div class="col-sm-10">
      					<input type="password" name="confirm_new_pwd" class="form-control" id="inputPassword" 
         					placeholder="请输入密码" onfocus="clearError($('#no_confirm_pwd'),1);">
         				<p id="no_confirm_pwd"
								style="font-size: 15px;display:none;padding-left:6px;color:#ff0000;"></p>
    				</div>
  			</div>
			</form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-success" 
               data-dismiss="modal">关闭
            </button>
            <button id="pwdSub" type="submit" class="btn btn-success" onclick="updateCurAdminPwd();">提交更改
            </button>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
<script>
function clearError(id,which){
	id.val('');
	id.hide();
}

function updateCurAdminPwd(){
	var newPwd = $("input[name='new_pwd']").val();
	var confirPwd = $("input[name='confirm_new_pwd']").val();
	if (newPwd.length<8 || newPwd.length>12){
		$("#no_new_pwd").html("请保持密码长度在8-12之间！");
		$("#no_new_pwd").show();
		return ;
	}
	if (newPwd != confirPwd){
		$("#no_confirm_pwd").html("两次填写的密码不一致！");
		$("#no_confirm_pwd").show();
		return ;
	}
	$.ajax({     
	    url:'<%=request.getContextPath()%>/manager/admin/update',     
	    type:'post',     
	    data:{'pwd':newPwd},        
	    success:function(data){     
	    	if (data.result) {
				bootbox.alert("修改成功，将刷新页面", function() {
					$("#myModal").modal('hide');
					window.location.reload();
				});
			}else{
				bootbox.alert(data.errors.error, function() {
				});
			}     
	    },  
	    error:function(){     
	    	bootbox.alert("网络异常，请重新提交或联系管理员！", function() {
			});     
		},
	});  
}
</script>