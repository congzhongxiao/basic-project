<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="系统日志列表"/>
    <@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="dictionary-form">
                <div class="select-list">
                    <ul>
                        <li>
                            模块名称：<input type="text" name="name"/>
                        </li>
                        <li class="">
                            操作类型：
                            <select name="type" class="form-control">
                                <option value="">请选择</option>
                                <option value="0">登录</option>
                                <option value="1">新增</option>
                                <option value="2">修改</option>
                                <option value="3">删除</option>
                                <option value="4">导出</option>
                                <option value="5">导入</option>
                                <option value="6">授权</option>
                                <option value="7">其他</option>
                            </select>
                        </li>
                        <li>
                            操作用户：<input type="text" name="operUserName"/>
                        </li>
                        <li>
                            <a class="btn btn-primary btn-rounded btn-sm" onclick="$.table.search()"><i
                                        class="fa fa-search"></i>&nbsp;搜索</a>
                            <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i
                                        class="fa fa-refresh"></i>&nbsp;重置</a>
                        </li>
                    </ul>
                </div>
            </form>
        </div>

        <div class="btn-group-sm" id="toolbar" role="group">
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
    var prefix = "${ctx}/operateLog";

    $(function () {
        var options = {
            url: prefix + "/findList",
            modalName: "操作日志",
            detailUrl:prefix + "/view/{id}",
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
                    field: 'name',
                    title: '模块名称'
                },
                {
                    field: 'type',
                    title: '业务类型',
                    formatter: function (value) {
                        var result = '';
                        if (value == 0) {
                            result = '登录';
                        } else if (value == 1) {
                            result = '新增';
                        } else if (value == 2) {
                            result = '编辑';
                        } else if (value == 3) {
                            result = '删除';
                        } else if (value == 4) {
                            result = '导出';
                        } else if (value == 5) {
                            result = '导入';
                        } else if (value == 6) {
                            result = '授权';
                        } else if (value == 7) {
                            result = '其他';
                        }
                        return '<label class="badge badge-info">' + result + '</label>';
                    }
                },
                {
                    field: 'request_type',
                    title: '请求类型'
                },
                {
                    field: 'oper_user_name',
                    title: '操作用户'
                },
                {
                    field: 'oper_ip',
                    title: '操作IP'
                },
                {
                    field: 'oper_location',
                    title: '操作地点'
                },
                {
                    field: 'oper_time',
                    title: '操作时间'
                },
                {
                    field: 'state',
                    title: '操作状态',
                    formatter: function (value) {
                        if (value == 0) {
                            return '<label class="badge badge-primary">成功</label>';
                        } else {
                            return '<label class="badge badge-danger">失败</label>';
                        }
                    }

                },
                {
                    title: '操作',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var actions = [];
                        actions.push('<a class="btn btn-warning  btn-xs " href="javascript:void(0)" onclick="$.operate.detail(\'' + row.id + '\')"><i class="fa fa-eye"></i>详情</a> ');
                        return actions.join('');
                    }
                }]
        };
        $.table.init(options);
    });
</script>
</body>
</html>