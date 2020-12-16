<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="角色添加"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-role-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">角色名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" id="name" data-msg="请输入角色名称"  placeholder="请输入角色名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">角色编码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="code" id="code" data-msg="请输入角色编码"  placeholder="请输入角色编码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">角色描述：</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="4" name="comment" id="comment" ></textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/role';
    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form-role-add').serialize());
        }
    }
</script>
</body>
</html>