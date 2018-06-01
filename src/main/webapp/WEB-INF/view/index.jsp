<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/WEB-INF/view/include/taglib.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title>家居商城系统</title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index.css" rel="stylesheet"/>
    <%--添加标题cion--%>
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/title.ico" type="image/x-icon">
</head>
<body>
<div class="header">
    <img class="logo" src="${pageContext.request.contextPath}/static/images/logo.png"/>
    <label class="logo-title">家居商城系统</label>
    <ul class="inline">
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/client.png"/>&nbsp;&nbsp;欢迎您,<span id="loginUser"></span>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle mymsg" id="modifyInfo"><img src="${pageContext.request.contextPath}/static/images/32/166.png"/>&nbsp;&nbsp;修改个人信息<b class="caret"></b></a>
        </li>
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/200.png"/>&nbsp;&nbsp;<a class="loginout" href="javascript:;">退出</a>
        </li>
    </ul>
</div>

<div class="nav">
    <ul class="breadcrumb">
        <li>
            <img src="${pageContext.request.contextPath}/static/images/32/5025_networking.png"/>
        </li>
        <li><a href="#">首页</a> <span class="divider">>></span></li>
        <li class="active"></li>
    </ul>
</div>

<div class="container-fluid content">
    <div class="row-fluid">
        <div class="span2 content-left">
            <div class="accordion">
                <div class="accordion-group">
                    <div class="accordion-heading">
                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2">
                           <%--href="#collapseOne">--%>
                            <img class="left-icon"
                                 src="${pageContext.request.contextPath}/static/images/32/5026_settings.png"/><span
                                class="left-title">家居商城</span>
                        </a>
                    </div>

                    <div id="userManger" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4962_sitemap.png"/><span
                                class="left-body" >用户管理</span>
                        </div>
                    </div>

                    <div id="roleManger" class="accordion-body collapse in">
                        <div class="accordion-inner">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/role.png"/><span
                                class="left-body" >角色管理</span>
                        </div>
                    </div>

                    <div>
                        <div class="accordion-inner"  id="goodsManger">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4957_customers.png"/><span
                                class="left-body">商品管理</span>
                        </div>
                    </div>

                    <div>
                        <div class="accordion-inner" id="shoppCarManger">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/612.png"/><span
                                class="left-body">购物车管理</span>
                        </div>
                    </div>

                    <div>
                        <div class="accordion-inner" id="orderManger">
                            <img class="left-icon-child"
                                 src="${pageContext.request.contextPath}/static/images/32/4992_user.png"/><span
                                class="left-body">订单管理</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="span10 content-right" id="innerHtml">
            <iframe src="" width="100%" height="98%" marginheight="0"
                    marginwidth="0" frameborder="0" scrolling="auto" allowtransparency="true" id="taskConfigIframe"></iframe>
        </div>
    </div>

    <div id="modifyInfoModel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">修改个人信息</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" id="modifyInfoForm">
                <input type="text" name="userId" id="userId" style="display:none">
                <input type="text" name="age" id="age" style="display:none">
                <input type="text" name="role" id="role" style="display:none">
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
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-primary" id="add" onclick="saveUserInfo()">保存</button>
        </div>
    </div>

    <div class="clearfix"></div>
    <div class="foot"></div>
    <script src="${pageContext.request.contextPath}/static/scripts/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>

    <script>
        $(function () {
            $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/userList');

            // 从后台获取用户的个人信息
            $.ajax({
                type: "GET",
                dataType: "json",
                url: $ctx + "/user/getUserInfo",
                data: {},
                success: function (data) {
                    if(data.role!=='管理员'){
                        $("#userManger").hide();
                        $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/homewear');
                    }
                    $("#loginUser").text(data.name);

                    $("#userId").val(data.userId);
                    $("#userName").val(data.name);
                    $("#mobile").val(data.mobile);
                    $("#address").val(data.address);
                    $("#password").val(data.password);
                    $("#role").val(data.role);
                    $("#age").val(data.age);
                }
            })

        });

        function skip(emun) {
            if(emun===1){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/userList');
            }else if(emun===2){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/homewear');
            }else if(emun===3){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/order');
            }else if(emun===4){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/user/shoppCar');
            }else if(emun===5){
                $('#taskConfigIframe').attr('src','${pageContext.request.contextPath}/role/roleList');
            }
        }

        $("#userManger").on("click",function () {
            skip(1)
        })

        $("#goodsManger").on("click",function () {
            skip(2)
        })

        $("#orderManger").on("click",function () {
            skip(3)
        })

        $("#shoppCarManger").on("click",function () {
            skip(4)
        })

        $("#roleManger").on("click",function () {
            skip(5)
        })

        $("#modifyInfo").on("click",function () {
            $("#modifyInfoModel").modal("show");
        })

        function saveUserInfo() {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: $ctx + "/user/updateUser",
                data: $('#modifyInfoForm').serialize(),
                success: function (data) {
                    $("#modifyInfoModel").modal("hide");
                    alert("个人信息修改成功！");
                }
            })
        }



    </script>
</div>

</body>
</html>
