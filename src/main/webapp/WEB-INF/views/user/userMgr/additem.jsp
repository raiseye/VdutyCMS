<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="/manageruser/user/item/datalist/${itemMainId}/${pageIndex}/${pageSize}">报表</a>' />
<c:set var="headerbar_title" value="${title_name }" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>


	<div class="content">
		<form id="itemform" name="form1"
			action="/manageruser/user/item/addsave" method="post">
			<input type="hidden"  id="item_id" name="item_id" value="${itemMainId}">
			<!-- 这里是页面内容区 -->
			<c:set var="dataType" value="text" />


			<div class="list-block">
				<ul>
					<c:forEach items="${itemDefineList}" var="item">
						<c:set var="dataTypeValue" value="${item.dataType}" />


						<c:choose>
							<c:when test="${dataTypeValue==1} ">

								<c:set var="dataType" value="text" />
							</c:when>
							<c:when test="${dataTypeValue==2}">

								<c:set var="dataType" value="number" />
							</c:when>
							<c:when test="${dataTypeValue==3}">

								<c:set var="dataType" value="date" />
							</c:when>
							<c:when test="${dataTypeValue==4}">

								<c:set var="dataType" value="file" />
							</c:when>

						</c:choose>

						<!-- Text inputs -->
						<li>
							<div class="item-content">
								<div class="item-media">
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-title label">${item.fieldMeaning }</div>
									<div class="item-input">
										<input type="${dataType}" id="${item.fieldName }"
											name="${item.fieldName }" datatype="${item.dataType}"
											placeholder="${item.fieldMeaning }">
									</div>
									<div class="item-media">${item.unit}</div>
								</div>

							</div>
						</li>

					</c:forEach>
					<li>
						<div class="item-content">
							<div class="item-media">
								<i class="icon icon-form-name"></i>
							</div>
							<div class="item-inner">
								<div class="item-title label">记录时间</div>
								<div class="item-input">
									<input type="text" id="datetime-picker" name="execute_datetime"
										placeholder="记录时间">

								</div>
								<div class="item-media"></div>
							</div>

						</div>
					</li>

				</ul>


			</div>



			<div class="content-block">
				<div class="row">
					<div class="col-50">
						<a href="#" class="button button-big button-fill button-danger">取消</a>
					</div>
					<div class="col-50">
						<a href="#"
							class="button button-big button-fill button-success submit">提交</a>
					</div>
				</div>
			</div>

		</form>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/common/javascript_load.jsp"%> --%>
<script src="/public/lib/layer_mobile/layer.js"></script>
<script>
	$(function() {

		$(document)
				.on(
						"pageInit",
						"#page_main",
						function(e, id, page) {

							$("#datetime-picker")
									.datetimePicker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择记录时间</h1>\</header>'
											});

							$(".submit").click(function() {
                              var errtitle="";
								$('input').each(function(e) {
									console.log($(this).val());
									console.log($(this).attr("datatype"));
									var thisdatatypeval = $(this).attr("datatype");
									var thisval = $(this).val();
									var thismeaning = $(this).attr("placeholder");
									  if (thisval=="")
                                 	 {
                                 	   errtitle  += thismeaning+",";
                                 	   
                                 	 }
                                  
									if (thisdatatypeval != "undifine") {
                                         switch(thisval)
                                         {
                                         case 1:break;
                                         case 2:break;
                                         case 3:break;
                                         case 4:break;
                                         default:
                                        	 break;
                                         
                                         }
									}

								});
								if (errtitle!="")
									{
									//信息框
									  layer.open({
									    content: '请填写' + errtitle+"等信息"
									    ,btn: '我知道了'
									  });
									   return false;
									}
								$("#itemform").submit();
							});

							if (false) {//没用
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



