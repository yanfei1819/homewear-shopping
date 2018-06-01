<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <title>在线家居商城</title>
    <link href="${pageContext.request.contextPath}/static/styles/login.css" type="text/css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPath">
<div class="login">
    <div class="message">在线家居商城</div>
    <div id="darkbannerwrap"></div>
    <form method="post" id="userForm">
        <input name="action" value="login" type="hidden"/>
        <input name="username" placeholder="用户名" required="" type="text"/>
        <hr class="hr15"/>
        <input name="password" placeholder="密码" required="" type="password"/>
        <hr class="hr15"/>
        <input value="登录" style="width:100%;" type="button" id="submit"/>
        <div style="margin-left: 92%"><a id="register">注册</a></div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>

<script>
    $(function () {
        $("#register").attr('href','${pageContext.request.contextPath}/user/register')
    });

    var $urlPath = $('#urlPath').val();

    $("#submit").click(function () {
        $.ajax({
            type: "post",
            dataType: "text",
            url: $urlPath + "/user/login",
            data: $('#userForm').serialize(),
            success: function (data) {
                if (data && data === 'index') {
                    window.location.href = $urlPath + '/user/home'
                } else {
                    alert("用户名或者密码错误，请重新输入");
                }
            },
            error: function(){
                alert('请求失败');
            }
        })
    })


</script>
</body>
</html>