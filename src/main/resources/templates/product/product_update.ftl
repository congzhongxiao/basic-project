<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="产品修改"/>
    <@css_common/>
    <@css_webuploader_image/>
    <@css_webuploader_file/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-product-update">
        <input id="id" name="id" type="hidden" value="${product.id}">
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">作品名称：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="name" value="${product.name}"
                       id="name" placeholder="请输入作品名称" data-msg="请输入作品名称">

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">作者：</label>
            <div class="col-sm-8">
                <input class="form-control required" type="text" name="author" value="${product.author}"
                       id="author" placeholder="请输入作者" data-msg="请输入作者">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">缩略图：</label>
            <div class="col-sm-8">
                <div class="lee-image-upload" data-field="shortImage" data-size="1">
                    <input type="hidden" class="exist-image" value="${product.shortImage}" data-id="${product.shortImageId}">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">产品相册：</label>
            <div class="col-sm-8">
                <div class="lee-image-upload" data-field="mainImage" data-size="10">
                    <#list mainImages as mainImage>
                        <input type="hidden" class="exist-image" value="${mainImage.url}" data-id="${mainImage.id}">
                    </#list>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">附件</label>
            <div class="col-sm-8">
                <div class="lee-file-upload" data-field="tempFile" data-size="10">
                    <#list files as file>
                        <input type="hidden" class="exist-file" value="${file.url}" data-id="${file.id}"
                               data-name="${file.name}">
                    </#list>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">详情</label>
            <div class="col-sm-8">
                <div class="custom-form-html" data-code="content">
                    <textarea name="content" id="content">${product.content}</textarea>
                </div>
            </div>
        </div>

    </form>
</div>
<@js_common/>
<@js_webuploader_image/>
<@js_webuploader_file/>
<@js_ueditor/>
<script type="text/javascript">
    var prefix = "${ctx}/product";
    $("#form-product-update").validate({
        onkeyup: false,
        rules: {},
        messages: {},
        focusCleanup: true
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-product-update').serialize());
        }
    }
</script>
</body>
</html>