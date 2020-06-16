/**
 * 固定用法
 * 显示div用rich_text_box
 * 对应隐藏的input控件用 rich_text_input
 */
$(function () {
    if($('#rich_text_box').length > 0 && $("#rich_text_input").length > 0) {
        try{
            var editHandle = window.wangEditor;
            var editor = new editHandle('#rich_text_box');
            editor.customConfig.pasteFilterStyle = false;
            editor.customConfig.pasteIgnoreImg = false;
            editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
            editor.customConfig.uploadImgMaxLength = 1;
            editor.customConfig.uploadImgServer = '/admin/common/upload/image';
            editor.customConfig.uploadFileName = 'image';
            editor.customConfig.customAlert = function(info){
                $.modal.alertError(info);
            };
            editor.customConfig.uploadImgHooks = {
                customInsert: function (insertImg, result, editor) {
                    if(result.success) {
                        insertImg(result.data);
                    } else {
                        $.modal.alertError(result.message);
                    }
                }
            };
            editor.customConfig.onchange = function (html) {
                $("#rich_text_input").val(html);
            }
            editor.create();
            editor.txt.html($('#rich_text_input').val());
        } catch (e) {
        }
    }
});