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
            <a class="btn btn-success" onclick="$.operate.add('0')">
                <i class="fa fa-plus"></i> 新增
            </a>
            <a class="btn btn-info" id="expandAllBtn">
                <i class="fa fa-exchange"></i> 展开/折叠
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

    $(function () {
        var options = {
            code: "id",
            parentCode: "pid",
            uniqueId: "id",
            url: prefix + "/findList",
            createUrl: prefix + "/add/{id}",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete/{id}",
            showSearch:false,
            showRefresh:false,
            showColumns:false,
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
                    align: "left"
                },
                {
                    field: 'comment',
                    title: '权限描述',
                    align: "left"
                },
                {
                    title: '操作',
                    align: 'left',
                    formatter: function (value, row, index) {
                        var actions = [];
                        if (row.pid != '0') {
                            actions.push('<a class="btn btn-success btn-xs  href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                        }
                        actions.push('<a class="btn btn-info  btn-xs  href="javascript:void(0)" onclick="$.operate.add(\'' + row.id + '\')"><i class="fa fa-plus"></i>新增</a> ');
                        actions.push('<a class="btn btn-danger btn-xs  href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-trash"></i>删除</a>');

                        return actions.join('');
                    }
                }]
        };
        $.treeTable.init(options);
    });
</script>
</body>
</html>