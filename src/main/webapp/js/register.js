var msg=new $.zui.Messager('这是一个浮动消息。', {
    icon: 'bell', // 定义消息图标
    placement: 'center' ,// 定义显示位置
    // parent:$("#username")
});

//手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写手机号码");

//校验注册信息合法性（name属性）
function validate() {
    return $("#regForm").validate({
        //把错误信息统一放在一个容器里面。
        errorLabelContainer: "#messageBox",
        //用什么标签再把上边的 errorELement 包起来。
        wrapper: "li",
        rules: {
            username: {
                required: true,//是否必填
                rangelength: [2, 8]//长度
            },
            pwd: {
                required: true,
                rangelength: [2, 8]
            },
            conPwd: {
                required: true,
                equalTo: $("#pwd")
            },
            phoneNum: {
                required: true,
                minlength : 11,
                isMobile : true
            },
            emailAddr: {
                required: true,
                email: "@"&"email"
            }

        },
        messages: {
            useraccout: {
                required: "请输入用户名",
                rangelength: "长度2到8个字符"
            },
            userpwd: {
                required: "请输入密码",
                rangelength: "长度2到8个字符"
            },
            conPwd: {
                required: "密码不一致，请重新输入",
            },
            phoneNum:{
                required : "请输入手机号",
                minlength : "不能小于11个字符",
                isMobile : "请正确填写手机号码"
            },
            emailAddr: {
                required: "请输入电子邮箱地址",
                email: "请输入正确的邮箱地址"
            }
        }

    }).form();
}

$(document).ready(function(){
    $("#backBtn").click(function () {
        window.location.href="client/home.jsp"
    });
    $("#regBtn").click(function () {
        if (!validate()){
            return;
        }
        $.ajax({
            url: "RegServlet",
            type: 'POST',
            dataType: 'text',//预期服务器返回的数据类型text、json
            data: {
                username: $("#username").val(),
                password: $("#pwd").val(),
                sex:$('input[name="sex"]:checked').val(),
                education:$("#education").val(),
                occupation:$("#occupation").val(),
                phoneNum:$("#phoneNum").val(),
                emailAddr:$("#emailAddr").val(),

            },
            success: function (data, textStatus, xhr) {
                if (data.trim() == "注册成功") {
                    msg.show(data);
                    // window.location.href = "http://www.baidu.com";
                } else {
                    msg.show(data);
                }
            },
            beforeSend: function(){
                $('#regBtn').attr("disabled","disabled");

            },
            error: function (xhr, textStatus, errorThrown) {

            },
            complete: function () {
                $('#regBtn').removeAttr("disabled");
            }
        });
    });
});