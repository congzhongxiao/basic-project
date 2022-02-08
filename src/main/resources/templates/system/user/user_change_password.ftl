<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="重置密码"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-user-reset">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">用户名：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" disabled  value="${user.username}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">原密码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="password" name="oldPassword" id="oldPassword" autocomplete="new-password"  required placeholder="请输入原密码" data-msg="请输入原密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">新密码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="password" name="newPassword" id="newPassword" autocomplete="new-password"  required placeholder="请输入新密码" data-msg="请输入新密码">
                <div class="help-block"><i class="fa fa-info-circle"></i> 新密码必须由大写字母、小写字母和数字组成，且位数需要${passwordMin} - ${passwordMax}位。</div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">确认密码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="password" name="confirmPassword" id="confirmPassword" autocomplete="new-password"  required placeholder="请再次输入新密码" data-msg="请再次输入新密码">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/user';
    $("#form-user-reset").validate({
        onkeyup: false,
        rules: {
            newPassword: {
                required: true,
                minlength: ${passwordMin},
                maxlength:${passwordMax}
            },
            confirmPassword: {
                required: true,
                equalTo: "#newPassword"
            },
        },
        messages: {
            newPassword: {
                required: '请输入新密码',
                minlength: '新密码长度不能少于${passwordMin}位',
                maxlength: '新密码长度不能超过${passwordMax}位',
            },
            confirmPassword: {
                required: '请输入确认密码',
                equalTo: '确认密码和新密码不一致',
            },
        },
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/changePassword", $('#form-user-reset').serialize());
        }
    }
</script>
</body>
</html>