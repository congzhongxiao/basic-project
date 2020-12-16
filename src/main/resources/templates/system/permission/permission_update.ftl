<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="权限修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-permission-update">
        <input name="id" id="id" type="hidden" value="${permission.id}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">上级权限：</label>
            <div class="col-sm-8">
                <span class="form-control" disabled>${parent.name}</span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限名称：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="name" id="name" value="${permission.name}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限编码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" id="code" name="code" value="${permission.code}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">权限描述：</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="4" name="comment">${permission.comment}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/permission";

    $("#form-permission-update").validate({
        onkeyup: false,
        rules: {},
        messages: {},
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.saveOnlyCallback(prefix + "/update", $('#form-permission-update').serialize(),window.parent.refreshNode);
        }
    }

</script>
</body>
</html>
