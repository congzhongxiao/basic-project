<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="修改管理员"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content ibox-content">
    <form class="form-horizontal m" id="form-user-update">
        <input id="id" name="id" type="hidden" value="${userInfo.id}"/>

        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户名称：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="nickname" id="nickname"
                               value="${userInfo.nickname}"
                               placeholder="请输入用户名称" data-msg="请输入用户名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">登录帐号：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" disabled value="${userInfo.username}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户状态：</label>
                    <div class="col-sm-8">
                        <label class="toggle-switch switch-solid">
                            <#if userInfo.status == '1'>
                                <input type="checkbox" id="state" value="1" checked>
                            <#else>
                                <input type="checkbox" id="state" value="0">
                            </#if>
                            <span></span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-3 control-label">手机号码</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobile" id="mobile" value="${userInfo.mobile}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label ">邮箱</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="email" id="email" value="${userInfo.email}">
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注：</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="remark" id="remark">${userInfo.remark}</textarea>
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
            }

        },
        messages: {
            mobile: {
                isPhone: '请输入正确的手机号码格式'
            },
            email: {
                email: '请输入正确的邮箱格式'
            }
        },
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            var data = $("#form-user-update").serializeArray();
            var state = $("input[id='state']").is(':checked') == true ? 1 : 0;
            data.push({"name": "status", "value": state});
            $.operate.save(prefix + "/update", data);
        }
    }
</script>
</body>
</html>
