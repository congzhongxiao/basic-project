<#noparse><#include "layout/include.ftl" ></#noparse>
<!DOCTYPE html>
<html lang="zh">
<head>
<#noparse>
<@meta title="</#noparse>${functionName}添加<#noparse>"/>
<@css_common/></#noparse>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-${tableName}-add">
        <#list columns as column>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">${column.columnComment}：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="${column.changeColumnName}"
                           id="${column.changeColumnName}"  placeholder="请输入${column.columnComment}" data-msg="请输入${column.columnComment}">
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
    $("#form-${tableName}-add").validate({
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
            $.operate.save(prefix + "/add", $('#form-${tableName}-add').serialize());
        }
    }
</script>
</body>
</html>