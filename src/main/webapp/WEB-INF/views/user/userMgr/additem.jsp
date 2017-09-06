<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="/manageruser/user/item/datalist/${itemMainId}/${pageIndex}/${pageSize}">报表</a>' />
<c:set var="headerbar_title" value="${title_name }" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>

	<div class="content">
	<form  id="itemform"  name="form1"  action="/manageruser/user/item/addsave" method="post" >
		<!-- 这里是页面内容区 -->
		<div class="list-block">
			<ul>
				<c:forEach items="${itemDefineList}" var="item">

					<!-- Text inputs -->
					<li>
						<div class="item-content">
	<div class="item-media"><i class="icon icon-form-name"></i></div>
							<div class="item-inner">
								<div class="item-title label">${item.fieldMeaning }</div>
								<div class="item-input">
									<input type="text" id="${item.fieldName }" name="${item.fieldName }"
										placeholder="${item.fieldMeaning }">
								</div>
								<div class="item-media">${item.unit}</div>
							</div>
							
							
							
						</div>
					</li>

				</c:forEach>
			</ul>
			
		
		</div>
		  <div class="content-block">
      <div class="row">
        <div class="col-50"><a href="#" class="button button-big button-fill button-danger">取消</a></div>
        <div class="col-50"><a href="#" class="button button-big button-fill button-success submit">提交</a></div>
      </div>
    </div>
    
    	</form>
  </div>
	</div>

<%-- <%@ include file="/WEB-INF/views/common/javascript_load.jsp"%> --%>

<script>
	$(function() {

		$(document)
				.on(
						"pageInit",
						"#page_main",
						function(e, id, page) {
							
							$(".submit").click(function(){
								$("#itemform").submit();
							});
							
                       if(false)
							{
							$
									.ajax({
										type : "POST",
										url : "/manageruser/user/item/setsave",
										contentType : "application/json;charset=utf-8",//"application/json;charset=utf-8",//"application/json"
										data : updata,//"itemProperties":[{"name":"name","type":"type","unit":"unit"}]}), //JSON.stringify把object对象转换为json格式的字符串
										dataType : "json",
										success : function(re) {
											console.log(re);
											//var result = eval("("+ re+ ")");
											if (re.errcode == "1") {
												$.toast("提交成功");
												console.log("提交成功：");
												location.href = "${pageContext.request.contextPath}/manageruser/user/itemedit";

											}
										}
									});
						}
						});
	
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
