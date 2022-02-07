<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="组织架构新增"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_sys_organization_child_add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">上级组织：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" readonly value="${parent.name}">
                <input id="pid" name="pid" value="${parent.id}" type="hidden">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">组织类型：</label>
            <div class="col-sm-8">
                <select id="orgType" name="orgType"  class="chosen-select form-control required" data-msg="请选择组织类型">
                    <option value="1">部门</option>
                    <option value="0">公司</option>
                </select>

            </div>
        </div>
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
    $("#form_sys_organization_child_add").validate({
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
            //获取组织类型
            var orgType=$("#orgType").val();
            //获取上级组织的ID
            var organizationId=$("#pid").val();
            $.ajax({
                url:'${ctx}/organization/getOrganizationTypeById',
                data:{"organizationId":organizationId},
                type:'GET',
                dataType:'json',
                success:function(result) {
                    var type=result.type;
                    if("1"==type && "0"==orgType){
                        //$.modal.alert("上级组织不能为部门！");
                        layer.msg('部门下面不能创建公司！', {time: 1500, icon: 2});
                    }else{
                        $.operate.saveOnlyCallback(prefix + "/addChild", $('#form_sys_organization_child_add').serialize(),window.parent.refreshNode);
                    }
                }
            });
        }
    }

    //添加组织类型的change函数
    $("#orgType").change(function(){
        //获取当前value
        var selectValue=$(this).val();
        if("0"==selectValue){
            //如果当前选择的是公司类型即为0的时候，那么需要判断其上级组织是否为公司，如果不是则提示不能创建公司
            var organizationId=$("#pid").val();
            $.ajax({
                url:'${ctx}/organization/getOrganizationTypeById',
                data:{"organizationId":organizationId},
                type:'GET',
                dataType:'json',
                success:function(result) {
                    var type=result.type;
                    if("1"==type){
                        //$.modal.alert("上级组织不能为部门！");
                        layer.msg('部门下面不能创建公司！', {time: 1500, icon: 2});
                    }
                }
            });
            //结束
        }
    });
</script>
</body>
</html>