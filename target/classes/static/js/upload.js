$(function () {
    $(".image-upload-btn").click(function () {
        var parent = $(this).parents(".image-upload");
        var fileBtn = parent.find(".image-file");
        fileBtn.attr('accept','image/jpg,image/jpeg,image/gif,image/png');
        var imgBox = parent.find(".pre-image img");
        var valueBox = parent.find(".image-upload-value");
        fileBtn.change(function () {
            var src = $(this).val();
            if (src == '') {
                return
            }
            var arr = ['jpg','gif','jpeg','png'];
            var lastName = src.toLowerCase().split('.').splice(-1);
            var isImage = false;
            for(var i = 0; i < arr.length; i++) {
                if(lastName == arr[i]) {
                    isImage = true;
                }
            }
            if(!isImage) {
                $.modal.alertError("上传文件必须是图片类型");
                return;
            }
            var form  = new FormData();
            var file = $(this)[0].files[0];
            if(file.size > 3*1024*1024){
                $.modal.alertError("文件大小超过3M");
                return;
            }
            form.append("image",file);
            $.ajax({
                url:"/admin/common/upload/image",
                type:"post",
                data: form,
                contentType: false,
                processData: false,
                success: function(data) {
                    if(data.success) {
                        imgBox.attr("src",data.data);
                        valueBox.val(data.data);
                        $.modal.msgSuccess("图片上传完成");
                    } else {
                        $.modal.alertError(data.message);
                    }
                },
                error:function(data) {
                    $.modal.alertError("图片上传失败");
                }
            });
        });

        fileBtn.click();
    });
});