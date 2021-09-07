<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="登录信息列表"/>
<@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="sys_login_log-form">
                <div class="select-list">
                    <ul>
                        <li>
                            登录账号：<input type="text" name="username"/>
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
        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table"></table>
        </div>
    </div>
</div>
<@js_common/>
<script>
    var prefix = "${ctx}/loginLog";

    $(function () {
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "登录信息",
            showRefresh:false,
            showSearch:false,
            uniqueId: "id",
            columns: [
            {
                title: '序号',
                width: 5,
                align: "center",
                formatter: function (value, row, index) {
                    return $.table.serialNumber(index);
                }
            },
            {
                field: 'username',
                title: '登录账号'
            },
            {
                field: 'loginIp',
                title: '登录IP'
            },
            {
                field: 'browser',
                title: '浏览器'
            },
            {
                field: 'os',
                title: '操作系统'
            },
            {
                field: 'status',
                title: '登录状态',
                formatter:function (value,row,index) {
                    if(value == '0') {
                        return '<label class="badge badge-danger">失败</label>'
                    } else {
                        return '<label class="badge badge-success">成功</label>'
                    }
                }
            },
            {
                field: 'loginTime',
                title: '登录时间'
            },
            {
                field: 'msg',
                title: '登录信息'
            }]
        };
        $.table.init(options);
    });
</script>
</body>
</html>