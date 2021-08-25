<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="行政区划列表"/>
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
    var prefix = "${ctx}/area";

    function addRoot(){
        $.modal.open("新增行政区划",prefix + "/addRoot");
    }
    function addChild(id){
        if($.common.isEmpty(id)) {
            $.modal.msgWarning("上级区划id不能为空");
        }
        $.modal.open("新增行政区划",prefix + "/addChild/" + id);
    }
    function remove(id){
        $.modal.confirm("确定删除该条行政区划信息吗？", function () {
            var url = prefix + "/delete";
            var data = {"id": id};
            $.operate.submitOnlyCallback(url, "post", "json", data,refreshNode);
        });
    }

    function refreshNode(result){
        if(result.success) {
            var data = result.data;
            $.treeTable.refreshNode(data.pid);
        }

    }

    $(function () {
        var options = {
            code: "id",
            parentCode: "pid",
            uniqueId: "id",
            url: prefix + "/findList",
            async: true,                 // 开启异步
            updateUrl: prefix + "/update/{id}",
            modalName: "行政区划",
            showSearch:false,
            showColumns:false,
            columns: [{
                field: 'selectItem',
                radio: true
            }, {
                field: 'name',
                title: '地区名称',
                align: 'left'
            },{
                field: 'code',
                title: '区划编码'
            }, {
                field: 'sort',
                title: '显示顺序'
            }, {
                field: 'createBy',
                title: '创建人'
            }, {
                field: 'createTime',
                title: '创建时间'
            }, {
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    var actions = [];
                    actions.push('<a class="btn btn-primary btn-xs " href="javascript:void(0)" onclick="addChild(\'' + row.id + '\')"><i class="fa fa-plus"></i>新增</a> ');
                    actions.push('<a class="btn btn-success btn-xs " href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                    actions.push('<a class="btn btn-danger btn-xs " href="javascript:void(0)" onclick="remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                    return actions.join('');
                }
            }]
        };
        $.treeTable.init(options);
    });
</script>
</body>
</html>