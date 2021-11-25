<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="系统基础配置"/>
    <@css_common/>
</head>
<body class="gray-bg">
<section class="pd10">
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading">系统基础配置</div>
                <div class="panel-body">
                <form class="form-horizontal m" id="form_system_config_basic">
                    <div class="form-group">
                        <label class="col-xs-7 control-label align-center-force font-bold">设置内容</label>
                        <label class="col-xs-4 control-label font-bold">设置编码</label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">系统名称：</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" id="sys_name" name="sys_name"
                                   value="${basicMap['sys_name']}">
                            <span class="help-block"><i class="fa fa-info-circle"></i>系统名称</span>
                        </div>
                        <label class="col-sm-4 control-label">sys_name</label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">系统标题：</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" id="sys_title" name="sys_title"
                                   value="${basicMap['sys_title']}">
                            <span class="help-block"><i class="fa fa-info-circle"></i>登录后页面系统标题</span>
                        </div>
                        <label class="col-sm-4 control-label">sys_title</label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录文字：</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" id="login_content" name="login_content"
                                   value="${basicMap['login_content']}">
                            <span class="help-block"><i class="fa fa-info-circle"></i>登录页面显示文字</span>
                        </div>
                        <label class="col-sm-4 control-label">login_content</label>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">登录标题：</label>
                        <div class="col-sm-5">
                            <input class="form-control" type="text" id="login_title" name="login_title"
                                   value="${basicMap['login_title']}">
                            <span class="help-block"><i class="fa fa-info-circle"></i>登录页面标题</span>
                        </div>
                        <label class="col-sm-4 control-label">login_title</label>
                    </div>
                </form>
                <div class="box-footer mb10">
                    <div class="col-sm-offset-5 col-sm-6">
                        <button type="button" class="btn btn-sm btn-success" onclick="submitHandler()"><i
                                    class="fa fa-check"></i>保 存
                        </button>&nbsp;
                        <button type="button" class="btn btn-sm btn-danger" onclick="closeItem()"><i
                                    class="fa fa-remove"></i>关 闭
                        </button>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/system/config/basic";

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.saveModal(prefix + "/save", $('#form_system_config_basic').serialize());
        }
    }
</script>
</body>
</html>