<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
        <h4>用户列表</h4>
        <%--<div><input type="text" id="search" style="margin: 0;height: 6%"><span style="margin-left: 2%"><a class="btn btn-success" onclick="selectUsersByCondition();">查询</a></span></div>--%>
        <div class="add"><a class="btn btn-success " onclick="openadd();">新增</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>用户编号</th>
                        <th>用户姓名</th>
                        <th>用户手机</th>
                        <th>用户角色</th>
                        <th>用户年龄</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="userListBody"></tbody>
                </table>
                <div class="row">
                    <%--<p>一共${page.pages}页</p>--%>
                    <div class="">一共1页
                        <a href="/homewear-shopping/user/findPageAll?page=${page.firstPage}">第一页</a>
                        <a href="/homewear-shopping/user/findPageAll?page=${page.nextPage}">下一页</a>
                        <a href="/homewear-shopping/user/findPageAll?page=${page.prePage}">上一页</a>
                        <a href="/homewear-shopping/user/findPageAll?page=${page.lastPage}">最后页</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">添加用户</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form1">
                    <input type="text" name="userId" id="userId" style="display:none">
                    <div class="control-group">
                        <label class="control-label" for="userName">姓名</label>
                        <div class="controls">
                            <input type="text" name="name" id="userName" placeholder="姓名" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="mobile">手机</label>
                        <div class="controls">
                            <input type="text" id="mobile" name="mobile" placeholder="手机" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="address">地址</label>
                        <div class="controls">
                            <input type="text" id="address" name="address" placeholder="地址" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="password">密码</label>
                        <div class="controls">
                            <input type="text" id="password" name="password" placeholder="密码" style="height: 30px">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="role">角色</label>
                        <div class="controls">
                            <select id="role" name="role">
                                <option value="管理员">管理员</option>
                                <option value="用户">用户</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="add" onclick="save()">保存</button>
                <button class="btn btn-primary" id="edt" onclick="edit();">保存</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/content.js"></script>

<script>
    $(function () {
        selectUsers();
    });

    function selectUsersByCondition() {
        var condition = $('#search').val();
        $.ajax({
            url: $ctx + "/user/findAllByCondition?mobile=" + condition,
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var user = list[i];

                    if (user.userId || user.name || user.mobile || user.role || user.age) {
                        html += "<tr>" +
                            "<td>" + user.userId + "</td><td>" + user.name + "</td><td>" + user.mobile + "</td><td>" + user.role + "</td><td>" + user.age + "</td>" +
                            "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + user.userId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + user.userId + "\");'>删除</a></td>" +
                            "</tr>";
                    }
                    $("#userListBody").html(html);
                }
            }
        })
    }

    function selectUsers() {
        $.ajax({
            url: $ctx + "/user/findAll",
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var user = list[i];
                    html += "<tr>" +
                        "<td>" + user.userId + "</td><td>" + user.name + "</td><td>" + user.mobile + "</td><td>" + user.role + "</td><td>" + user.age + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='editOpen(\"" + user.userId + "\");'>修改</a>&nbsp;&nbsp;<a class=\"btn btn-warning\" onclick='del(\"" + user.userId + "\");'>删除</a></td>" +
                        "</tr>";
                    $("#userListBody").html(html);
                }
            }
        })
    }

    // 此处如果用jQuery绑定事件，则获取不到$urlPath
    function save() {

        if (!$("#userName").val() || !$("#password").val() || !$("#mobile").val() || !$("#address").val()) {
            alert("信息不完整，请重新输入！");
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/user/addUser",
            data: $('#form1').serialize(),
            success: function (data) {
                alert("保存成功");
                selectUsers();
                $("#addModal").hide();
            }
        })
    }

    function editOpen(userId) {
        // 获取用户数据并放入弹框
        $.ajax({
            type: "get",
            dataType: "json",
            url: $ctx + "/user/findUserById?userId=" + userId,
            data: {},
            success: function (data) {
                $("#addModal").modal("show");
                $("#add").hide();
                $("#userName").val(data.name);
                $("#password").val(data.password);
                $("#mobile").val(data.mobile);
                $("#address").val(data.address);
                $("#userId").val(data.userId);
            }
        })
    }

    function edit() {
        var $urlPath = $('#urlPathUser').val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $urlPath + "/user/updateUser",
            data: $('#form1').serialize(),
            success: function () {
                alert("保存成功");
                $("#addModal").hide();
                selectUsers();
            }
        })
    }

    function del(userId) {
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/user/deleteUser?userId=" + userId,
            data: {},
            success: function () {
                selectUsers();
            }
        })
    }


    // 测试原生的ajax技术
    function testAjax() {

        var xhr = null;
        if(window.XMLHttpRequest){ // 非IE内核
            xhr = new XMLHttpRequest();
        }else if(window.ActiveXObject){
            xhr = new ActiveXObject("Microsoft.XMLHTTP");
        }else{
            xhr = null;
        }

        xhr.open("GET","");
        xhr.send();
        xhr.onreadystatechange=function () {
            if(xhr.readyState==4&& xhr.status==200){
            }else{
            }
        };
        
        xhr.onload=function () {  // 请求成功时
            
        };

        xhr.onloadend = function () {  // 请求失败时

        }

    }




</script>
</body>
</html>
