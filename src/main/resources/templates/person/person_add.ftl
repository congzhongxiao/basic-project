<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="人员信息添加"/>
    <@css_common/>
    <link href="${ctx}/static/plugins/select-tree/select-tree.css" rel="stylesheet"/>

</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-person-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">姓名：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name"
                       id="name" placeholder="请输入姓名" data-msg="请输入姓名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">所属区划：</label>
            <div class="col-sm-8">
                <select class="noselect2 form-control required select-tree" data-placeholder="请选择区划" id="area" name="area" data-msg="请选择区划">
                    <option value=""></option>
                    <#list areaList as area>
                        <option value="${area.id}" data-pid="${area.pid}">${area.name}</option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">组织架构：</label>
            <div class="col-sm-8">
                <select class="noselect2 form-control required select-tree" data-placeholder="请选择组织架构" id="org" name="org" data-msg="请选择组织架构">
                    <option value=""></option>
                    <option value="1" data-pid="0" >1</option>
                    <option value="12" data-pid="1">12</option>
                    <option value="123" data-pid="12" >123</option>
                    <option value="13" data-pid="1">13</option>
                    <option value="131" data-pid="13">131</option>
                    <option value="132" data-pid="13" selected>132</option>
                    <option value="133" data-pid="13">133</option>
                    <option value="134" data-pid="13">134</option>
                    <option value="135" data-pid="13">135</option>
                    <option value="1341" data-pid="134">1341</option>
                    <option value="2" data-pid="0">2</option>
                    <option value="3" data-pid="0">3</option>
                    <option value="21" data-pid="2">21</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">年龄：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="age"
                       id="age" placeholder="请输入年龄" data-msg="请输入年龄">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">出生日期：</label>
            <div class="col-sm-8">
                <input type="text" class="form-control time-input required" data-type="date"
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
                    <option value="0">保密</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">通讯地址：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="address"
                          id="address" placeholder="请输入通讯地址" data-msg="请输入通讯地址"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">个人简介：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="summary" rows="4"
                          id="summary" placeholder="请输入个人简介" data-msg="请输入个人简介"></textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script src="${ctx}/static/plugins/select-tree/select-tree.js"></script>

<script type="text/javascript">
    var prefix = "${ctx}/person";
    $("#form-person-add").validate({
        ignore: ":hidden:not(select)",//解决无法校验select
        onkeyup: false,
        rules: {
            age:{
                digits:true
            }
            //example
        },
        messages: {
            age:{
                digits:'年龄请输入数字'
            }
        },
        focusCleanup: true
    });

    $(function () {
        $(".select-tree").selectTree({
            expandAll:false,
            expandLevel:0
        });

    })

    function submitHandler() {
        alert($('#area').val());
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form-person-add').serialize());
        }
    }
</script>
</body>
</html>