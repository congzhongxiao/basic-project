<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="字典修改"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-dictionary-update">
        <input id="id" name="id" type="hidden" value="${dictionary.id}">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">字典分类：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="type" value="${dictionary.type}"
                       id="type" placeholder="请输入字典分类" data-msg="请输入字典分类">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">字典名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" value="${dictionary.name}"
                       id="name" placeholder="请输入字典名称" data-msg="请输入字典名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">字典值：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="value" value="${dictionary.value}"
                       id="value" placeholder="请输入字典值" data-msg="请输入字典值">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">状态：</label>
            <div class="col-sm-8">
                <label>
                    <input type="radio" class=" required" name="status" id="status" data-msg="请选择状态"
                           value="1" <#if dictionary.status == '1' > checked </#if>>启用
                </label>
                &nbsp;&nbsp;
                <label>
                    <input type="radio" class=" required" name="status" id="status" data-msg="请选择状态"
                           value="0" <#if dictionary.status == '0' > checked </#if>>停用
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">排序：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="sort" value="${dictionary.sort}"
                       id="sort" placeholder="请输入排序" data-msg="请输入排序">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">字典说明：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="remark" rows="4"
                          id="remark" placeholder="请输入说明" data-msg="请输入说明">${dictionary.remark}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/dictionary";
    $("#form-dictionary-update").validate({
        onkeyup: false,
        rules: {
            sort: {
                digits: true
            }
        },
        messages: {
            sort: {
                digits: '排序必须为正整数'
            }
        },
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-dictionary-update').serialize());
        }
    }
</script>
</body>
</html>