<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="权限添加"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_permission_child_add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">上级权限：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" readonly value="${parent.name}">
                <input id="pid" name="pid" value="${parent.id}" type="hidden">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限名称:</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" id="name" placeholder="请输入权限名称" data-msg="请输入权限名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限编码:</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" id="code" name="code" placeholder="请输入权限编码" data-msg="请输入权限编码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">权限描述:</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="4" name="comment"></textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/permission";
    $("#form_permission_child_add").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {
            //example
        },
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.saveOnlyCallback(prefix + "/addChild", $('#form_permission_child_add').serialize(),window.parent.refreshNode);
        }
    }
</script>
</body>
</html>