<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
  <c:when test="${empty sessionScope['key_user'].userId}">
    <c:set var="isLogin" value="false"/>
  </c:when>
  <c:otherwise>
    <c:set var="isLogin" value="true"/>
  </c:otherwise>
</c:choose>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script>var $ctx = '${ctx}'; var $isLogin = '${isLogin}';</script>