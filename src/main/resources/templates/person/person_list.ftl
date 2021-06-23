<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="人员信息列表"/>
    <@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="person-form">
                <div class="select-list">
                    <ul>

                        <li>
                            姓名：<input type="text" name="name"/>
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
            <a class="btn btn-success" onclick="$.operate.add()">
                <i class="fa fa-plus"></i> 新增
            </a>
            <a class="btn btn-danger multiple " onclick="$.operate.removeAll()">
                <i class="fa fa-remove"></i> 删除
            </a>
            <a class="btn btn-info" onclick="$.table.importExcel()">
                <i class="fa fa-upload"></i> 导入
            </a>
            <a class="btn btn-warning" onclick="$.table.exportExcel()">
                <i class="fa fa-download"></i> 导出
            </a>
        </div>

        <div class="col-sm-12 select-table table-striped">
            <table id="bootstrap-table"></table>
        </div>
    </div>
</div>
<@js_common/>
<!-- 导入区域 -->
<script id="importTpl" type="text/template">
    <form enctype="multipart/form-data" class="mt20 mb10">
        <div class="col-xs-offset-1">


            <input type="file" id="file" name="file"/>
            <div class="mt10 pt5 ">
                <a onclick="$.table.importTemplate()" class="btn btn-success btn-xs"><i class="fa fa-file-excel-o"></i> 下载导入模板文件</a>
            </div>
            <font  color="red" class="pull-left mt10">
                提示：仅允许导入“xls”或“xlsx”格式文件！
            </font>

        </div>
    </form>
</script>
<script>
    var prefix = "${ctx}/person";

    $(function () {
        var options = {
            url: prefix + "/findList",
            createUrl: prefix + "/add",
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            exportUrl: prefix + "/export",
            importUrl: prefix + "/importData",
            importTemplateUrl: prefix + "/importTemplate",
            modalName: "人员信息",
            uniqueId: "id",
            rightFixedColumns:true,
            rightFixedNumber:2,
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
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'name',
                    title: '姓名'
                },
                {
                    field: 'age',
                    title: '年龄'
                },
                {
                    field: 'birthday',
                    title: '出生日期'
                },
                {
                    field: 'gender',
                    title: '性别',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return '保密';
                        } else if (value == 1) {
                            return '男';
                        } else if (value == 2) {
                            return '女';
                        }
                        return '-';
                    }
                },
                {
                    field: 'address',
                    title: '地址'
                },

                {
                    field: 'createTime',
                    title: '创建时间'
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