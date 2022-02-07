<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="兼职添加"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form_user_duty_add">
        <input id="id" name="id" type="hidden" value="${userDuty.id}">
        <input id="userId" name="userId" type="hidden" value = "${userId}"/>
        <div class="form-group">
            <label class="col-sm-3 control-label" is-required>所属公司：</label>
            <div class="col-sm-8">
                <select id="companyId" name="companyId"  class="chosen-select form-control" data-msg="请选择所属公司" required>
                    <option value="">请选择所属公司</option>
                    <#list companyList as company>
                        <option value="${company.id}">${company.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" is-required>所属部门：</label>
            <div class="col-sm-8">
                <select id="deptId" name="deptId"  class="chosen-select form-control" data-msg="请选择所属部门" required>
                    <option value="">请选择所属部门</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" is-required>主要职务：</label>
            <div class="col-sm-8">
                <select id="dutyId" name="dutyId"  class="chosen-select form-control" data-msg="请选择兼任职务" required>
                    <option value="">请选择兼任职务</option>
                    <#list dutyList as duty>
                        <option value="${duty.id}">${duty.dutyName}</option>
                    </#list>
                </select>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/userDuty";
    $("#form_user_duty_add").validate({
        onkeyup: false,
        ignore: ":hidden",
        ignore: "",
        rules: {
            //example
        },
        messages: {},
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
            var data = $('#form_user_duty_add').serializeArray();
            data.push({"name": "companyName", "value": $("#companyId").find("option:selected").text()});
            data.push({"name": "deptName", "value": $("#deptId").find("option:selected").text()});
            data.push({"name": "dutyName", "value": $("#dutyId").find("option:selected").text()});
            $.operate.save(prefix + "/add", data);
        }
    }
</script>
</body>
</html>