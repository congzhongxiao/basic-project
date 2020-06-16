<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="角色权限设置"/>
    <@css_common/>
    <@css_ztree/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-role-authorize">
        <input id="id" name="id" type="hidden" value="${role.id}"/>
        <input id="permissionIds" name="permissionIds" type="hidden">
        <div class="form-group">
            <label class="col-sm-3 control-label">角色名称：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" value="${role.name}" readonly="true"/>
            </div>
        </div>
        <div class="form-group" id="authDataScope">
            <label class="col-sm-3 control-label">数据权限：</label>
            <div class="col-sm-8">
                <div id="permissionTrees" class="ztree"></div>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<@js_ztree/>
<script type="text/javascript">

    $(function () {
        var url = "${ctx}/permission/getPermissionTreeForRole?roleId="+$("#id").val();
        var options = {
            id: "permissionTrees",
            url: url,
            expandLevel: 2,
            check: {enable: true}
        };
        $.tree.init(options);
    });

    function submitHandler() {
        if ($.validate.form()) {
            $("#permissionIds").val($.tree.getCheckedNodes());
            $.operate.save("${ctx}/role/authorize", $('#form-role-authorize').serialize());
        }
    }

</script>
</body>
</html>
