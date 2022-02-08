<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="用户修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-user-update">
        <input id="id" name="id" type="hidden" value="${userInfo.id}"/>
        <div class="row">
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户账号：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" disabled value="${userInfo.username}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户姓名：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="nickname" id="nickname"
                               value="${userInfo.nickname}"
                               placeholder="请输入用户姓名" data-msg="请输入用户姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">手机号码：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobile" id="mobile" value="${userInfo.mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label ">邮箱：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="email" id="email" value="${userInfo.email}">
                    </div>
                </div>

            </div>
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required" >所属公司：</label>
                    <div class="col-sm-8">
                        <select id="companyId" name="companyId" class="chosen-select form-control" data-msg="请选择所属公司"
                                required>
                            <option value="">请选择所属公司</option>
                            <#list companyList as company>
                                <option value="${company.id}"<#if userInfo.companyId == company.id > selected </#if>>${company.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required" is-required>所属部门：</label>
                    <div class="col-sm-8">
                        <select id="deptId" name="deptId" class="chosen-select form-control" data-msg="请选择所属部门"
                                required>
                            <option value="">请选择所属部门</option>
                            <#list departmentList as department>
                                <option value="${department.id}"<#if userInfo.deptId == department.id > selected </#if>>${department.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required" is-required>主要职务：</label>
                    <div class="col-sm-8">
                        <select id="dutyId" name="dutyId" class="chosen-select form-control" data-msg="请选择主要职务"
                                required>
                            <option value="">请选择主要职务</option>
                            <#list dutyList as duty>
                                <option value="${duty.id}"<#if userInfo.dutyId == duty.id > selected </#if>>${duty.dutyName}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">显示顺序：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="sort" id="sort"
                               placeholder="请输入显示顺序" data-msg="请输入显示顺序" value="${userInfo.sort}">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="form-group">
                    <label class="col-sm-2 control-label ">备注：</label>
                    <div class="col-sm-10">
                            <textarea class="form-control" rows="3" name="remark"
                                      id="remark">${userInfo.remark}</textarea>
                    </div>
                </div>
            </div>
        </div>

    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/user";
    $("#form-user-update").validate({
        onkeyup: false,
        rules: {
            mobile: {
                isPhone: true
            },
            email: {
                email: true
            },
            sort: {
                positiveIntAndZero: true
            }
        },
        messages: {
            mobile: {
                isPhone: '请输入正确的手机号码格式'
            },
            email: {
                email: '请输入正确的邮箱格式'
            },
            sort: {
                positiveIntAndZero: '请输入正整数或0'
            }
        },
        focusCleanup: true
    });

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

    function submitHandler() {
        if ($.validate.form()) {
            var data = $('#form-user-update').serializeArray();
            data.push({"name": "companyName", "value": $("#companyId").find("option:selected").text()});
            data.push({"name": "deptName", "value": $("#deptId").find("option:selected").text()});
            data.push({"name": "dutyName", "value": $("#dutyId").find("option:selected").text()});
            $.operate.save(prefix + "/update", data);
        }
    }
</script>
</body>
</html>
