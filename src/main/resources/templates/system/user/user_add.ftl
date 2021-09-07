<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="添加管理员"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m15" id="form-user-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">用户账号：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="username" id="username" placeholder="请输入用户账号">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">密码：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="password" name="password" id="password" placeholder="请输入密码"
                       autocomplete="new-password">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">确认密码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="password" name="confirmPassword" id="confirmPassword" required
                       placeholder="请输入确认密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">用户姓名：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="nickname" id="nickname" placeholder="请输入用户姓名" data-msg="请输入用户姓名">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">手机号码：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="mobile" id="mobile" placeholder="请输入手机号码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">邮箱：</label>
            <div class="col-sm-8">
                <input class="form-control" type="text" name="email" id="email" placeholder="请输入邮箱地址">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">备注：</label>
            <div class="col-sm-8">
                <textarea class="form-control" rows="3" name="remark" id="remark"></textarea>
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
            },
            confirmPassword: {
                required: true,
                minlength: ${passwordMin},
                equalTo: "#password"
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
                required: '请输入用户账号',
                remote: '用户账号已存在',
                minlength: '用户账号最少${nameMin}位',
                maxlength: '用户账号最大${nameMax}位',
            },
            password: {
                required: '请输入密码',
                minlength: '密码长度最少${passwordMin}位',
            },
            confirmPassword: {
                required: '请输入确认密码',
                equalTo: '确认密码和密码不一致',
                minlength: '确认密码长度最少${passwordMin}位',
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
            $.operate.save(prefix + "/add", $('#form-user-add').serialize());
        }
    }
</script>
</body>
</html>