<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index2.css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPathUser">
<div class="container-fluid">
    <div class="row-fluid">
        <h4>角色列表</h4>
        <%--<div class="add"><a class="btn btn-success " onclick="openadd();">新增</a></div>--%>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>角色编号</th>
                        <th>角色名称</th>
                        <%--<th>操作</th>--%>
                    </tr>
                    </thead>
                    <tbody id="userListBody">
                    <c:forEach items="${roleList }" var="role" varStatus="roleIndex">
                        <tr>
                            <td>${roleIndex.index+1 }</td>
                            <td>${role.roleId }</td>
                            <td>${role.roleName }</td>
                            <%--<td>--%>
                                <%--<button type="button" class="btn btn-primary">编辑</button>--%>
                            <%--</td>--%>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="row">
                    <%--<p>一共${page.pages}页</p>--%>
                    <p>一共1页</p>
                    <div class="page-header">
                        <a href="${pageContext.request.contextPath}/role/roleList?currentPage=1">第一页</a>
                        <a href="${pageContext.request.contextPath}/role/roleList?currentPage=${requestScope.page.currentPage-1}">上一页</a>
                        <a href="${pageContext.request.contextPath}/role/roleList?currentPage=${requestScope.page.currentPage+1}">下一页</a>
                        <a href="${pageContext.request.contextPath}/role/roleList?currentPage=${requestScope.page.pageCount}">最后页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/content.js"></script>

<script>

</script>
</body>
</html>
