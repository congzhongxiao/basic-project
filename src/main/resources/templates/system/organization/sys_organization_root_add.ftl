<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="组织架构新增"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_sys_organization_root_add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">组织名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name"
                       id="name" placeholder="请输入组织名称" data-msg="请输入组织名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">组织编码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="code"
                       id="code" placeholder="请输入组织编码" data-msg="请输入组织编码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label required">负责人：</label>
            <div class="col-sm-8">
                <input class="form-control " type="text" name="leader"
                       id="leader" placeholder="请输入负责人" data-msg="请输入负责人">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">联系电话：</label>
            <div class="col-sm-8">
                <input class="form-control " type="text" name="phone"
                       id="phone" placeholder="请输入联系电话" data-msg="请输入联系电话">
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
    var prefix = "${ctx}/organization";
    $("#form_sys_organization_root_add").validate({
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
            $.operate.save(prefix + "/addRoot", $('#form_sys_organization_root_add').serialize());
        }
    }
</script>
</body>
</html>