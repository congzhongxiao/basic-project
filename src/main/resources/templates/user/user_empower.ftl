<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="设置角色"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <input type="hidden" name="user_role_id" id="user_role_id" value="${userRoleIds}">
    <form class="form-horizontal m" id="form-user-empower" >
        <input id="id" name="id" type="hidden" value="${userInfo.id}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label ">用户名：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" disabled value="${userInfo.username}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">昵称</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" disabled value="${userInfo.nickname}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">所属角色</label>
            <div class="col-sm-8">
                <ul class="ul-auto-3">
                    <#list roleList as role>
                        <li>
                            <label class="checkbox-inline " title="${role.name}">
                                <input type="checkbox" name="role_id"  value="${role.id}" >${role.name}
                            </label>
                        </li>
                    </#list>
                </ul>

            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/user";
    $(function () {
        var userRoleIds = $("#user_role_id").val();
        var urs = new Array();
        if(userRoleIds) {
            urs = userRoleIds.split(",");
            $("input[name=role_id]").each(function () {
                var roleId = $(this).val();
                for (var value of urs) {
                    if(value == roleId) {
                        $(this).attr("checked", 'checked');
                        break;
                    }
                }
            });
        }

    });
    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/empower", $('#form-user-empower').serialize());
        }
    }
</script>
</body>
</html>
