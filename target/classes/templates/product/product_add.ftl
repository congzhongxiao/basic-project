<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="产品添加"/>
    <@css_common/>
    <@css_webuploader_image/>
    <@css_webuploader_file/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal m" id="form-product-add">
        <div class="form-group">
            <label class="col-sm-2 control-label is-required">名称：</label>
            <div class="col-sm-9">
                <input class="form-control required" type="text" name="name"
                       id="name" placeholder="请输入名称" data-msg="请输入名称">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label is-required">作者：</label>
            <div class="col-sm-9">
                <input class="form-control required" type="text" name="author"
                       id="author" placeholder="请输入作者" data-msg="请输入作者">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label ">裁剪图片</label>
            <div class="col-sm-9">
                <div class="cropper-area" id="previewCut">
                    <img id="cutImage" name="cutImage">
                    <input type="hidden" name="cutId" id="cutId" value="">
                    <input type="hidden" name="cutUrl" id="cutUrl" value="">
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label ">封面图片</label>
            <div class="col-sm-9">
                <div id="shortImage"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label ">产品相册</label>
            <div class="col-sm-9">
                <div id="mainImage"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label ">附件</label>
            <div class="col-sm-9">
                <div id="tempFile"></div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label ">详情</label>
            <div class="col-sm-9">
                <div class="custom-form-html" data-code="content">
                    <textarea name="content" id="content"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>
<@js_common/>
<@js_webuploader_image/>
<@js_webuploader_file/>
<script type="text/javascript">
    var prefix = "${ctx}/product";
    $("#form-product-add").validate({
        onkeyup: false,
        rules: {
        },
        messages: {},
        focusCleanup: true
    });


    $(function () {
        $("#previewCut").click(function(){
            var img = $(this).find("#cutImage");
            var path = img.attr("src");
            var url = prefix + '/cropper';
            if(path && path != '') {
                url += '?imgUrl=' + path;
            }
            $.modal.open("预览图选取",url);
        });
        $("#shortImage").leeImageUploader({
            max:1,
            uploadUrl: '${ctx}/common/upload/image',
            idName:'shortImageId'
        });
        $("#mainImage").leeImageUploader({
            max:5,
            uploadUrl: '${ctx}/common/upload/image',
            idName:'mainImageId'
        });
        $("#tempFile").leeFileUploader({
            max:5,
            multiple:true,
            uploadUrl: '${ctx}/common/upload/file',
            idName:'tempFileId'
        });


    });


    function submitHandler() {
        if ($.validate.form()) {
            $.operate.save(prefix + "/add", $('#form-product-add').serialize());
        }
    }
</script>
</body>
</html>