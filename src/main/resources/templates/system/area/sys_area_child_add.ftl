<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="行政区划添加"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_sys_area_child_add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">上级区划：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" readonly value="${parent.name}">
                <input id="pid" name="pid" value="${parent.id}" type="hidden">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">区划编码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="code"
                       id="code" placeholder="请输入区划编码" data-msg="请输入区划编码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">地区名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name"
                       id="name" placeholder="请输入地区名称" data-msg="请输入地区名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">显示顺序：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="number" name="sort" value="0"
                       id="sort" placeholder="请输入显示顺序" data-msg="请输入显示顺序">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/area";
    $("#form_sys_area_child_add").validate({
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
            $.operate.saveOnlyCallback(prefix + "/addChild", $('#form_sys_area_child_add').serialize(),window.parent.refreshNode);
        }
    }
</script>
</body>
</html>