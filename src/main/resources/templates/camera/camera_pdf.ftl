<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="生成PDF上传"/>
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
        <span><button class="btn btn-sm btn-primary" onclick="rotateLeft()"><i class="fa fa-fw fa-rotate-left"></i>向左旋转
        </button>
        <button class="btn btn-sm btn-primary" onclick="rotateRight()"><i class="fa fa-fw fa-rotate-right"></i>向右旋转
        </button>
        <button class="btn btn-sm btn-success" onclick="scanCamera(1)"><i class="fa fa-fw fa-camera"></i>添加照片</button>
        </span>
        <span><label>PDF文件名：</label><input type="text" class="camera-pdf-name" id="pdfName"></span>
        <span class="help-inline text-danger">**PDF文件名称不需要输入后缀名。</span>
    </div>

</div>

<@js_common/>
<script src="${ctx}/static/plugins/webCamera/camera.js"></script>
<script>
    function submitHandler() {
        var box = $("#camera_thumbnail").find(".camera-thumbnail-box");
        var pdfName = $("#pdfName");
        if(pdfName && $.common.isNotEmpty(pdfName.val())){
            var reg = new RegExp('[\\/:*?"<>|]');
            if (reg.test(pdfName.val())) {
                $.modal.msgWarning("文件名称中含有非法字符，请重新输入。");
                pdfName.addClass("error");
                pdfName.focus();
                return false;
            }
            var imageArray = [];
            if (box.length > 0) {
                var canSubmit = true;
                var errorMsg = "";
                box.each(function () {
                    var imageObj = {};
                    var image = $(this).find('img');
                    if (image) {
                        if ($.common.isEmpty(image.attr("src"))) {
                            errorMsg = "图片数据获取失败，图片自动删除。";
                            $(this).remove();
                            canSubmit = false;
                            return false;
                        } else {
                            imageObj.data = image.attr("src");
                        }
                    }
                    imageArray.push(imageObj);
                });
                if (canSubmit === true) {
                    var data = [];
                    data.push({"name": "imageArray", "value": JSON.stringify(imageArray)});
                    data.push({"name": "pdfName", "value": pdfName.val()});
                    $.operate.saveOnlyCallback('${ctx}/common/upload/imageBase64Pdf', data, window.parent.filesUploadCallBack);
                } else {
                    $.modal.msgWarning(errorMsg);
                }
            } else {
                $.modal.msgWarning("请拍摄照片后再提交。");
            }
        } else {
            $.modal.msgWarning("请输入PDF文件名称。");
            pdfName.addClass("error");
            pdfName.focus();

        }
    }
</script>
</body>
</html>