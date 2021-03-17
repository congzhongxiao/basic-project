<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="组织架构添加"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-sys_organization-add">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">组织id：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="id"
                           id="id"  placeholder="请输入组织id" data-msg="请输入组织id">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">父级组织id：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="pid"
                           id="pid"  placeholder="请输入父级组织id" data-msg="请输入父级组织id">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">祖级列表：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="ancestors"
                           id="ancestors"  placeholder="请输入祖级列表" data-msg="请输入祖级列表">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">组织名称：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="name"
                           id="name"  placeholder="请输入组织名称" data-msg="请输入组织名称">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">显示顺序：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="orderNum"
                           id="orderNum"  placeholder="请输入显示顺序" data-msg="请输入显示顺序">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">负责人：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="leader"
                           id="leader"  placeholder="请输入负责人" data-msg="请输入负责人">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">联系电话：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="phone"
                           id="phone"  placeholder="请输入联系电话" data-msg="请输入联系电话">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">邮箱：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="email"
                           id="email"  placeholder="请输入邮箱" data-msg="请输入邮箱">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">状态（0正常 1停用）：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="status"
                           id="status"  placeholder="请输入状态（0正常 1停用）" data-msg="请输入状态（0正常 1停用）">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">删除标志（0代表存在 1代表删除）：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="isdel"
                           id="isdel"  placeholder="请输入删除标志（0代表存在 1代表删除）" data-msg="请输入删除标志（0代表存在 1代表删除）">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">创建者：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="createBy"
                           id="createBy"  placeholder="请输入创建者" data-msg="请输入创建者">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">创建时间：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="createTime"
                           id="createTime"  placeholder="请输入创建时间" data-msg="请输入创建时间">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">更新者：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="updateBy"
                           id="updateBy"  placeholder="请输入更新者" data-msg="请输入更新者">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">更新时间：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="updateTime"
                           id="updateTime"  placeholder="请输入更新时间" data-msg="请输入更新时间">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">组织类型：0公司 1部门：</label>
                <div class="col-sm-8">
                    <input class="form-control required" type="text" name="orgType"
                           id="orgType"  placeholder="请输入组织类型：0公司 1部门" data-msg="请输入组织类型：0公司 1部门">
                </div>
            </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/sysOrganization";
    $("#form-sys_organization-add").validate({
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
            $.operate.save(prefix + "/add", $('#form-sys_organization-add').serialize());
        }
    }
</script>
</body>
</html>