<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/item.css"
	charset='utf-8'>
	
<c:set var="headerbar_back" value='<a id="headerbar_back" class="button button-link  pull-left"  href="${pageContext.request.contextPath}/manageruser/user/" data-transition="slide-out">返回</a>'/>
		
<c:set var="headerbar_right"
	value="<a  class='button button-link button-nav pull-right'  href='/manageruser/user/itemedit'>设置</a>" />
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

							<li  id="li_${item.id }"  class="item-content item-link liitem" style="margin:0px; padding:0px;">
								<div class="item-media">
									<i class="icon icon-f7"></i>
								</div>
								<div class="item-inner">
									<div class="item-title">${item.title}</div>
									<div class="item-after"></div>
								</div>
							</li>
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

			$(".liitem").click(function(){
				 var itemId = this.id.replace("li_","");
				 console.log(itemId);
				 location.href="/manageruser/user/item/add/"+itemId;
				 
				 
				
			});
			
			
		});
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
