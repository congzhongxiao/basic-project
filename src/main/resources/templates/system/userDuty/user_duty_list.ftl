<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="兼职列表"/>
<@css_common/>
</head>
<body class="gray-bg">
<div class="container-div">
    <div class="row">
        <div class="col-sm-12 search-collapse">
            <form id="user_duty-form">
                <input id="userId" name="userId" type="hidden" value = "${userId}"/>
                <div class="select-list">
                    <ul>
                        <li>
                            所属公司：
                            <select id="companyId" name="companyId"  class="chosen-select form-control" data-msg="请选择所属公司">
                                <option value="">请选择所属公司</option>
                                <#list companyList as company>
                                    <option value="${company.id}">${company.name}</option>
                                </#list>
                            </select>
                        </li>
                        <li>
                            所属部门：
                            <select class="chosen-select form-control" name="deptId" id="deptId" data-msg="请选择所属部门">
                                <option value="">请选择所属部门</option>
                            </select>
                        </li>
                        <li>
                            兼任职务：
                            <select id="dutyId" name="dutyId"  class="chosen-select form-control" data-msg="请选择兼任职务">
                                <option value="">请选择兼任职务</option>
                                <#list dutyList as duty>
                                    <option value="${duty.id}">${duty.dutyName}</option>
                                </#list>
                            </select>
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
    var prefix = "${ctx}/userDuty";

    $("#companyId").change(function () {
        $("#deptId").empty();
        $("#deptId").append('<option value="">请选择所属部门</option>');
        $("#deptId").trigger("chosen:updated");
        var companyId = $(this).val();
        if (companyId && companyId != '') {
            $.ajax({
                type: 'get',
                url: '${ctx}/organization/getDepartmentListByCompany/' + companyId,
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        var departmentList = data.data;
                        if (departmentList && departmentList.length > 0) {
                            $.each(departmentList, function (index, department) {
                                $("#deptId").append('<option value="' + department.id + '">' + department.name + '</option>');
                            });
                            $("#deptId").trigger("chosen:updated");
                        }
                    }
                }
            });
        }
    });

    $(function () {
        var options = {
            url: prefix + "/findList/"+$("#userId").val(),
            createUrl: prefix + "/add/"+$("#userId").val(),
            updateUrl: prefix + "/update/{id}",
            removeUrl: prefix + "/delete",
            modalName: "兼职",
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
                    field: 'companyName',
                    title: '公司名称'
                },
            {
                field: 'deptName',
                title: '部门名称'
            },
                {
                    field: 'code',
                    title: '兼职编码'
                },
            {
                field: 'dutyName',
                title: '兼职名称'
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