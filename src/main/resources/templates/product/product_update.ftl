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
                <div id="shortImage"></div>
                <input type="hidden" name="existImages" value="${product.shortImage}" data-id="${product.shortId}" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label is-required">产品相册：</label>
            <div class="col-sm-8">
                <div id="mainImage"></div>
                <#list mainImages as mainImage>
                    <input type="hidden" name="mainImage" value="${mainImage.url}" data-id="${mainImage.id}" >
                </#list>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label ">附件</label>
            <div class="col-sm-8">
                <div id="tempFile"></div>
                <#list files as file>
                    <input type="hidden" name="tempFile" value="${file.url}" data-id="${file.id}" data-name="${file.name}" >
                </#list>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">描述：</label>
            <div class="col-sm-8">
                <textarea class="form-control " name="detail" id="detail" rows="4">${product.detail}</textarea>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<@js_webuploader_image/>
<@js_webuploader_file/>
<script type="text/javascript">
    var prefix = "${ctx}/product";
    $("#form-product-update").validate({
        onkeyup: false,
        rules: {},
        messages: {},
        focusCleanup: true
    });
    $(function () {
        var existArray = new Array();
        $("input[name='existImages']").each(function () {
            var image = new Object();
            image.url = $(this).val();
            image.id = $(this).data("id");
            existArray.push(image);
        });

        $("#shortImage").leeImageUploader({
            max: 1,
            uploadUrl: '${ctx}/common/upload/image',
            idName: 'shortImageId',
            existFiles: existArray
        });


        var mainImages = new Array();
        $("input[name='mainImage']").each(function () {
            var image = new Object();
            image.url = $(this).val();
            image.id = $(this).data("id");
            mainImages.push(image);
        });
        $("#mainImage").leeImageUploader({
            max: 5,
            uploadUrl: '${ctx}/common/upload/image',
            idName: 'mainImageId',
            existFiles: mainImages
        });
        var existFile = [];
        $("input[name='tempFile']").each(function () {
            var file = {};
            file.url = $(this).val();
            file.id = $(this).data("id");
            file.name = $(this).data("name");
            existFile.push(file);
        });
        $("#tempFile").leeFileUploader({
            max:5,
            multiple:true,
            uploadUrl: '${ctx}/common/upload/file',
            idName:'tempFileId',
            existFiles:existFile
        });
    });

    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/update", $('#form-product-update').serialize());
        }
    }
</script>
</body>
</html>