<!-- 计划添加-->
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>
<%@ include file="/WEB-INF/views/user/head.jsp"%>
<c:set var="headerbar_right"
	value='<a  id="submita" class="button button-link button-nav pull-right" href="/manageruser/user/item/datalist/${itemMainId}/${pageIndex}/${pageSize}">报表</a>' />
<c:set var="headerbar_title" value="${title_name }" />
<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<div class="content">
		
		<form id="planform" name="form1"
			action="/manageruser/user/plan/addsave" method="post">
			<input type="hidden"  id="item_id" name="item_id" value="${itemMainId}">
			<!-- 这里是页面内容区 -->
			<c:set var="dataType" value="text" />

			<div class="list-block">
				<ul>				
					
					<li>
						<div class="item-content">
							<div class="item-media">
								<i class="icon icon-form-name"></i>
							</div>
							<div class="item-inner">
								<div class="item-title label">计划名称</div>
								<div class="item-input">
									<input type="text" id="title" class="input" name="title"
										placeholder="计划名称">

								</div>
								<div class="item-media"></div>
							</div>

						</div>
					</li>
					
					
					<li>
						<div class="item-content">
							<div class="item-media">
								<i class="icon icon-form-name"></i>
							</div>
							<div class="item-inner">
								<div class="item-title label">重复类型</div>
								<div class="item-input">
									<input id="repeatType" class="input" name="repeatType" type="text" placeholder="选择类型" readonly />

								</div>
								<div class="item-media"></div>
							</div>

						</div>
<div class="list-block media-list " id="weeklist" style="display:none;">
      <ul>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期一
            </div>
          </label>
        </li>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期二
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期三
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期四
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期五
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期六
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期日
            </div>
          </label>
        </li>
        
      </ul>
    </div>
						

					</li>
					
					
					
					<li>
						<div class="item-content">
							<div class="item-media">
								<i class="icon icon-form-name"></i>
							</div>
							<div class="item-inner">
								<div class="item-title label">提醒类型</div>
								<div class="item-input">
									<input id="alarmType" class="input"  name="alarmType" type="text" placeholder="选择类型" readonly />

								</div>
								<div class="item-media"></div>
							</div>

						</div>
					</li>
					
					
					<li>
						<div class="item-content">
							<div class="item-media">
								<i class="icon icon-form-name"></i>
							</div>
							<div class="item-inner">
								<div class="item-title label">执行时间</div>
								<div class="item-input">
									<input type="text" class="datetime-picker input" name="doTime"
										placeholder="执行时间">

								</div>
								<div class="item-media"></div>
							</div>

						</div>
					</li>				

				</ul>

               <input  type="hidden" name="repeatWeaks" value="" >
               <!--  <input  type="hidden" name="id" value="" >
                <input  type="hidden" name="status" value="0" >
                <input  type="hidden" name="createDatetime" value="0" >
                <input  type="hidden" name="userId" value="0" > -->
			</div>



			<div class="content-block">
				<div class="row">
					<div class="col-50">
						<a href="#" class="button button-big button-fill button-danger reset">取消</a>
					</div>
					<div class="col-50">
						<a href="#"
							class="button button-big button-fill button-success submit">提交</a>
					</div>
				</div>
			</div>
<input id="reset" name='reset' type="reset" style="display:none;" /> 
		</form>



		



	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/common/javascript_load.jsp"%> --%>
<script src="/public/lib/layer_mobile/layer.js"></script>
<script>

function checkSelect()
{
	console.log($("#repeatType").val());
	if ($("#repeatType").val()=="每周")
		{
		$("#weeklist").show("slowly");
		}
	else
		{
		$("#weeklist").hide();
		}
}


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

							$("#repeatType")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button  class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker" onclick="checkSelect()">\确定\</button>\<h1 class="title">重复类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : [ '每天', '每月',
															'每年', '每周' ],
													cssClass : 'picker-items-col-normal'
												} ]
											});

							$("#alarmType")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker">\确定\</button>\<h1 class="title">重复类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : [ '提醒一次', '提醒三次',
															'直到确认' ],
													cssClass : 'picker-items-col-normal'
												} ]
											});

							$(".datetime-picker")
									.datetimePicker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择记录时间</h1>\</header>'
											});

							$(".reset").click(function() {
								//	$("input[name='reset']").click();

								$("#reset").click();
							});
							$(".submit")
									.click(
											function() {
												var errtitle = "";
												$('.input')
														.each(
																function(e) {
																	console
																			.log($(
																					this)
																					.val());

																	var thisdatatypeval = $(
																			this)
																			.attr(
																					"datatype");
																	var thisval = $(
																			this)
																			.val();
																	var thismeaning = $(
																			this)
																			.attr(
																					"placeholder");
																	if (thisval == "") {
																		errtitle += thismeaning
																				+ ",";

																	}

																	if (thisdatatypeval != "undifine") {
																		switch (thisval) {
																		case 1:
																			break;
																		case 2:
																			break;
																		case 3:
																			break;
																		case 4:
																			break;
																		default:
																			break;

																		}
																	}

																});
												if (errtitle != "") {
													//信息框
													layer.open({
														content : '请填写'
																+ errtitle
																+ "等信息",
														btn : '我知道了'
													});
													return false;
												}
												$("#planform").submit();
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



