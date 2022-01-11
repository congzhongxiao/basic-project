window.onload = function () {
    // 加载视频图像
    $("#camera_view_image").attr("src", "http://127.0.0.1:38088/video=stream&camidx=0");
}

function ajaxPost(url, data, success) {
    var config = {
        url: url,
        type: 'post',
        data: data,
        success: success,
        complete: function (XMLHttpRequest, textStatus) {
            if (textStatus == "parsererror" || textStatus == "error") {
                $.modal.msgWarning("获取高拍仪图像失败，请勿频繁操作。");
            }
        }
    };
    $.ajax(config);
}

function rotateLeft() {
    ajaxPost("http://127.0.0.1:38088/video=rotate", JSON.stringify(
        {
            "camidx": "0",
            "rotate": "90"
        }
    ), function (res) {
    });
}

function rotateRight() {

    ajaxPost("http://127.0.0.1:38088/video=rotate", JSON.stringify(
        {
            "camidx": "0",
            "rotate": "270"
        }
    ), function (res) {
    });
}

// 拍照，本示例为拍照获取base64数据
//type 0:拍照上传 1拍照上传生成pdf
function scanCamera(type) {
    var dataConfig = {
        "filepath": "base64",
        "rotate": "0",
        "deskew": "0",
        "camidx": "0",
        "ColorMode": "0",
        "quality": "0"
    }

    ajaxPost("http://127.0.0.1:38088/video=grabimage", JSON.stringify(dataConfig), function (res) {
        if ($.common.isEmpty(res.photoBase64)) {
            $.modal.msgWarning("请等待高拍仪加载完成后再点击拍照。");
        } else {
            $.modal.msgSuccess("拍摄成功");
            if (type === 0) {
                addImage(res.photoBase64);
            } else {
                addPDF(res.photoBase64);
            }
        }
    });
}

function addPDF(imgData) {
    var panel = $("#camera_thumbnail");
    var thumbnailBox = $("<div class='camera-thumbnail-box'>");
    var imageSpan = $('<div class="camera-thumbnail-img-span" title="点击图片预览">');
    var thumbnailImage = document.createElement('img');
    thumbnailImage.src = "data:image/jpg;base64," + imgData;
    imageSpan.append(thumbnailImage);
    var removeBtn = $('<div class="camera-thumbnail-remove" title="点击删除图片">删除</div>');
    imageSpan.append(removeBtn);
    thumbnailBox.append(imageSpan);
    panel.append(thumbnailBox);
    $(thumbnailImage).bind("click", function () {
        const newWin = window.open('', '_blank')
        newWin.document.write('<body style="background: #0e0e0e;margin: 0;text-align: center;">');
        newWin.document.write('<img src="' + this.src + '" style="max-width: 100%;max-height: 100%">');
        newWin.document.write('</body>');
        newWin.document.title = '图片预览'
        newWin.document.close()
    });
    removeBtn.bind("click", function () {
        $(this).parents(".camera-thumbnail-box").remove();
    });
}

function addImage(imgData) {
    var panel = $("#camera_thumbnail");
    var thumbnailBox = $("<div class='camera-thumbnail-box'>");
    var imageSpan = $('<div class="camera-thumbnail-img-span" title="点击图片预览">');
    var thumbnailImage = document.createElement('img');
    thumbnailImage.src = "data:image/jpg;base64," + imgData;
    imageSpan.append(thumbnailImage);
    var removeBtn = $('<div class="camera-thumbnail-remove" title="点击删除图片">删除</div>');
    imageSpan.append(removeBtn);
    thumbnailBox.append(imageSpan);
    var inputBox = $('<div class="camera-thumbnail-input">').append($('<input type="text" class="camera-thumbnail-name">'));
    thumbnailBox.append(inputBox);
    panel.append(thumbnailBox);
    $(thumbnailImage).bind("click", function () {
        const newWin = window.open('', '_blank')
        newWin.document.write('<body style="background: #0e0e0e;margin: 0;text-align: center;">');
        newWin.document.write('<img src="' + this.src + '" style="max-width: 100%;max-height: 100%">');
        newWin.document.write('</body>');
        newWin.document.title = '图片预览'
        newWin.document.close()
    });
    removeBtn.bind("click", function () {
        $(this).parents(".camera-thumbnail-box").remove();
    });
}
