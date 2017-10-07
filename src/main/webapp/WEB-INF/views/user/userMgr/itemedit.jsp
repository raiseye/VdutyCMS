<!-- item项目编辑删除-->
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/item.css"
	charset='utf-8'>
<c:set var="headerbar_back" value='<a id="headerbar_back" class="button button-link  pull-left"  href="${pageContext.request.contextPath}/manageruser/user/item" data-transition="slide-out">返回</a>'/>
	
<c:set var="headerbar_right"
	value="<a  class='button button-link button-nav pull-right'  href='/manageruser/user/item/set'>添加</a>" />
<c:set var="headerbar_title" value="记录分类" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->
		<div class="content">
			<!-- 这里是页面内容区 -->
			<div class="page-index">
				<div class="list-block">
					<ul style="margin:0 !important; padding:0 !important;">
						<c:forEach items="${itemlist}" var="item">

						<div class="card">
					<div
						style="background-image: url(/public/images/e5b448d0f703918f89fd5e1a513d269758eec441.jpg);color: #fff;
					text-shadow:0 0 5px #CCCCCC, 0 0 10px #CCCCCC, 0 0 15px #CCCCCC, 0 0 20px #095816, 0 0 25px #095816, 0 0 30px #095816, 0 0 50px #095816, 0 0 80px #095816, 0 0 100px #095816, 0 0 150px #095816
"
						valign="bottom"
						class="card-header color-white  card_title" >${item.title}</div>
					<div class="card-content">
						<div class="card-content-inner">
							<p>详细信息》</p>
						</div>
					</div>
					<div class="card-footer">
						<div>创建于 ${item.createTime }</div>
						<!-- <a href="#" class="link">修改</a>  --><a href="#"  id="${item.id }"     class="link deleteitem">删除</a>

					</div>
				</div>
							
							
							
						</c:forEach>
					</ul>
				</div>
			</div>


		</div>

	</div>
</div>





<script>
	$(function() {
		console.log("$function--");
		$(document).on("pageInit", "#page_main", function(e, id, page) {
			//执行
			$(".deleteitem").click(function(){
				  console.log("will delete item!");
				  var item = this;
				  $.confirm('你真的要删除该记录分类', function () {
				      
				  var updata = {"id":item.id};
				  console.log("item.id:"+ updata);
					$.ajax({
						type : "POST",
						url : "/manageruser/user/item/delete",					
						data : updata,//"itemProperties":[{"name":"name","type":"type","unit":"unit"}]}), //JSON.stringify把object对象转换为json格式的字符串
						dataType : "text",
						success : function(
								re) {
							console
									.log(re);
							var result = eval("("+ re+ ")");
							if (result.errcode == "1") {
								$.toast("删除成功");
								console
										.log("成功：");
								
								location.reload();

							}
						}
					});

		
				  
			});
		     });

		});
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
