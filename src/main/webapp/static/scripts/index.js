$(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});

$(".loginout").click(function () {
    $.ajax({
        type: "POST",
        dataType: "text",
        url: $ctx + "/user/logout",
        success: function (data) {
            window.location.href = $ctx + '/user/loginBegin'
        },
        error: function(){
            alert('请求失败');
        }
    })
});

$(".accordion-inner").click(function () {
    $(".active").html($(this).find(".left-body").text());
});

$(window).resize(function () {
    $(".content-left,.content-right").height($(window).height() - 130);
});