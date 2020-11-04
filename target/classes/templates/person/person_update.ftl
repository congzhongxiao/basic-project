<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="人员信息修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-person-update">
        <input id="id" name="id" type="hidden" value="${person.id}">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">姓名：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" value="${person.name}"
                       id="name" placeholder="请输入姓名" data-msg="请输入姓名">

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">年龄：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="age" value="${person.age}"
                       id="age" placeholder="请输入年龄" data-msg="请输入年龄">

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">出生日期：</label>
            <div class="col-sm-8">
                <input type="text" class="form-control time-input required" data-type="date" value="${(person.birthday?string('yyyy-MM-dd'))!''}"
                       id="birthday" name="birthday" data-msg="请选择出生日期"
                       placeholder="请选择出生日期" readonly/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">性别：</label>
            <div class="col-sm-8">
                <select class=" form-control chosen-select required" name="gender" placeholder="请输入性别" data-msg="请输入性别"
                        id="gender">
                    <option value="">请选择性别</option>
                    <option value="0" <#if person.gender == 0>  selected </#if> >保密</option>
                    <option value="1" <#if person.gender == 1> selected </#if>>男</option>
                    <option value="2" <#if person.gender == 2> selected </#if>>女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">通讯地址：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="address"
                          id="address" placeholder="请输入通讯地址" data-msg="请输入通讯地址">${person.address}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">个人简介：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="summary" rows="4"
                          id="summary" placeholder="请输入个人简介" data-msg="请输入个人简介">${person.summary}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/person";
    $("#form-person-update").validate({
        onkeyup: false,
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-person-update').serialize());
        }
    }
</script>
</body>
</html>