<%@ page contentType="text/html;charset=utf-8"%>
</div>
<!-- pagegroup end -->
<script type='text/javascript'
	src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript'
	src='//g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js'
	charset='utf-8'></script>
<script>
	$.init();
</script>



</body>
<script>
	$(document).ready(function() {
		$("#${menu_active}").addClass("active");

	});

	//操作表
	$(document).ready(function() {

		$("#aUsername").click(function() {

			var buttons1 = [ {
				text : '请选择操作',
				label : true
			}, {
				text : '修改密码',
				bold : true,

				onClick : function() {
					$.alert("你选择了“修改密码“");
				}
			}, {
				text : '退出登录',
				color : 'danger',
				onClick : function() {
					//$.alert("你选择了“退出登录“");

					$.confirm('你确定要退出登录吗?', function() {
						$.alert('你点击了确定按钮!');
						location.href = "/user/logout"
					});

				}
			} ];
			var buttons2 = [ {
				text : '取消',
				bg : 'danger'
			} ];
			var groups = [ buttons1, buttons2 ];
			$.actions(groups);
		});
	});
</script>
</html>