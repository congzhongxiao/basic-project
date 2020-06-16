/**
 *leeImageUploader
 *封装百度的webuploader插件应用于本系统
 *
 * @author: lee
 * @date:2020-04-23
 * MIT License
 */
(function ($) {
    var pluginName = "leeImageUploader",
        defaults = {
            title: '图片上传',
            multiple: true,//是否多选
            idName: '',//存放id的隐藏域
            urlName: '',//存放url的隐藏域
            uploadUrl: '',
            thumb_width: 110,//缩略图宽度
            thumb_height: 90,//缩略图高度
            max: 5,//最大上传个数
            fileSize: 2,//默认单个文件大小限制，单位M
            existFiles: ''
        };

    function Plugin(element, options) {
        this.element = $(element);
        this.settings = $.extend({}, defaults, options);
        this._name = pluginName;
        this._fileList = $('<div class="image-uploader uploader-list fileList"></div>');
        this._pick = $('<div class="filePicker"><span>' + this.settings.title + '</span></div>');
        this.init();
    }

    Plugin.prototype = {
        init: function () {
            var _this = this;
            _this._fileList.append(_this._pick);
            _this.element.append(_this._fileList);
            var uploader = WebUploader.create({
                auto: true,
                swf: '/static/plugins/webuploader/Uploader.swf',
                server: _this.settings.uploadUrl,
                pick: {
                    id: _this._pick,
                    multiple: _this.settings.multiple
                },
                duplicate: true,
                fileSingleSizeLimit: _this.settings.fileSize * 1024 * 1024, //  单个文件大小
                fileNumLimit: _this.settings.max, // 限制上传个数
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*' //修改这行
                },
                thumb: {
                    width: _this.element.thumb_width,
                    height: _this.element.thumb_height,
                    // 图片质量，只有type为`image/jpeg`的时候才有效。
                    quality: 100,
                    // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                    allowMagnify: true,
                    // 是否允许裁剪。
                    crop: true,
                    // 为空的话则保留原有图片格式。
                    // 否则强制转换成指定的类型。
                    type: 'image/jpeg'
                }
            });
            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var itemBox = $('<div id="' + file.id + '" class="file-item">');
                var img = $('<img>');
                var itemPanel = $('<div class = "file-panel">');
                var remove = $('<span class = "remove" title="删除">删除<i class="fa fa-trash"></i></span>');
                itemPanel.append(remove);
                itemBox.append(img).append(itemPanel);
                _this._fileList.prepend(itemBox);
                remove.click(function () {
                    uploader.removeFile(file, true);
                    itemBox.remove();
                    _this._pick.css("display","inline-block");
                });
                // // 创建缩略图
                // uploader.makeThumb(file, function (error, src) {
                //     console.info(src);
                //     if (error) {
                //         img.replaceWith('<span>不能预览</span>');
                //         return;
                //     }
                //     img.attr('src', src);
                // }, _this.element.thumb_width, _this.element.thumb_height);
                if (_this._fileList.find('.file-item').length >= _this.settings.max) {
                    _this._pick.hide();
                    if (_this._fileList.find('.file-item').length >= (_this.settings.max + 1)) {
                        uploader.removeFile(file, true);
                        _this._fileList.find('.file-item').last().remove();
                    }
                } else {
                    _this._pick.css("display","inline-block");
                }
            });
            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var fileItem = _this._fileList.find('#' + file.id),
                    progress = fileItem.find('.progress');
                // 避免重复创建
                if (progress.length) {
                    progress.remove();
                }
                progress = $('<p class="progress progress-mini">');
                var progressbar = $('<span class="progress-bar progress-bar-danger">');
                progress.append(progressbar);
                fileItem.append(progress);
                progressbar.css('width', percentage * 100 + '%');
            });

            uploader.on('uploadSuccess', function (file, response) {
                var fileItem = _this._fileList.find('#' + file.id);
                var img = fileItem.find('img');
                if (response.success) {//服务端返回结果
                    var fileUrl = response.data.url;
                    img.attr('src', fileUrl);
                    if (_this.settings.idName != '') {
                        fileItem.append($('<input type="hidden" name="' + _this.settings.idName + '" value="' + response.data.id + '">'));
                    }
                    if (_this.settings.urlName != '') {
                        fileItem.append($('<input type="hidden" name="' + _this.settings.urlName + '" value="' + response.data.url + '">'));
                    }
                } else {
                    layer.msg(response.message);
                    var error = fileItem.find('div.error');
                    // 避免重复创建
                    if (!error.length) {
                        error = $('<div class="error"></div>').appendTo(fileItem);
                    }
                    error.html('上传失败');
                }
            });
            // 文件上传失败，显示上传出错。
            uploader.on('uploadError', function (file) {
                var fileItem = _this._fileList.find('#' + file.id);
                var error = fileItem.find('div.error');
                // 避免重复创建
                if (!error.length) {
                    error = $('<div class="error"></div>').appendTo(fileItem);
                }
                error.html('上传失败');
            });
            uploader.on('error', function (code) {
                switch (code) {
                    case "Q_EXCEED_NUM_LIMIT":
                        layer.msg("最多只能上传 " + _this.settings.max + "张图片");
                        break;
                    case "Q_TYPE_DENIED":
                        layer.msg("请上传jpg,jpeg,png类型的图片文件");
                        break;
                    case "F_EXCEED_SIZE":
                        layer.msg("上传图片超过限制大小,限制最大" + _this.settings.fileSize + "M");
                        break;
                    default:
                        layer.msg("文件上传错误，错误代码：" + code);
                }

            });
            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on('uploadComplete', function (file) {
                var fileItem = _this._fileList.find('#' + file.id);
                fileItem.find('.progress').remove();
            });

            if (_this.settings.existFiles && _this.settings.existFiles.length > 0) {
                $.each(_this.settings.existFiles, function (index, item) {
                    if (item && item != '' && item.url != '') {
                        var obj = new Blob(["abc"], {type: 'image/jpeg'});
                        var existFile = new WebUploader.Lib.File(WebUploader.guid('exist_'), obj);
                        var file = new WebUploader.File(existFile);
                        file.setStatus('complete');
                        uploader.addFiles(file);
                        var fileItem = _this._fileList.find('#' + file.id);
                        if (fileItem.find("img")) {
                            fileItem.find("img").attr("src", item.url);
                        }
                        if (_this.settings.idName != '') {
                            fileItem.append($('<input type="hidden" name="' + _this.settings.idName + '" value="' + item.id + '">'));
                        }
                        if (_this.settings.urlName != '') {
                            fileItem.append($('<input type="hidden" name="' + _this.settings.urlName + '" value="' + item.url + '">'));
                        }
                    }
                });
            }
        }
    };

    $.fn[pluginName] = function (options) {
        this.each(function () {
            var el = $(this);
            if (el.data(pluginName)) {
                el.data(pluginName).remove();
            }
            el.data(pluginName, new Plugin(this, options));
        });
        return this;
    };
})(jQuery);

