<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title>购物车列表</title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index2.css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPath">
<div class="container-fluid">
    <div class="row-fluid">
        <h4>购物车列表</h4>
        <div class="add"><a class="btn btn-success" onclick="selectShoppCar();">查询</a>&nbsp;&nbsp;<a
                class="btn btn-warning" onclick="clearShoppCar();">清空购物车</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>购物车编号</th>
                        <th>家居编号</th>
                        <th>家居单价</th>
                        <th>家居数量</th>
                        <th>家居总价</th><!-- 总价=单价*数量 -->
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="shoppCarListBody"></tbody>
                </table>
                <div id="page" class="shoppCarListBody">
                    <%--<p>一共${page.pages}页</p>--%>
                    <div>一共1页
                        <a href="/homewear-shopping/shoppCar/findPageAll?page=${page.firstPage}">第一页</a>
                        <a href="/homewear-shopping/shoppCar/findPageAll?page=${page.nextPage}">下一页</a>
                        <a href="/homewear-shopping/shoppCar/findPageAll?page=${page.prePage}">上一页</a>
                        <a href="/homewear-shopping/shoppCar/findPageAll?page=${page.lastPage}">最后页</a>
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
    $(function () {
        selectShoppCar();
    });

    function selectShoppCar() {
        $.ajax({
            url: $ctx + "/shoppCar/findAll",
            data: {},
            type: "GET",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var shoppCar = list[i];
                    html +=
                        "<tr>" +
                        "<td>" + shoppCar.shoppCarId + "</td>" +
                        "<td>" + shoppCar.homewearId + "</td>" +
                        "<td>" + shoppCar.price + "</td>" +
                        "<td>" +
                        "<input type='button' value='-' onclick='change(this,-1)'>" +
                        "<span>" + shoppCar.homeWearNo + "</span>" +
                        "<input type='button' value='+' onclick='change(this,1)'>" +
                        "</td>" +
                        "<td>" + shoppCar.price * shoppCar.homeWearNo + "</td>" +
                        "<td><a class=\"btn btn-info\" onclick='mkOrder(\"" + shoppCar.shoppCarId + "\");'>生成订单</a>&nbsp;&nbsp;" +
                        "<a class=\"btn btn-warning\" onclick='del(\"" + shoppCar.shoppCarId + "\");'>删除</a></td>" +
                        "</tr>";
                    $("#shoppCarListBody").html(html);
                }
            }
        })
    }

    $("#add").click(function () {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "addUser",
            data: $('#form1').serialize(),
            success: function (data) {
                alert("保存成功");
                selectUsers();
                $("#addModal").hide();
            }
        })
    });

    function editOpen(userId) {
        // 获取用户数据并放入弹框
        $.ajax({
            type: "get",
            dataType: "json",
            url: $ctx + "/findUserById?userId=" + userId,
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
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "updateUser",
            data: $('#form1').serialize(),
            success: function () {
                alert("保存成功");
                selectUsers();
                $("#addModal").hide();
            }
        })
    }

    function del(shoppCarId) {
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/shoppCar/deleteShoppCar?shoppCarId=" + shoppCarId,
            data: {},
            success: function () {
                selectShoppCar();
            }
        })
    }

    /* 改变商品数量,并提交后台 */
    function change(btn, n) {
        console.log($(btn).parent().children("span").text());
        var numberSt = $(btn).parent().children("span").text();
        var number = parseInt(numberSt);
        number += n;
        if (number <= 0) {
            return;
        }
        $(btn).parent().children("span").text('' + number + '');
        var newNo = parseInt($(btn).parent().children("span").text());
        var price = parseInt($(btn).parent().prev().text());
        $(btn).parent().next().html(parseInt(newNo * price));
        console.log("购物车编号" + parseInt($(btn).parent().prev().prev().prev().text()));
        var id = parseInt(parseInt($(btn).parent().prev().prev().prev().text()));

        // 将请求数据存入数据库
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/shoppCar/updateShoppCarNo",
            data: {"shoppCarId": id, "homeWearNo": newNo},
            success: function () {

            }
        })

    }


    // 清空购物车
    function clearShoppCar() {
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/shoppCar/clearCar",
            data: {},
            success: function () {
                selectShoppCar
            }
        })
    }

    // 生成订单
    function mkOrder(shoppCarId) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/order/mkOrder",
            data: {"shoppingCarId": shoppCarId},
            success: function () {
                $("#confirmModel").modal("hide");
                selectShoppCar();
                alert("订单生成成功");
            }
        })
    }

</script>
</body>
</html>
