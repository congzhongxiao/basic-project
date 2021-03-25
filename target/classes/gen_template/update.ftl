<#noparse><#include "layout/include.ftl" ></#noparse>
<!DOCTYPE html>
<html lang="zh">
<head>
<#noparse>
<@meta title="</#noparse>${functionName}修改<#noparse>"/>
<@css_common/></#noparse>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_${tableName}_update">
        <input id="id" name="id" type="hidden" value="<#noparse>${</#noparse>${varName}.id<#noparse>}</#noparse>">
        <#list columns as column>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">${column.columnComment}：</label>
                <div class="col-sm-8">
                    <#if column.columnType == 'Date'>
                            时间类型自己处理
                        <#else >
                        <input class="form-control required" type="text" name="${column.changeColumnName}" value="<#noparse>${</#noparse>${varName}.${column.changeColumnName}<#noparse>}</#noparse>"
                               id="${column.changeColumnName}"  placeholder="请输入${column.columnComment}" data-msg="请输入${column.columnComment}">

                    </#if>
                </div>
            </div>
        </#list>
    </form>
</div>
<#noparse>
<@js_common/>
</#noparse>
<script type="text/javascript">
    <#noparse>
    var prefix = "${ctx}/</#noparse>${varName}<#noparse>";
    </#noparse>
    $("#form_${tableName}_update").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form_${tableName}_update').serialize());
        }
    }
</script>
</body>
</html>