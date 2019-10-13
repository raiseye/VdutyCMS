<!-- item项目报告-->
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
<c:set var="headerbar_back"
	value='<a id="headerbar_back" class="button button-link  pull-left" href="javascript:history.go(-1)"
		data-transition="slide-out">返回</a>' />

<div class="page" id="page_main">
	<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	<div class="content">
		<!-- 这里是页面内容区 -->

		<div class="page-index"  >

			<div class="buttons-tab">
				<a href="#tab1" class="tab-link active button">列表</a> <a
					href="#tab2" class="tab-link button">图表</a>

			</div>

			<div class="tabs">
				<div id="tab1" class="tab active">
					<div class="content-block">

						<c:forEach items="${list}" var="data">

							<div class="card" id="card_${data['id']}">
								<div class="card-header">执行时间：${data["记录时间"]}</div>
								<div class="card-content">
									<div class="card-content-inner">
										<c:forEach items="${data}" var="map">
											<c:if
												test="${map.key!='记录时间' && map.key!='创建时间' && map.key!='id' && map.key!='item_id'}">
												<p style="padding-left: 5px;">${map.key}:${map.value}</p>
											</c:if>
										</c:forEach>
									</div>

								</div>
								<div class="card-footer">
									记录时间：${data["创建时间"]} <a
										href="javascript:deleteItemData(${data['id'] });" class="link">删除</a>
								</div>
							</div>


						</c:forEach>

					</div>


				</div>


				<div id="tab2" class="tab" >
					<div class="content-block"  style="background:#ffffff;">
						<div id="chartsdiv"  style="width: 100%;height:400px; background:#ffffff; "></div>
		</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>

<script  src="/public/lib/echarts.min.js"></script>
<script>
   var meaning = ${meaning};
	var charjson = ${json};
	var chardatelist = [];
	var series = []
    var charkeys= [];
	var charkeys_meaning=[];
	function getLocalTime(nS) {
		return new Date(parseInt(nS)).toLocaleString()
				.replace(/:\d{1,2}$/, ' ');
	}

	(function(){
		var one = charjson[0];
		for(var key in one)
			{
			  if (key.indexOf("n")==0){//数字类型
			    charkeys.push(key);
			  console.log("meaning");
			  var obj  = meaning[0];
			  console.log("====="+obj[key]);
			 
			    charkeys_meaning.push(obj[key]);
			    
			  
			  }
			}
	console.log(	charkeys_meaning);
		console.log(charkeys);
		var datalist=[];
		for (var i=0;i<charjson.length;i++ )
			{
			      for(var idx in charkeys )
			{
			    	  var key = charkeys[idx];
			    	 if (datalist[key]==null)
			    	  datalist[key]=[];
			    	
			    	 var val = charjson[i][key] ;
			    	 if (val==undefined)
			    		 {
			    		     val=0;
			    		 }
			    	 console.log(key+"   "+val);
			    	 
			    	  datalist[key].push( val);
			}
			}
		
		   for(var idx in charkeys )
			   {
			      var chardatajson = {type:"line",name:charkeys_meaning[idx],data:datalist[charkeys[idx]]};
			      
			      
			      
			      series.push(chardatajson);
			     
			   }
		console.log(series);
		
	})();
	
	//获取日期图标数据
	(function() {
		var datalen = charjson.length;
		for (var i = 0; i < datalen; i++) {
			chardatelist.push(getLocalTime(charjson[i].execute_datetime.time));

		}

	})();
	
	

	(function(){
		console.log("each");
		$.each(charjson,function(n,value){
			console.log(n+"  " + value);
			for(var key in value)
				{
				 //  console.log(key + ":" + value[key]);
				}
		})
		
	})();

	
	$(function() {
	
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
	function deleteItemData(id) {

		$
				.confirm(
						'你真的要删除该条记录',
						function() {
							willDel = true;

							//deletedata
							var url = "${pageContext.request.contextPath}/manageruser/user/item/deletedata/"
									+ id;
							console.log(url);
							$.ajax({
								type : "GET",
								url : url,
								dataType : "text",
								success : function(re) {

									console.log(re);
									var re = eval("(" + re + ")");
									if (re.errcode == "1") {

										$.toast("删除成功");

										//location.href =location.href;

										$("#card_" + id).remove();

									}
								},
								error : function(e) {
									console.log(e);
								}
							});
						});

	}
	
	//echarts s
	var chartsminwidth = $(window).width()*0.85;
	
	$("#chartsdiv").css({"width":chartsminwidth+"px"});//直接设置元素的高
	console.log("chartswidth:"+$("#chartsdiv").width());
	
	 var myChart = echarts.init(document.getElementById('chartsdiv'));
	var  option = {
    
    tooltip: {
        trigger: 'item',
        formatter: '{a} <br/>{b} : {c}'
    },
    legend: {
        left: 'center',
        data: charkeys_meaning
    },
    xAxis: {
        type: 'category',
        name: 'x',
        splitLine: {show: false},
        data: chardatelist
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    yAxis: {
        type: 'log',
        name: 'y'
    },
    series: series
};
	
	
	
	  // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
      myChart.resize(); 
	  
      window.onresize = function(){
    	  console.log("onresize");
    	  $("#chartsdiv").css({"width":"100%"});//直接设置元素的高
    	    myChart.resize(); 
    	};
	//echarts e
	
	
</script>
<script
	src="${pageContext.request.contextPath}/public/lib/echarts.min.js"></script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
