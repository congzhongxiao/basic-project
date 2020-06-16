<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="角色修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-role-update">
        <input type="hidden" name="id" value="${role.id}">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">角色名称：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="name" id="name" required placeholder="请输入角色名称" value="${role.name}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">角色描述：</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="4" name="comment" id="comment" >${role.comment}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/role';
    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-role-update').serialize());
        }
    }
</script>
</body>
</html>