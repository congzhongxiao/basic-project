<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="新增管理员"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content ibox-content">
    <form class="form-horizontal m10" id="form-user-add">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户名称：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="nickname" id="nickname"
                               placeholder="请输入用户名称"
                               data-msg="请输入用户名称">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">登录帐号：</label>
                    <div class="col-sm-8">
                        <input class="form-control required" type="text" name="username" id="username"
                               placeholder="请输入登录帐号">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">登录密码：</label>
                    <div class="col-sm-8">
                        <div class="input-group">

                            <input class="form-control required" type="password" name="password" id="password"
                                   placeholder="请输入登录密码"
                                   autocomplete="new-password">
                            <div class="input-group-addon " data-toggle="tooltip" data-trigger="hover"
                                 data-placement="bottom"
                                 title="密码由${passwordMin}至${passwordMax}位大写字母、小写字母和数字组成。"><i
                                        class="fa fa-question-circle-o"></i></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">


                <div class="form-group">
                    <label class="col-sm-4 control-label">手机号码：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="mobile" id="mobile" placeholder="请输入手机号码">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">邮箱：</label>
                    <div class="col-sm-8">
                        <input class="form-control" type="text" name="email" id="email" placeholder="请输入邮箱地址">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label is-required">用户状态：</label>
                    <div class="col-sm-8">
                        <label class="toggle-switch switch-solid">
                            <input type="checkbox" id="state" value="1" checked>
                            <span></span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="col-sm-2 control-label">备注：</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-header">角色授权</div>

        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="col-sm-2 control-label">角色信息：</label>
                    <div class="col-sm-10">
                        <ul class="ul-auto-3">
                            <#list roleList as role>
                                <li>
                                    <label class="checkbox-inline " title="${role.name}">
                                        <input type="checkbox" name="role_id" value="${role.id}">${role.name}
                                    </label>
                                </li>
                            </#list>
                        </ul>
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
            mobile: {
                isPhone: true
            },
            email: {
                email: true
            }

        },
        messages: {
            username: {
                required: '请输入登录帐号',
                remote: '登录帐号已存在',
                minlength: '登录帐号最少${nameMin}位',
                maxlength: '登录帐号最大${nameMax}位',
            },
            password: {
                required: '请输入密码',
                minlength: '密码长度最少${passwordMin}位',
                maxlength: '密码长度最长${passwordMax}位',
            },
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
            var data = $("#form-user-add").serializeArray();
            var state = $("input[id='state']").is(':checked') == true ? 1 : 0;
            data.push({"name": "status", "value": state});
            $.operate.save(prefix + "/add", data);
        }
    }
</script>
</body>
</html>