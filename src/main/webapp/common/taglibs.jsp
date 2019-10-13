<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<c:set var="ctx" value="${pageContext.request.contextPath}/res/user" />

<c:set var="BASE_PATH" value="${pageContext.request.contextPath}" />
<c:set var="main_ctx" value="${pageContext.request.contextPath}/res/main" />
<c:set var="upload_pic_ctx" value="${pageContext.request.contextPath}/upload" />
<c:set var="cur_user" value="${sessionScope.currentUser}" />
<c:set var="menu_active" value="nav_homepage"/>
