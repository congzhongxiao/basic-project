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
    <div class="row">
        <div class="btn-group-sm" id="toolbar2" role="group">
            <a class="btn btn-success" onclick="$.operate.add('0')">
                <i class="fa fa-plus"></i> 新增
            </a>
            <a class="btn btn-info" id="expandAllBtn">
                <i class="fa fa-exchange"></i> 展开/折叠
            </a>
        </div>
        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-tree-table2"></table>
        </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/permission";
    function showTable(data,element){
        var _this =$(element);
        var data = JSON.parse(decodeURI(data));//获取当前数据
        var tr = _this.closest('tr');
        var columnNum = tr.find('td').length;
        var trId = tr.attr('id');
        var _thisI = _this.find('i');
        var subContainerTrId = trId + '_sub';
        var subContainerTr = $('#' + subContainerTrId);
        if (_thisI.hasClass('fa-plus')) {//折叠状态，开始展开处理
            _thisI.removeClass('fa-plus');
            _thisI.addClass('fa-minus');
            if(subContainerTr && subContainerTr.length > 0) {//已存在
                subContainerTr.remove();
            }
                var subTr = $('<tr id="'+subContainerTrId+'" pid="'+ trId +'"></tr>');
                var subTd = $('<td colspan="'+ columnNum +'" style="background: #d1d1d1;"> </td>');
                subTr.append(subTd);
                var subTable = $('<table class="table table-bordered table-hover" style="margin-bottom: 0"></table>');
                var subTableTheadHtml =
                    '<thead>' +
                    '<tr>' +
                    '<th>主键</th>' +
                    '<th>权限名称</th>' +
                    '<th>权限编码</th>' +
                    '<th>权限描述</th>' +
                    '<th>操作</th>' +
                    '</tr>'+
                    '</thead>';
                subTable.append(subTableTheadHtml);
                var subTableBody = $('<tbody></tbody>');
                for(var i = 0; i < 5; i ++) {
                    var subTableTr = $('<tr></tr>');
                    subTableTr.append('<td>' + i +'</td>');
                    subTableTr.append('<td>权限A</td>');
                    subTableTr.append('<td>PA</td>');
                    subTableTr.append('<td></td>');
                    subTableTr.append('<td>编辑</td>');
                    subTableBody.append(subTableTr);
                }
                subTable.append(subTableBody);
                subTd.append(subTable);
                tr.after(subTr);
        } else {//展开状态，开始收起处理
            _thisI.addClass('fa-plus');
            _thisI.removeClass('fa-minus');
            if(subContainerTr && subContainerTr.length > 0) {//已存在
                subContainerTr.remove();
            }
        }
    }

    $(function () {
        var options = {
            code: "id",
            id:'bootstrap-tree-table',
            parentCode: "pid",
            uniqueId: "id",
            url: prefix + "/findList",
            createUrl: prefix + "/add/{id}",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete/{id}",
            showSearch:false,
            showRefresh:false,
            showColumns:false,
            toolbar:'toolbar',
            modalName: "权限",
            columns: [{
                field: 'selectItem',
                radio: true
            },
                {
                    field: 'name',
                    title: '权限名称',
                    align: "left",
                    formatter:function (value,row,index) {
                        var actions = [];
                        actions.push('<span>'+ value +'</span>');
                        actions.push('<a class="btn btn-link btn-xs  href="javascript:void(0)" onclick="showTable(\''+ encodeURI(JSON.stringify(row)) +'\',this)"><i class="fa fa-plus"></i></a>');
                        return actions.join('');
                    }
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

        var options2 = {
            code: "id",
            id:'bootstrap-tree-table2',
            parentCode: "pid",
            uniqueId: "id",
            toolbar:'toolbar2',
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
                    align: "left",
                    formatter:function (value,row,index) {
                        var actions = [];
                        actions.push('<span>'+ value +'</span>');
                        actions.push('<a class="btn btn-link btn-xs  href="javascript:void(0)" onclick="showTable(\''+ encodeURI(JSON.stringify(row)) +'\',this)"><i class="fa fa-plus"></i></a>');
                        return actions.join('');
                    }
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
        $.treeTable.init(options2);
    });
</script>
</body>
</html>