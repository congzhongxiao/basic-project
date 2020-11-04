<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
<@meta title="图片管理修改"/>
<@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-image-update">
        <input id="id" name="id" type="hidden" value="${image.id}">
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">主键：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="id" value="${image.id}"
                               id="id"  placeholder="请输入主键" data-msg="请输入主键">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">上传类型：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="storage" value="${image.storage}"
                               id="storage"  placeholder="请输入上传类型" data-msg="请输入上传类型">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">地址：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="url" value="${image.url}"
                               id="url"  placeholder="请输入地址" data-msg="请输入地址">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">文件名称：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="name" value="${image.name}"
                               id="name"  placeholder="请输入文件名称" data-msg="请输入文件名称">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">文件大小：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="size" value="${image.size}"
                               id="size"  placeholder="请输入文件大小" data-msg="请输入文件大小">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">文件类型：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="type" value="${image.type}"
                               id="type"  placeholder="请输入文件类型" data-msg="请输入文件类型">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">文件后缀名：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="extension" value="${image.extension}"
                               id="extension"  placeholder="请输入文件后缀名" data-msg="请输入文件后缀名">

                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">创建时间：</label>
                <div class="col-sm-8">
                            时间类型自己处理
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label is-required">创建人：</label>
                <div class="col-sm-8">
                        <input class="form-control required" type="text" name="createBy" value="${image.createBy}"
                               id="createBy"  placeholder="请输入创建人" data-msg="请输入创建人">

                </div>
            </div>
    </form>
</div>
<@js_common/>
<script type="text/javascript">
    var prefix = "${ctx}/image";
    $("#form-image-update").validate({
        onkeyup: false,
        rules: {},
        messages: {},
        focusCleanup: true
    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-image-update').serialize());
        }
    }
</script>
</body>
</html>