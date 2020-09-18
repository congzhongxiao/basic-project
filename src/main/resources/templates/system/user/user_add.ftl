<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="添加用户"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-user-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">用户名：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="username" id="username" required placeholder="请输入用户名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">密码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="password" name="password" id="password" required placeholder="请输入密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">确认密码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" required
                       placeholder="请输入确认密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">昵称：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="nickname" id="nickname" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">手机号码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="mobile" id="mobile" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="email" id="email" >
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/user';
    $("#form-user-add").validate({
        onkeyup: false,
        rules: {
            username: {
                required:true,
                remote: {
                    url: prefix + "/checkUserName",
                    type: "post",
                    dataType: "json",
                    data: {
                        "username": function () {
                            return $.common.trim($("#username").val());
                        }
                    }
                }
            },
            password:{
                required:true,
                minlength:5,
            },
            confirmPassword:{
                required:true,
                minlength:5,
                equalTo:"#password"
            },
            nickname:{
                required:true
            },
            mobile:{
                required:true,
                isPhone:true
            },
            email:{
                email:true
            }

        },
        messages: {
            username:{
                required:'请输入用户名',
                remote:'用户名已存在'
            },
            password:{
                required:'请输入密码',
                minlength:'确认密码长度最少5位'
            },
            confirmPassword: {
                required:'请输入确认密码',
                equalTo: '确认密码和密码不一致'
            },
            nickname:{
                required:'请输入昵称'
            },
            mobile:{
                required:'请输入手机号码',
                isPhone: '请输入正确的手机号码格式'
            },
            email:{
                email:'请输入正确的邮箱格式'
            }
        },
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form-user-add').serialize());
        }
    }
</script>
</body>
</html>