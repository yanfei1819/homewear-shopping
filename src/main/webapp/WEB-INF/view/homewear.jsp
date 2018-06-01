<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/view/include/taglib.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="charset=utf-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/css/bootstrap.min.css" rel="stylesheet"/>
    <title></title>
    <link href="${pageContext.request.contextPath}/static/styles/Common.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/styles/Index2.css" rel="stylesheet"/>
</head>
<body>
<div class="container-fluid">
    <input type="hidden" value="${pageContext.request.contextPath}" id="urlPath">
    <div class="row-fluid">
        <h4>商品列表</h4>
        <div class="add">
            <a class="btn btn-success " onclick="openadd();" id="homewearAddbutton">新增</a>
            <a class="btn btn-success" onclick="selectHomewear();">查询</a>
        </div>
        <div class="w">
            <div class="span12">
                <table class="table table-condensed table-bordered table-hover tab">
                    <thead>
                    <tr>
                        <th>家居编号</th>
                        <th>家居图片</th>
                        <th>家居名称</th>
                        <th>家居类型</th>
                        <th>家居颜色</th>
                        <th>家居尺寸</th>
                        <th>家居价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="homeweaeListBody"></tbody>
                </table>
                <div id="page" class="userListBody">
                    <%--<p>一共${page.pages}页</p>--%>
                    <div>一共1页
                        <a href="/homewear-shopping/homewear/findPageAll?page=${page.firstPage}">第一页</a>
                        <a href="/homewear-shopping/homewear/findPageAll?page=${page.nextPage}">下一页</a>
                        <a href="/homewear-shopping/homewear/findPageAll?page=${page.prePage}">上一页</a>
                        <a href="/homewear-shopping/homewear/findPageAll?page=${page.lastPage}">最后页</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="addModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="addGoods">添加家居</h3>
                <%--<h3 id="modifyGoods">修改家居</h3>--%>
            </div>
            <div class="modal-body">
                <input type="text" name="id" id="homeId" style="display:none">
                <form class="form-horizontal" id="form1" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/homewear/addHomewear">
                    <div class="control-group">
                        <label class="control-label" for="name">家居名称</label>
                        <div class="controls">
                            <input type="text" name="name" id="name" placeholder="家居名称">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="type">家居类型</label>
                        <div class="controls">
                            <input type="text" id="type" name="type" placeholder="家居类型">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="color">家居颜色</label>
                        <div class="controls">
                            <input type="text" id="color" name="color" placeholder="家居颜色">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="size">家居尺寸</label>
                        <div class="controls">
                            <input type="text" id="size" name="size" placeholder="家居尺寸">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="price">家居价格</label>
                        <div class="controls">
                            <input type="text" id="price" name="price" placeholder="家居价格">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="picture">家居图片</label>
                        <div class="controls">
                            <input type="file" id="picture" name="picture" placeholder="家居图片">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <span><button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button></span>
                        <span><button type="submit" class="btn btn-warning" id="sendFileBth">上传</button></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/scripts/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/plugin/bootstrap2.3.2/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/index.js"></script>
<script src="${pageContext.request.contextPath}/static/scripts/content.js"></script>

<script>

    $(function () {
        // 从后台获取用户的个人信息
        $.ajax({
            type: "GET",
            dataType: "json",
            url: $ctx + "/user/getUserInfo",
            data: {},
            success: function (data) {
                if (data.role !== '管理员') {
                    $("#homewearAddbutton").hide();
                }
            }
        })
        selectHomewear();

        // 给每个商品展示图片
    });

    function save() {
        var formData = new FormData(document.getElementById("form1"));//表单id
        debugger;
        $("#edt").hide();
        if (!$("#name").val() || !$("#type").val() || !$("#color").val() || !$("#size").val() || !$("#price").val()) {
            alert("家居信息不完整，请补全！");
            return;
        }

        $.ajax({
            type: "POST",
            dataType: "json",
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            url: $ctx + "/homewear/addHomewear",
            data: formData,
            success: function () {
                alert("保存成功");
                selectHomewear();
                $("#addModal").modal("hide");
            }
        })
    }

    function selectHomewear() {
        $.ajax({
            url: $ctx + "/homewear/findAll",
            data: {},
            type: "get",
            dataType: "json",
            success: function (data) {
                var list = data;
                var html = "";
                for (var i = 0; i < list.length; i++) {
                    var homewear = list[i];
                    html += "<tr>" +
                        "<td>" + homewear.id + "</td>" +
                        "<td><img src='${pageContext.request.contextPath}/static/goodsImages/"+homewear.picture+"' style='width: 120px;' height='50px' title='"+homewear.name+"'/></td>" +
                        "<td>" + homewear.name + "</td>" +
                        "<td>" + homewear.type + "</td><td>" + homewear.color + "</td><td>" + homewear.size + "</td><td>" + homewear.price + "</td>" +
                        "<td>" +
//                        "<a class=\"btn btn-info\" onclick='deteil(\"" + homewear.id + "\");'>详情</a>&nbsp;&nbsp;"+
//                        "<a class=\"btn btn-info\" onclick='editOpen(\"" + homewear.id + "\");'>修改</a>&nbsp;&nbsp;" +
                        "<a class=\"btn btn-warning\" onclick='addCar(\"" + homewear.id + "," + homewear.price + "\");'>加入购物车</a>" +
                        "</td>" +
                        "</tr>";
                    $("#homeweaeListBody").html(html);
                }
            }
        })
    }


    function editOpen(id) {
        var $urlPath = $('#urlPath').val();
        // 获取用户数据并放入弹框
        $.ajax({
            type: "get",
            dataType: "json",
            url: $urlPath + "/homewear/findHomewearById?id=" + id,
            data: {},
            success: function (data) {
                $("#addModal").modal("show");
                $("#name").val(data.name);
                $("#type").val(data.type);
                $("#color").val(data.color);
                $("#size").val(data.size);
                $("#price").val(data.price);
                $("#homeId").val(data.id);
            }
        })
    }

    function edit() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/homewear/updateHomewear",
            data: $('#form1').serialize(),
            success: function () {
                alert("保存成功");
                selectHomewear();
                $("#addModal").hide();
            }
        })
    }

    // 商品购买，加入购物车
    function addCar(homewearId, price) {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: $ctx + "/shoppCar/addCar",
            data: {"homewearId": homewearId, "price": price},
            success: function () {
                alert("保存成功");
                selectHomewear();
                $("#addModal").hide();
            }
        })
    }
</script>
</body>
</html>
