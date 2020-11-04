<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="图片管理添加"/>
    <@css_common/>
    <@css_webuploader/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-image-add">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">进度条效果</label>
            <div class="col-sm-8">
                <p class="progress progress-mini">
                    <span style="width: 35%"  class="progress-bar progress-bar-danger"></span>
                </p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">主键：</label>
            <div class="col-sm-8">
                <div class="webuploader-single-image"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">主键：</label>
            <div class="col-sm-8">
                <div id="single-pic"></div>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<@js_webuploader/>
<script type="text/javascript">
    var prefix = "${ctx}/image";
    var options = {
        max:1,
        uploadUrl: '${ctx}/common/upload/image',
        idName:'formImage',
        urlName:'apply'
    };
    $("#single-pic").leeImageUploader(options);

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form-image-add').serialize());
        }
    }
</script>
</body>
</html>