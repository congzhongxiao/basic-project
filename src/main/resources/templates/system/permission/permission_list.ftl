<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="权限列表"/>
    <@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-primary" onclick="addRoot()">
                <i class="fa fa-plus"></i> 新增
            </a>
        </div>
        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-tree-table"></table>
        </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/permission";

    function addRoot() {
        $.modal.open("新增权限", prefix + "/addRoot");
    }
    function addChild(id){
        if($.common.isEmpty(id)) {
            $.modal.msgWarning("上级权限id不能为空");
        }
        $.modal.open("新增权限",prefix + "/addChild/" + id);
    }

    function refreshNode(result){
        if(result.success) {
            var data = result.data;
            $.treeTable.refreshNode(data.pid);
        }

    }
    function remove(id){
        $.modal.confirm("确定删除该条权限信息吗？", function () {
            var url = prefix + "/delete";
            var data = {"id": id};
            $.operate.submitOnlyCallback(url, "post", "json", data,refreshNode);
        });
    }

    $(function () {
        var options = {
            code: "id",
            id: 'bootstrap-tree-table',
            parentCode: "pid",
            uniqueId: "id",
            url: prefix + "/findList",
            async: true,                 // 开启异步
            updateUrl: prefix + "/update/{id}",
            showSearch: false,
            showRefresh: false,
            showColumns: false,
            toolbar: 'toolbar',
            modalName: "权限",
            columns: [{
                field: 'selectItem',
                radio: true
            },
                {
                    field: 'name',
                    title: '权限名称',
                    align: "left"
                },
                {
                    field: 'code',
                    title: '权限编码',
                    align: "center"
                },
                {
                    field: 'comment',
                    title: '权限描述',
                    align: "center"
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-primary btn-xs"  href="javascript:void(0)" onclick="addChild(\'' + row.id + '\')"><i class="fa fa-plus"></i>新增子权限</a> ');
                        actions.push('<a class="btn btn-success  btn-xs"  href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        actions.push('<a class="btn btn-danger btn-xs"  href="javascript:void(0)" onclick="remove(\'' + row.id + '\')"><i class="fa fa-trash"></i>删除</a>');

                        return actions.join('');
                    }
                }]
        };
        $.treeTable.init(options);
    });
</script>
</body>
</html>