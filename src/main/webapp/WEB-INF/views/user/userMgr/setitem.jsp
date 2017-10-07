<!-- item项目添加-->
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="#">提交</a>' />
<c:set var="headerbar_title" value="${userId}自定义事项" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->
		<div class="content">
			<div class="list-block">
				<ul>
					<!-- Text inputs -->
					<li>
						<div class="item-content">
							<div class="item-inner">
								<div class="item-title label">事项名称</div>
								<div class="item-input">
									<input id="item_name" type="text" placeholder="请填写事项的名称">
								</div>
							</div>
						</div>
					</li>
					<li>
						<div id="itemProperties"></div>
					</li>

					<li>
						<div class="card demo-card-header-pic">
							<div class="card-header color-white border">添加事项属性</div>
							<div class="card-content">
								<div class="card-content-inner">
									<div class="list-block">
										<ul>
											<!-- Text inputs -->
											<li>
												<div class="item-content">
													<div class="item-inner">
														<div class="item-title label">属性名称</div>
														<div class="item-input">
															<input id="pname" type="text" placeholder="property name">
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="item-content">
													<div class="item-inner">
														<div class="item-title label">属性类型</div>
														<div class="item-input">
															<input id="ptype" type="text" placeholder="选择类型" readonly />
														</div>
													</div>
												</div>
											</li>
											<li>
												<div class="item-content">
													<div class="item-inner">
														<div class="item-title label">属性单位</div>
														<div class="item-input">
															<input id="punit" type="text" placeholder="选择单位" readonly />
														</div>
													</div>
												</div>
											</li>
									</div>
								</div>
								<div class="card-footer">
									<a href="#" class="link" id="btn_pcancel">取消</a> <a
										id="btn_padd" href="#" class="link">添加</a>
								</div>
							</div>
						</div>
					</li>

				</ul>
			</div>
			<div class="content-block-title">已经添加的属性</div>
			<div class="list-block">
				<ul id="addidpul">
					<li class="item-content">
						<div class="item-media">
							<i class="icon icon-f7"></i>
						</div>
						<div class="item-inner">
							<div class="item-title">名称</div>
							<div class="item-after">操作</div>
						</div>
					</li>

				</ul>
			</div>


		</div>

	</div>
</div>
<%-- <%@ include file="/WEB-INF/views/common/javascript_load.jsp"%> --%>

<script>
	$(function() {
		console.log("$function--");
		$(document)
				.on(
						"pageInit",
						"#page_main",
						function(e, id, page) {
							//执行

							$("#ptype")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker">\确定\</button>\<h1 class="title">属性类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : [ '数字', '文本', '日期' ,'图片'],
													cssClass : 'picker-items-col-normal'
												} ]
											});

							$("#punit")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker">\确定\</button>\<h1 class="title">属性类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : ['【无】', 'cm', 'kg', '个' ],
													cssClass : 'picker-items-col-normal'
												} ]
											});
							$("#btn_padd").click(function() {
								addproperty();
							});
							$("#btn_pcancel").click(function() {
								cancelproperty();
							});
							//提交数据
							$("#submita")
									.click(
											function() {
												console.log("正要提交数据...");
												if ($("#item_name").val() == "") {
													$.toast("请填写自定义事项的名称");
													return false;
												}
												item = {
													"id" : "0",
													"title" : $("#item_name")
															.val(),
													"querySql" : "",
													"createTime" : "2000-01-01",
													"userId" : "${userId}",
													"itemDefine" : properties
												};

												/* item = {"id":"0",
														"title" : $("#item_name").val(),"querySql":"","createTime":"2000-01-01","userId":${userId},
														"itemDefine" : properties
													}; */

												if (properties.length > 0) {

													var updata = JSON
															.stringify(item);
													console.log(updata);
													$
															.ajax({
																type : "POST",
																url : "/manageruser/user/item/setsave",
																contentType : "application/json;charset=utf-8",//"application/json;charset=utf-8",//"application/json"
																data : updata,//"itemProperties":[{"name":"name","type":"type","unit":"unit"}]}), //JSON.stringify把object对象转换为json格式的字符串
																dataType : "json",
																success : function(
																		re) {
																	console
																			.log(re);
																	//var result = eval("("+ re+ ")");
																	if (re.errcode == "1") {
																		$
																				.toast("提交成功");
																		console
																				.log("提交成功：");
																		location.href ="${pageContext.request.contextPath}/manageruser/user/itemedit";

																	}
																}
															});

												} else {
													$.toast("您还没有添加自定义事项的属性");
												}
											});

						});
	});

	var item;
	var properties = [];
	var property;

	function addproperty() {
		var name = $("#pname").val();
		var type = $("#ptype").val();
		var unit = $("#punit").val();

		if (!name || !type || !unit) {
			//提示

			$.toast("请填写完整的属性");

			return;
		}
		switch (type) {
		case "数字":
			type = 2;
			break;
		case "日期":
			type = 3;
			break;
		case "图片":
			type = 4;
			break;
		case "文本":
			type = 1;
			break;
		default:
			1;
			break;
		}
		property = {
			"id" : "0",
			"itemId" : "0",
			"fieldName" : "",
			"fieldMeaning" : name,
			"dataType" : type,
			"unit" : unit
		};

		console.log("新增");
		console.log(property);
		if (properties.length > 0) {
			var plen = properties.length;
			for (var i = 0; i < plen; i++) {
				p = properties[i];

				if (p.fieldMeaning == name) {

					$.toast("已经有相同名称的属性");

					return false;
				}
			}
		}

		properties.push(property);
		addptohtml();
		console.log(properties);

	}
	function cnacelproperty() {

	}
	function addptohtml() {
		var htmls = "";
		var plen = properties.length;
		for (var i = 0; i < plen; i++) {
			p = properties[i];
			console.log(p);
			var type = "";
			switch (p.dataType) {
			case 2:
				type = "数字";
				break;
			case 3:
				type = "日期";
				break;
			case 1:
				type = "文本";
				break;
			default:
				"文本";
				break;
			}
			
			var htm = '<li class="item-content"><div class="item-media"><i class="icon icon-f7"></i></div>'
					+ '<div class="item-inner">'
					+ '<div class="item-title">'
					+ p.fieldMeaning
					+ '(<span>'
					+ type
					+ '</span>'
					+ '<span>'
					+ p.unit
					+ '</span>'
					+ ')'
					+ '</div>'
					+ '<div class="item-after"><a href="javascript:delproperty(&quot;'
					+ p.fieldMeaning + '&quot;)">删除</a></div>		</div>	</li>'
			htmls += htm;

		}
		$("#addidpul").html(htmls);
	}

	function delproperty(name) {

		var len = properties.length;
		for (var i = 0; i < len; i++) {
			p = properties[i];
			if (p.fieldMeaning == name) {
				//delete properties[i];
				properties.splice(i, 1);
				break;
			}
		}
		addptohtml();

	}
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
