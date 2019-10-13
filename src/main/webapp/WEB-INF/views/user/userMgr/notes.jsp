<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/WEB-INF/views/common/taglibs.jsp"%>

<%@ include file="/WEB-INF/views/user/head.jsp"%>
<div class="page" id="page_main">
<%@ include file="/WEB-INF/views/user/headerbar.jsp"%>
	
	
	<div class="content">
		<!-- 这里是页面内容区 -->
		<div class="content" >
            <!-- 这里是页面内容区 -->
            <div class="page-index">
                <div class="card">
                    <div style="background-image:url(/public/images/e5b448d0f703918f89fd5e1a513d269758eec441.jpg); "
                         valign="bottom" class="card-header color-white no-border card_title">宝宝喂奶
                    </div>
                    <div class="card-content">
                        <div class="card-content-inner">
                            <p>重复：每个两小时一次；还有00:15:00到达提醒</p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div>创建于 2017/07/15</div>
                        <a href="#" class="link">关闭</a>
                        <a href="dotask.html" class="link">执行</a>

                    </div>
                </div>

                <div class="card">
                    <div style="background-image:url(/public/images/e5b448d0f703918f89fd5e1a513d269758eec441.jpg); "
                         valign="bottom" class="card-header color-white no-border card_title">宝宝便便
                    </div>
                    <div class="card-content">
                        <div class="card-content-inner">
                            <p>重复：每隔12小时一次；还有01:15:00到达提醒</p>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div>创建于 2017/07/15</div>
                        <a href="#" class="link">关闭</a>
                        <a href="dotask.html" class="link">执行</a>

                    </div>
                </div>

            </div>
        </div>
		
	</div>
</div>
<%@ include file="/WEB-INF/views/common/javascript_load.jsp"%>
<script>
	$(function() {
		console.log("$function--");
		$(document).on("pageInit", "#page_main", function(e, id, page) {
//执行
			
			

		});
	});
</script>

<%@ include file="/WEB-INF/views/user/foot.jsp"%>
