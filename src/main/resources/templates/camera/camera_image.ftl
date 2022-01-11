<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="拍照上传"/>
    <@css_common/>
    <link href="${ctx}/static/plugins/webCamera/camera.css" rel="stylesheet">

</head>
<body class="white-bg">
<div class="camera-panel">
    <div class="camera-view">
        <img id="camera_view_image" width="500px" height="350px" src="" alt="主摄像头画面">
    </div>
    <div class="camera-thumbnail" id="camera_thumbnail">

    </div>
    <div class="camera-operate">
        <span>
            <button class="btn btn-sm btn-primary" onclick="rotateLeft()"><i class="fa fa-fw fa-rotate-left"></i>向左旋转</button>
            <button class="btn btn-sm btn-primary" onclick="rotateRight()"><i class="fa fa-fw fa-rotate-right"></i>向右旋转</button>
            <button class="btn btn-sm btn-success" onclick="scanCamera(0)"><i class="fa fa-fw fa-camera"></i>拍摄照片</button>
        </span>
        <span class="help-inline text-danger">**照片文件名称不需要输入图片类型后缀。</span>
    </div>

</div>

<@js_common/>
<script src="${ctx}/static/plugins/webCamera/camera.js"></script>
<script>
    function submitHandler() {
        var box = $("#camera_thumbnail").find(".camera-thumbnail-box");
        $("#camera_thumbnail input").removeClass("error");
        var canSubmit = true;
        var errorMsg = '';
        var imageArray = [];
        if (box.length > 0) {
            box.each(function () {
                var imageObj = {};
                var image = $(this).find('img');
                var nameInput = $(this).find('.camera-thumbnail-name');
                if (image && nameInput) {
                    if ($.common.isEmpty(image.attr("src"))) {
                        errorMsg = "图片数据获取失败，图片自动删除。";
                        $(this).remove();
                        canSubmit = false;
                        return false;
                    } else {
                        imageObj.data = image.attr("src");
                        if ($.common.isEmpty(nameInput.val())) {
                            errorMsg = "请输入照片文件名称。";
                            nameInput.addClass("error");
                            nameInput.focus();
                            canSubmit = false;
                            return false;
                        } else {
                            var reg = new RegExp('[\\/:*?"<>|]');
                            if (reg.test(nameInput.val())) {
                                errorMsg = "文件名称中含有非法字符，请重新输入。";
                                nameInput.addClass("error");
                                nameInput.focus();
                                canSubmit = false;
                                return false;
                            } else {
                                imageObj.name = nameInput.val();
                            }
                        }
                    }
                }
                imageArray.push(imageObj);
            });
            if (canSubmit === true) {
                var data = [];
                data.push({"name": "imageArray", "value": JSON.stringify(imageArray)});
                $.operate.saveOnlyCallback('${ctx}/common/upload/imageBase64', data, window.parent.filesUploadCallBack);

            } else {
                $.modal.msgWarning(errorMsg);
            }
        } else {
            $.modal.msgWarning("请拍摄照片后再提交。");
        }
    }
</script>
</body>
</html>