<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="行政区划修改"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-sys_area-update">
        <input id="id" name="id" type="hidden" value="${sysArea.id}">
        <div class="form-group">
            <label class="col-sm-3 control-label">上级区划：</label>
            <div class="col-sm-8">
                <span class="form-control " disabled>${parent.name}</span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">区划编码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="code" value="${sysArea.code}"
                       id="code" placeholder="请输入区划编码" data-msg="请输入区划编码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">地区名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" value="${sysArea.name}"
                       id="name" placeholder="请输入地区名称" data-msg="请输入地区名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">显示顺序：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="number" name="sort" value="${sysArea.sort}"
                       id="sort" placeholder="请输入显示顺序" data-msg="请输入显示顺序">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/area";
    $("#form-sys_area-update").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.saveOnlyCallback(prefix + "/update", $('#form-sys_area-update').serialize(),window.parent.refreshNode);
        }
    }
</script>
</body>
</html>