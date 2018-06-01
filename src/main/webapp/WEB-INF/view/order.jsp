<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index2.css" rel="stylesheet"/>
</head>
<body>
<input type="hidden" value="${pageContext.request.contextPath}" id="urlPath">
<div class="container-fluid">
    <div class="row-fluid">
        <h4>订单列表</h4>
        <div class="add"><a class="btn btn-success" onclick="selectOrder();">查询</a></div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>订单编号</th>
                        <th>用户编号</th>
                        <th>购物车编号</th>
                        <th>下单日期</th>
                        <th>订单状态</th><!--已付款、未付款-->
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="orderListBody"></tbody>
                </table>
                <div id="page" class="orderListBody">
                    <%--<p>一共${page.pages}页</p>--%>
                    <div>一共1页
                        <a href="/homewear-shopping/order/findPageAll?page=${page.firstPage}">第一页</a>
                        <a href="/homewear-shopping/order/findPageAll?page=${page.nextPage}">下一页</a>
                        <a href="/homewear-shopping/order/findPageAll?page=${page.prePage}">上一页</a>
                        <a href="/homewear-shopping/order/findPageAll?page=${page.lastPage}">最后页</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">修改订单</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="orderForm">
                    <%--<input type="text" name="userId" id="id" style="display:none">--%>
                    <div class="control-group">
                        <%--<label class="control-label" for="id">订单编号</label>--%>
                        <%--<div class="controls">--%>
                        <%--<input type="text" name="id" id="id" disabled="disabled">--%>
                        <%--</div>--%>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="shoppingCarId">购物车编号</label>
                        <div class="controls">
                            <input type="text" id="shoppingCarId" name="shoppingCarId" disabled="disabled">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="userId">用户编号</label>
                        <div class="controls">
                            <input type="text" id="userId" name="userId" disabled="disabled">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="shopDate">下单日期</label>
                        <div class="controls">
                            <input type="text" id="shopDate" name="shopDate">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="status">订单状态</label>
                        <div class="controls">
                            <input type="text" id="status" name="status">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="edt" onclick="edit();">保存</button>
            </div>
        </div>

        <div id="confirmModel" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="payHead">操作提示</h3>
            </div>
            <div class="modal-body">
                <input id="orderIdback" type="hidden" type="text">
                <h4 id="confirmTip" style="align-content: center">是否确认付款？</h4>
                <h4 id="deleteTip" style="align-content: center">是否删除该订单？</h4>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
                <button class="btn btn-primary" id="pay" onclick="pay();">保存</button>
                <button class="btn btn-primary" id="deleteButton" onclick="deleteButton();">删除</button>
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
        $("#confirmModel").hide();
        selectOrder();
    });

    function selectOrder() {
        $.ajax({
            url: $ctx + "/order/findAll",
            data: {},
            type: "GET",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var order = list[i];
                    html += "<tr>" +
                        "<td>" + order.orderId + "</td><td>" + order.userId + "</td><td>" + order.shoppingCarId + "</td>" +
                        "<td>" + order.shopDate + "</td><td>" + order.status + "</td>" +
                        "<td>" +
//                        "<a class=\"btn btn-info\" onclick='editOpen(\"" + order.orderId + "\");'>修改</a>&nbsp;&nbsp;" +
                        "<a class=\"btn btn-info\" onclick='deleteModel(\"" + order.orderId + "\");'>撤销</a>&nbsp;&nbsp;" +   // 撤销时删除订单
                        "<a class=\"btn btn-info\" onclick='payModel(\"" + order.orderId + "\");'>付款</a>" +   // 付款时更新消费记录
                        "</td>" +
                        "</tr>";
                    $("#orderListBody").html(html);
                }
            }
        })
    }

    function editOpen(orderId) {
        // 获取用户数据并放入弹框
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/order/findOrderById?orderId=" + orderId,
            data: {},
            success: function (data) {
                $("#addModal").modal("show");
                $("#shoppingCarId").val(data.shoppingCarId);
                $("#userId").val(data.userId);
                $("#shopDate").val(data.shopDate);
                $("#status").val(data.status);
                $("#id").val(data.id);
            }
        })
    }

    function edit() {
        var $urlPath = $('#urlPath').val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $urlPath + "/order/updateOrder",
            data: $('#orderForm').serialize(),
            success: function () {
                alert("保存成功");
                selectOrder();
                $("#addModal").hide();
            }
        })
    }

    // 支付弹框
    function payModel(orderId) {
        $("#orderIdback").val(orderId);  // 弹框传值
        $("#confirmModel").modal("show");
        $("#confirmTip").show();
        $("#pay").show();
        $("#deleteButton").hide();
        $("#deleteTip").hide();
    }

    // 删除弹框
    function deleteModel(orderId) {
        $("#orderIdback").val(orderId);  // 弹框传值
        $("#confirmModel").modal("show");
        $("#deleteTip").show();
        $("#deleteButton").show();
        $("#confirmTip").hide();
        $("#pay").hide();
    }

    // 撤销（删除订单）
    function deleteButton() {
        var orderId = $("#orderIdback").val();  // 弹框取值
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/order/deleteOrder?orderId=" + orderId,
            data: {},
            success: function () {
                alert("保存成功");
                $("#confirmModel").modal("hide");
                selectOrder();
            }
        })
    }
    // 支付,更新支付状态
    function pay() {
        var orderId = $("#orderIdback").val();  // 弹框取值
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/order/updateOrderStatus",
            data: {"orderId": orderId},
            success: function () {
                $("#confirmModel").modal("hide");
                alert("支付成功");
                selectOrder();
            }
        })
    }

</script>
</body>
</html>
