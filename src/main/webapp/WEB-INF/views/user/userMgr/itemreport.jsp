<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/item.css"
	charset='utf-8'>

<c:set var="headerbar_back"
	value='<a id="headerbar_back" class="button button-link  pull-left"  href="${pageContext.request.contextPath}/manageruser/user/" data-transition="slide-out">返回</a>' />

<c:set var="headerbar_right"
	value="<a  class='button button-link button-nav pull-right'  href='/manageruser/user/itemedit'></a>" />
<c:set var="headerbar_title" value="${title_name}" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->

		<div class="page-index">

 <div class="buttons-tab">
      <a href="#tab1" class="tab-link active button">列表</a>
      <a href="#tab2" class="tab-link button">图表</a>
      
    </div>

    <div class="tabs">
      <div id="tab1" class="tab active">
        <div class="content-block">

			<c:forEach items="${list}" var="data">

				<div class="card">
					<div class="card-header">执行时间：${data["记录时间"]}</div>
					<div class="card-content">
						<div class="card-content-inner">
							<c:forEach items="${data}" var="map">
							<c:if test="${map.key!='记录时间' && map.key!='创建时间' && map.key!='id' && map.key!='item_id'}">
								<p style="padding-left: 5px;">${map.key}:${map.value}</p>
                           </c:if>  
							</c:forEach>
						</div>

					</div>
					<div class="card-footer">
					记录时间：${data["创建时间"]}
						<a href="javascript:deleteItemData(${data['id'] });" class="link">删除</a>
					</div>
				</div>


			</c:forEach>

		</div>


	</div>
	
	
	<div id="tab2" class="tab">
        <div class="content-block">
          <p>敬请期待</p>
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

			$(".liitem").click(function() {
				var itemId = this.id.replace("li_", "");
				console.log(itemId);
				location.href = "/manageruser/user/item/add/" + itemId;

			});

		});
	});
	
	/**
	删除
	**/
	function deleteItemData(id)
	{
		$
		.toast("删除成功");
	}
	
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
