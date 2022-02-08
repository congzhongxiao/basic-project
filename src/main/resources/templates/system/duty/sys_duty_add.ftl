<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="职务添加"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_sys_duty_add">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">职务名称：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="dutyName"
                           id="dutyName"  placeholder="请输入职务名称" data-msg="请输入职务名称">
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-3 control-label is-required">职务编码：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="code"
                            id="code"  placeholder="请输入职务编码" data-msg="请输入职务编码">
                    </div>
                </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">管理权限：</label>
            <div class="col-sm-8">
                <select id="dutyLimit" name="dutyLimit" class="chosen-select form-control required" data-msg="请选择管理权限">
                    <option value="">请选择管理权限</option>
                    <#list dutyLimitList as dutyLimit>
                        <option value=${dutyLimit.value}>${dutyLimit.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">职务简介：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="dutyDescription"
                       id="dutyDescription"  placeholder="请输入职务简介" data-msg="请输入职务简介">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/sysDuty";
    $("#form_sys_duty_add").validate({
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
            $.operate.save(prefix + "/add", $('#form_sys_duty_add').serialize());
        }
    }
</script>
</body>
</html>