<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="用户修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-user-update" >
        <input id="id" name="id" type="hidden" value="${userInfo.id}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">用户名：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" disabled value="${userInfo.username}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">昵称</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="nickname" id="nickname" value="${userInfo.nickname}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">手机号码</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="mobile" id="mobile" value="${userInfo.mobile}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">邮箱</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="email" id="email" value="${userInfo.email}" >
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/user";

    $("#form-user-update").validate({
        onkeyup: false,
        rules: {
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
            $.operate.save(prefix + "/update", $('#form-user-update').serialize());
        }
    }
</script>
</body>
</html>
