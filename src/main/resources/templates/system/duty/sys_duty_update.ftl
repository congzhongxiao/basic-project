<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="职务修改"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_sys_duty_update">
        <input id="id" name="id" type="hidden" value="${sysDuty.id}"/>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">职务名称：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="dutyName" value="${sysDuty.dutyName}"
                               id="dutyName"  placeholder="请输入职务名称" data-msg="请输入职务名称">

                </div>
            </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">职务编码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="code" value="${sysDuty.code}"
                       id="code"  placeholder="请输入职务编码" data-msg="请输入职务编码">

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">浏览权限：</label>
            <div class="col-sm-8">
                <select id="dutyLimit" name="dutyLimit" class="chosen-select form-control required" data-msg="请选择管理权限">
                    <option value="">请选择管理权限</option>
                    <#list dutyLimitList as dutyLimit>
                        <option value=${dutyLimit.value}<#if sysDuty.dutyLimit == dutyLimit.value > selected </#if>>${dutyLimit.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">职务简介：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="dutyDescription" value="${sysDuty.dutyDescription}"
                       id="dutyDescription"  placeholder="请输入职务简介" data-msg="请输入职务简介">
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/sysDuty";
    $("#form_sys_duty_update").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {},
        messages: {},
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form_sys_duty_update').serialize());
        }
    }
</script>
</body>
</html>