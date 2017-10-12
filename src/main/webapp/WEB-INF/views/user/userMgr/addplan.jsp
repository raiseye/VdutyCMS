<!-- 计划添加-->
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
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
									<input id="repeatType" class="input" name="repeatType" type="text" placeholder="选择重复类型" readonly />

								</div>
								<div class="item-media"></div>
							</div>


						</div>	
						
	 <div id="weeklist"  style="display:none;">
     <nav class="bar bar-nav bar-standard">
  <h1 class="title">重复</h1>
  <a id="weeklistclose" class="button  pull-right" >
     <span class="icon icon-check" ></span></a>
</nav>
   
     
      <ul >     
        <li>                 
          <label class="label-checkbox item-content">
            <input type="checkbox"  name="checkboxWeek0">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期一
            </div>
          </label>
        </li>
        <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox1">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期二
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox2">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期三
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox3">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期四
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox4">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期五
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox5">
            <div class="item-media"><i class="icon icon-form-checkbox"></i></div>
            <div class="item-inner">
             星期六
            </div>
          </label>
        </li>
         <li>
          <label class="label-checkbox item-content">
            <input type="checkbox" name="checkbox6">
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
									<input id="alarmType" class="input"  name="alarmType" type="text" placeholder="选择提醒类型" readonly />

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
									<input type="time" class="input " id="doTime" name="doTime"
										placeholder="执行时间">
									<input type="text" class="input datetime-picker" style="display:none;" id="doTime1" name="doTime1"
										placeholder="执行时间">
								</div>
								<div class="item-media"></div>
							</div>

						</div>
					</li>				

				</ul>

               <input  type="hidden" id="repeatWeaks" name="repeatWeaks" value="" >
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
	if ($("#repeatType").val().indexOf("每周")>0)
		{
		  $("#weeklist").show("slowly");
		}
	else 	
		{
		  $("#weeklist").hide();
		}
	
	if ($("#repeatType").val().indexOf("一次")>0 ||$("#repeatType").val().indexOf("每天")>0 )
		{
		
		   $("#doTime").show(); $("#doTime1").hide();
		}
	else
		{
		 $("#doTime").hide(); 
		 $("#doTime1").show();
		 console.log("doTime1 show");
		}
}


	$(function() {	
		
		$(document)
				.on(
						"pageInit",
						"#page_main",
						function(e, id, page) {

											
							$("#weeklistclose").click(function(){
								
								$("#weeklist").hide();
								
							})	;											
							
							
							
							
							$("#datetime-picker")
									.datetimePicker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-right close-picker">确定</button>\<h1 class="title">请选择执行时间</h1>\</header>'
											});

							$("#repeatType")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button  class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker" onclick="checkSelect()">\确定\</button>\<h1 class="title">重复类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : [ '0.一次','1.每天', '2.每月',
															'3.每年', '4.每周' ],
													cssClass : 'picker-items-col-normal'
												} ]
											});

							$("#alarmType")
									.picker(
											{
												toolbarTemplate : '<header class="bar bar-nav">\<button class="button button-link pull-left">\</button>\<button class="button button-link pull-right close-picker">\确定\</button>\<h1 class="title">重复类型</h1>\</header>',
												cols : [ {
													textAlign : 'center',
													values : [ '1.提醒一次', '2.提醒三次',
															'3.直到确认' ],
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
												if ($("#doTime").val()=="" && $("#doTime1").val()!="")
													{
													$("#doTime").val("00:00");
													}
												 if  ($("#doTime1").val()=="" && $("#doTime").val()!="")
													{
														$("#doTime1").val("1971-01-01 00:00");
														}   
												$('.input')
														.each(
																function(e) {																	
																	
																	var repeatWeeks="";
																	try
																	{
																	console.log($(this).attr("name"));
																	}
																	catch(e)
																	{
																		console.log("get id error!")
																	}
																	if ($(this).attr("name") == "repeatType" &&  $(this).val().indexOf("每周")>0)
																		{
																		$("input[type='checkbox']").each(function(e){
																			if ($(this).get(0).checked)
																			repeatWeeks += $(this).attr("name").substr($(this).attr("name").length-1) + ",";
																			
																		}) ;
																		
																		repeatWeeks = repeatWeeks.substr(0,repeatWeeks.length-1);
																		console.log("repeatWeeks:"+repeatWeeks);
																	
																		if (repeatWeeks=="")
																		{
																		   $.toast("请选者重复的日期");
																		   return false;
																		}
																		else
																			{
																			  $("#repeatWeaks").val(repeatWeeks);
																			}
																		}	
																	
																	
																	$("#repeatWeeks").val(repeatWeeks);
																												
																	

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
																	else
																		{
																		
																		   console.log(thismeaning+":"+thisval);
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
													errtitle = errtitle.substring(0,errtitle.length-1);
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



