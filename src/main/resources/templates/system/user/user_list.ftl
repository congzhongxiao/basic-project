<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="管理员管理"/>
    <@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="user-form">
                <div class="select-list">
                    <ul>
                        <li>
                            用户账号：<input type="text" name="username"/>
                        </li>
                        <li>
                            用户姓名：<input type="text" name="nickname"/>
                        </li>
                        <li>
                            手机号码：<input type="text" name="mobile"/>
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
            <a class="btn btn-success" onclick="$.operate.add()">
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
    var prefix = " ${ctx}/user";

    /* 用户管理-停用 */
    function disable(id) {
        $.modal.confirm("确认要停用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }

    /* 用户管理启用 */
    function enable(id) {
        $.modal.confirm("确认要启用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }

    function empower(id) {
        var url = prefix + '/empower/' + id;
        $.modal.open("设置角色", url);
    }

    $(function () {
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "管理员",
            uniqueId: "id",
            columns: [{
                checkbox: true
            },
                {
                    field: 'index',
                    title: '序号',
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
                },
                {
                    field: 'username',
                    title: '用户账号'
                },
                {
                    field: 'nickname',
                    title: '用户姓名'
                },
                {
                    field: 'mobile',
                    title: '手机号码'
                },
                {
                    field: 'email',
                    title: '邮箱'
                },
                {
                    field: 'status',
                    title: '状态',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.status == 1) {
                            return '<i class=\"fa fa-toggle-on text-info fa-2x\" onclick="disable(\'' + row.id + '\')"></i> ';
                        } else {
                            return '<i class=\"fa fa-toggle-off text-info fa-2x\" onclick="enable(\'' + row.id + '\')"></i> ';

                        }
                    }
                },
                {
                    field: 'create_time',
                    title: '创建时间',
                    sortable: true
                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-info btn-xs " href="javascript:void(0)" onclick="empower(\'' + row.id + '\')"><i class="fa fa-key"></i>设置角色</a> ');
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