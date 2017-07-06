<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/admin/head.jsp"%>
<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>管理员管理</h1>
	</section>

	<!--main content start-->
	<section id="main-content">
		<section class="wrapper">
		<div class="row">
			<div class="col-lg-4" style="padding-left:40px;padding-top:40px">
				<section class="panel">
					<header class="panel-heading" style="padding-left:20px"><i class="fa fa-user-plus"></i> 添加管理员 </header>
					<div class="panel-body">
						<form id="add_admin_form" method="post" class="form-horizontal"
							autocomplete="off" action="${BASE_PATH}/manager/admin/save" method="post">
							<fieldset>
								<div class="form-group">
									<label class="col-sm-3 col-sm-3 control-label">名 称</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="name"
											placeholder="管理员名称">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-sm-3 control-label">密 码</label>
									<div class="col-sm-9">
										<input type="password" class="form-control" name="password"
											placeholder="管理员密码">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 col-sm-3 control-label"></label>
									<div class="col-sm-9">
										<button class="btn btn-success" type="submit">添 加</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</section>
			</div>
			<div class="col-lg-8" style="padding-top:40px;padding-right:40px">
				<section class="panel">
					<header class="panel-heading"><i class="fa fa-list"></i> 所有管理员列表 </header>
					<div class="panel-body">
						<div class="adv-table">
							<div role="grid" class="dataTables_wrapper"
								id="hidden-table-info_wrapper">
								<table class="table table-striped table-advance table-hover">
									<thead>
										<tr>
											<th>管理员</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody role="alert" aria-live="polite" aria-relevant="all">
									<c:forEach items="${pageVo.list}" var="item">
										<tr class="gradeA odd">
											<c:choose>
											<c:when test="${item.name == cur_user }">
											<td><font color="#00a23f">${item.name} [当前管理员]</font></td>
											</c:when>
											<c:otherwise>
											<td>${item.name}</td>
											</c:otherwise>
											</c:choose>
											<td><c:if test="${item.name != cur_user }">
												<a href="javascript:void(0);"
												adminId="${item.adminId}" title="删除${item.name}"
												class="js_delete_admin"> 删除 </a>
<!-- 												| <a -->
<%-- 												href="${BASE_PATH}/manage/adminFolder/manage.htm?adminId=${item.adminId}" --%>
<!-- 												title="权限"> 权限 </a> -->
											  </c:if>
<%-- 											  <c:if test="${item.name == cur_user }"> --%>
<!-- 											  	<font color="#ff0000">（不能对当前管理员执行删除操作）</font> -->
<%-- 											  </c:if> --%>
											</td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								<div style="height:30px;margin-bottom:50px" align="right">
									<div class="pagination">${pageVo.pageNumHtml}</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
			</div>
		</section>
		<!-- page end-->
	</section>
	<!-- main content end -->
</aside>
<!--right-side end-->

<!-- <script -->
<!-- 	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script> -->
<script>			
	$(function(){
		$('#add_admin_form').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					showErrors($('#add_admin_form'),data.errors);
				}
			}
		});
		
		$('.js_delete_admin').click(function() {
			var adminId= $(this).attr('adminId');
	        bootbox.dialog({
	            message: "是否" + $(this).attr('title') + "管理员",
	            title: "提示",
	            buttons: {
	                "delete": {
	                    label: "删除",
	                    className: "btn-success",
	                    callback: function() {
	                        $.post("${BASE_PATH}/manager/admin/del", {  
	                            "adminId": adminId
	                        },
	                        function(data) {
	                            if (data.result) {
	                                bootbox.alert("删除成功",
	                                function() {
	                                   window.location.reload();
	                                });
	                            } else {
	                                bootbox.alert(data.msg,
	                                function() {});
	                            }
	                        },
	                        "json");
	                    }
	                },
	                "cancel": {
	                    label: "取消",
	                    className: "btn-primary",
	                    callback: function() {}
	                }
	            }
	        });
	    });
	})	
</script>
<%@ include file="/WEB-INF/views/admin/foot.jsp"%>
