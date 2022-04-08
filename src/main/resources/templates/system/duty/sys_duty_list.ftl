<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="职务列表"/>
<@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="sys_duty-form">
                <div class="select-list">
                    <ul>
                        <li>
                            职务名称：<input type="text" name="duty_name"/>
                        </li>
                        <li>
                            职务编码：<input type="text" name="code"/>
                        </li>
                        <li>
                            <a class="btn btn-success btn-rounded btn-sm" onclick="$.table.search()"><i
                                        class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                        class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
        <div class="btn-group-sm" id="toolbar" role="group">
                <a class="btn btn-primary" onclick="$.operate.add()">
                    <i class="fa fa-plus"></i> 新增
                </a>
                <a class="btn btn-danger multiple " onclick="$.operate.removeAll()">
                    <i class="fa fa-remove"></i> 删除
                </a>
        </div>
            <div class="col-sm-12 select-table table-striped">
                <table id="bootstrap-table"></table>
            </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/sysDuty";
    $(function () {
        var dict = getDictMap("duty_limit");
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "职务",
            uniqueId: "id",
            columns: [
                {
                    checkbox: true
                },
            {
                title: '序号',
                width: 5,
                align: "center",
                formatter: function (value, row, index) {
                    return $.table.serialNumber(index);
                }
            },
            {
                field: 'dutyName',
                title: '职务名称'
            },
                {
                    field: 'code',
                    title: '职务编码'
                },

            {
                field: 'dutyLimit',
                title: '管理权限',
                formatter: function (value, row, index) {
                    return dict.get(value.toString());
                }
            },
                {
                    field: 'dutyDescription',
                    title: '职务简介'
                },
            {
                title: '操作',
                align: 'center',
                formatter: function (value, row, index) {
                    var actions = [];
                    actions.push('<a class="btn btn-success btn-xs " href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                    actions.push('<a class="btn btn-danger btn-xs " href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                    return actions.join('');
                }
            }]
        };
        $.table.init(options);
    });
</script>
</body>
</html>