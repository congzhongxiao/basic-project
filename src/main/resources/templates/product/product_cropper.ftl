<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="图像裁切"/>
    <@css_common/>
    <link href="${ctx}/static/plugins/cropper/cropper.css" rel="stylesheet"/>
</head>
<body class="white-bg ">
<div class="container">
    <div class="row">
        <div class="col-xs-8">
            <div class="cropper-image-box">
                <img id="image" <#if imgUrl?? && imgUrl != ''>src="${imgUrl}"</#if>>
            </div>
            <div class="cropper-image-tools">
                <label class="btn btn-sm btn-primary" for="select_image">
                    <input type="file" name="file" id="select_image" class="cropper-image-file"
                           onchange="selectImage(this)"
                           accept=".jpg,.jpeg,.png,.gif,.bmp,.tiff">
                    <span>选择图片</span>
                </label>
                <button id="addZoom" class="btn btn-sm btn-primary"><i class="fa fa-plus"></i></button>
                <button id="reduceZoom" class="btn btn-sm btn-primary"><i class="fa fa-minus"></i></button>
                <button id="rotateLeft" class="btn btn-sm btn-primary"><i class="fa fa-rotate-left"></i></button>
                <button id="rotateRight" class="btn btn-sm btn-primary"><i class="fa fa-rotate-right"></i></button>
                <button id="reset" class="btn btn-sm btn-primary"><i class="fa fa-refresh"></i></button>
            </div>
        </div>
        <div class="col-xs-4">
            <div class="cropper-preview-box"></div>
        </div>
    </div>
</div>
<@js_common/>
<script src="${ctx}/static/plugins/cropper/cropper.js"></script>
<script src="${ctx}/static/plugins/cropper/jquery-cropper.js"></script>
<script>
    $("#image").cropper({
        aspectRatio: 16 / 9,//默认比例
        preview: '.cropper-preview-box'
    });
    $("#addZoom").click(function () {
        if ($("#image").attr("src") != null) {
            $("#image").cropper('zoom', 0.1);
        }
    });
    $("#reduceZoom").click(function () {
        if ($("#image").attr("src") != null) {
            $("#image").cropper('zoom', -0.1);
        }
    });
    $("#rotateLeft").click(function () {
        if ($("#image").attr("src") != null) {
            $("#image").cropper('rotate', -45);
        }
    });
    $("#rotateRight").click(function () {
        if ($("#image").attr("src") != null) {
            $("#image").cropper('rotate', 45);
        }
    });
    $("#reset").click(function () {
        if ($("#image").attr("src") != null) {
            $("#image").cropper('reset');
        }
    });

    function submitHandler() {
        if ($("#image").attr("src") == null) {
            $.modal.alert('请先上传图片');
        } else {
            var cas = $('#image').cropper('getCroppedCanvas');
            var base64url = cas.toDataURL('image/jpeg',1); //转换为base64地址形式
            var timestamp = Date.parse(new Date());//创建文件名称
            var createImgUrl = data2blob(base64url, 'image/jpeg')
            var fmData = new FormData();
            fmData.append("file", createImgUrl, timestamp + '.jpg')
            $.ajax({
                url: '${ctx}/common/upload/image',
                type: 'POST',
                data: fmData,
                processData: false,
                contentType: false,
                success: function (result) {
                    if (result.success) {
                        var parent = $(window.parent.document);
                        var image = parent.find("#cutImage");
                        image.attr("src", result.data.url);
                        parent.find("#cutId").val(result.data.id);
                        parent.find("#cutUrl").val(result.data.url);
                        $.modal.close();
                    } else {
                        $.modal.alert(result.message);
                    }
                }
            });
        }
    }

    //将base64转换为Blob文件
    function data2blob(data, mime) {
        data = data.split(',')[1];
        data = window.atob(data);
        var ia = new Uint8Array(data.length);
        for (var i = 0; i < data.length; i++) {
            ia[i] = data.charCodeAt(i);
        }
        ;
        return new Blob([ia], {
            type: mime
        });
    }

    function selectImage(file) {
        if (!file.files || !file.files[0]) {
            return false;
        }
        var imageFile = file.files[0];
        if (/^image\/\w+$/.test(imageFile.type)) {
            var reader = new FileReader();
            reader.onload = function (evt) {
                var replaceSrc = evt.target.result;
                $("#image").cropper('replace', replaceSrc, false);
            }
            reader.readAsDataURL(imageFile);
        } else {
            $.modal.alert('请选择图片文件上传');
            return false;
        }

    }
</script>
</body>
</html>