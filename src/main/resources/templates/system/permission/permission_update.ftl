<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="权限修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-permission-update" >
        <input name="id" id="id" type="hidden" value="${permission.id}" />
        <input id="treeId" name="pid" type="hidden" value="${parent.id}" />
        <div class="form-group">
            <label class="col-sm-3 control-label">上级部门：</label>
            <div class="col-sm-8">
                <div class="input-group">
                    <input class="form-control" type="text" id="treeName" onclick="selectPermissionTree()" readonly="true" value="${parent.name}">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限名称：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="name" id="name" value="${permission.name}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">权限编码</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" id="code" name="code" value="${permission.code}" required>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">权限描述</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="4" name="comment">${permission.comment}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/permission";

    $("#form-permission-update").validate({
        onkeyup: false,
        rules:{
            name:{
                required:true
            },
            code:{
                required : true,
                remote: {
                    type:'POST',
                    dataType: 'json',
                    url: prefix + '/checkCode',
                    data:{
                        value:function() {
                            return $("#code").val();
                        },
                        id:function () {
                            return $("#id").val();
                        }
                    }
                }
            }
        },
        messages: {
            name:{
                required:'请输入权限名称'
            },
            code:{
                required:'请输入权限编码',
                remote:'权限编码已存在'
            }
        },
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-permission-update').serialize());
        }
    }

    function selectPermissionTree() {
        var options = {
            title: '权限选择',
            width: "380",
            url: prefix + "/selectPermissionTree/" + $("#treeId").val(),
            callBack: doSubmit
        };
        $.modal.openOptions(options);
    }

    function doSubmit(index, layero){
        var tree = layero.find("iframe")[0].contentWindow.$._tree;
        if ($.tree.notAllowLastLevel(tree)) {
            var body = layer.getChildFrame('body', index);
            $("#treeId").val(body.find('#treeId').val());
            $("#treeName").val(body.find('#treeName').val());
            layer.close(index);
        }
    }
</script>
</body>
</html>
