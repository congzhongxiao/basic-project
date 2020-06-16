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
                <input class="form-control required" type="password" name="oldPassword" id="oldPassword" required placeholder="请输入原密码" data-msg="请输入原密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">新密码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="password" name="newPassword" id="newPassword" required placeholder="请输入新密码" data-msg="请输入新密码">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/user';

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/resetPassword", $('#form-user-reset').serialize());
        }
    }
</script>
</body>
</html>