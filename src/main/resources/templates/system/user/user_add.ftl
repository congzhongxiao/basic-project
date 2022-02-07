<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="添加用户"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-user-add">
        <input type="hidden" id="selectCompanyId" name="selectCompanyId">
        <input type="hidden" id="selectDeptId" name="selectDeptId">
        <div class="row">
            <div class="col-xs-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户账号：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="username" id="username"
                               data-msg="请输入用户账号"
                               placeholder="请输入用户账号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">密码：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="password" name="password" id="password" placeholder="请输入密码"
                               autocomplete="new-password">
                        <div class="help-block">密码必须由大写字母、小写字母和数字组成，且位数需要${passwordMin} - ${passwordMax}位。</div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">确认密码：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" required
                               placeholder="请输入确认密码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户姓名：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="nickname" id="nickname"
                               placeholder="请输入用户姓名" data-msg="请输入用户姓名">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">手机号码：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobile" id="mobile" placeholder="请输入手机号码">
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
                                <option value="${company.id}"<#if company.id == selectCompanyId>selected</#if>>${company.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required" >所属部门：</label>
                    <div class="col-sm-8">
                        <select id="deptId" name="deptId" class="chosen-select form-control" data-msg="请选择所属部门"
                                required>
                            <option value="">请选择所属部门</option>
                            <#list deptList as dept>
                                <option value="${dept.id}"<#if dept.id == selectDeptId>selected</#if>>${dept.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required" >主要职务：</label>
                    <div class="col-sm-8">
                        <select id="dutyId" name="dutyId" class="chosen-select form-control" data-msg="请选择主要职务"
                                required>
                            <option value="">请选择主要职务</option>
                            <#list dutyList as duty>
                                <option value="${duty.id}">${duty.dutyName}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">邮箱：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="email" id="email" placeholder="请输入邮箱地址">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">显示顺序：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="sort" id="sort"
                               placeholder="请输入显示顺序" data-msg="请输入显示顺序">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注：</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
                    </div>
                </div>
            </div>
        </div>

    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = '${ctx}/user';
    $("#form-user-add").validate({
        onkeyup: false,
        rules: {
            username: {
                required: true,
                remote: {
                    url: prefix + "/checkUserName",
                    type: "post",
                    dataType: "json",
                    data: {
                        "username": function () {
                            return $.common.trim($("#username").val());
                        }
                    }
                },
                minlength: ${nameMin},
                maxlength:${nameMax}
            },
            password: {
                required: true,
                minlength: ${passwordMin},
                maxlength:${passwordMax}
            },
            confirmPassword: {
                required: true,
                equalTo: "#password"
            },
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
            username: {
                required: '请输入用户账号',
                remote: '用户账号已存在',
                minlength: '用户账号最少${nameMin}位',
                maxlength: '用户账号最大${nameMax}位',
            },
            password: {
                required: '请输入密码',
                minlength: '密码长度最少${passwordMin}位',
                maxlength: '密码长度最长${passwordMax}位',
            },
            confirmPassword: {
                required: '请输入确认密码',
                equalTo: '确认密码和密码不一致',
            },
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
            var data = $('#form-user-add').serializeArray();
            data.push({"name": "companyName", "value": $("#companyId").find("option:selected").text()});
            data.push({"name": "deptName", "value": $("#deptId").find("option:selected").text()});
            data.push({"name": "dutyName", "value": $("#dutyId").find("option:selected").text()});
            $.operate.save(prefix + "/add", data);
        }
    }
</script>
</body>
</html>