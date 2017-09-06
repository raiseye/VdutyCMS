<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<c:set var="ctx" value="${pageContext.request.contextPath}/res/admin" />
<c:set var="BASE_PATH" value="${pageContext.request.contextPath}" />
<c:set var="main_ctx" value="${pageContext.request.contextPath}/res/main" />
<c:set var="upload_pic_ctx" value="${pageContext.request.contextPath}/upload" />
<c:set var="cur_user" value="${sessionScope.currentUser}" />
<c:set var="headerbar_back" value='<a id="headerbar_back" class="button button-link  pull-left" href="javascript:history.go(-1)"
		data-transition="slide-out">返回</a>'/>
<c:set var="headerbar_title" value="标题" />
<c:set var="headerbar_right" value="设置" />