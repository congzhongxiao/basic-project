/**
 *leeFileUploader
 *封装百度的webuploader插件应用于本系统
 *
 * @author: lee
 * @date:2020-04-23
 * MIT License
 */
(function ($) {
    var pluginName = "leeFileUploader",
        defaults = {
            title: '上传文件',
            multiple: true,//是否多选
            field: '',//存放字段的隐藏域
            uploadUrl: '',
            downloadUrl: '',//点击下载路径
            accept: null,
            max: 5,//最大上传个数
            fileSize: 500,//默认单个文件大小限制，单位M
            existFiles: ''
        };

    function Plugin(element, options) {
        this.element = $(element);
        this.settings = $.extend({}, defaults, options);
        this._name = pluginName;
        this._fileList = $('<div class="file-uploader uploader-list fileList"></div>');
        this._pick = $('<div class="filePicker"><span>' + this.settings.title + '</span></div>');
        this.init();
    }

    Plugin.prototype = {
        init: function () {
            var _this = this;
            _this._fileList.append(_this._pick);
            _this.element.append(_this._fileList);
            if (_this.settings.max == 1) {
                _this.settings.multiple = false;
            }
            var accept = _this.settings.accept;
            if (accept == null) {
                accept = {
                    title: 'Files',
                    extensions: '*',
                };
            }
            var uploader = WebUploader.create({
                auto: true,
                swf: '/static/plugins/webuploader/Uploader.swf',
                server: _this.settings.uploadUrl,
                pick: {
                    id: _this._pick,
                    multiple: _this.settings.multiple
                },
                accept: accept,
                duplicate: true,
                fileSingleSizeLimit: _this.settings.fileSize * 1024 * 1024, //  单个文件大小
                fileNumLimit: _this.settings.max // 限制上传个数
            });
            // 当有文件添加进来的时候
            uploader.on('fileQueued', function (file) {
                var itemBox = $('<div id="' + file.id + '" class="file-item">');
                var item = $('<div class="file-panel">');
                var fileLink = '';
                if (file.url && $.common.isNotEmpty(file.url) && $.common.isNotEmpty(_this.settings.downloadUrl)) {
                    fileLink = '<a class="file-link" data-name="' + file.name + '" data-url="' + file.url + '" '
                        + 'href="' + _this.settings.downloadUrl + '?path=' + file.url + '&fileName=' + file.name + '">' + file.name + '</a>';
                } else {
                    fileLink = '<a class="file-link" href="javascript:void(0)">' + file.name + '</a>';
                }

                item.append('<div class="file-name" title="' + file.name + '">' +
                    fileLink + '</div><span class="file-upload-progress" ></span>');
                var remove = $('<div class = "remove" title="删除"><i class="fa fa-trash"></i></div>');
                item.append(remove);
                itemBox.append(item);
                _this._fileList.prepend(itemBox);


                remove.click(function () {
                    uploader.removeFile(file, true);
                    itemBox.remove();
                    _this._pick.css("display", "inline-block");
                });
                if (_this._fileList.find('.file-item').length >= _this.settings.max) {
                    _this._pick.hide();
                    if (_this._fileList.find('.file-item').length >= (_this.settings.max + 1)) {
                        uploader.removeFile(file, true);
                        _this._fileList.find('.file-item').last().remove();
                    }
                } else {
                    _this._pick.css("display", "inline-block");
                }
            });
            // 文件上传过程中创建进度条实时显示。
            uploader.on('uploadProgress', function (file, percentage) {
                var fileItem = _this._fileList.find('#' + file.id);
                var progress = fileItem.find('.file-upload-progress');
                progress.text('上传中：' + parseInt(percentage * 100) + '%');
            });
            uploader.on('uploadSuccess', function (file, response) {
                var fileItem = _this._fileList.find('#' + file.id);
                var panel = fileItem.find('.file-panel');
                if (response.success) {//服务端返回结果
                    var fileLink = fileItem.find('.file-link');
                    var url = response.data.url;
                    var name = response.data.name;
                    fileLink.attr("data-name", name);
                    fileLink.attr("data-url", url);
                    fileLink.attr("href", _this.settings.downloadUrl + '?path=' + url + '&fileName=' + name);
                    if (_this.settings.field != '') {
                        fileItem.append($('<input type="hidden" name="' + _this.settings.field + 'Id" value="' + response.data.id + '">'));
                        fileItem.append($('<input type="hidden" name="' + _this.settings.field + 'Name" value="' + response.data.name + '">'));
                        fileItem.append($('<input type="hidden" name="' + _this.settings.field + '" value="' + response.data.url + '">'));
                    }
                    var progress = fileItem.find('.file-upload-progress');
                    progress.text("上传成功");
                } else {
                    layer.msg(response.message);
                    var error = fileItem.find('span.error');
                    // 避免重复创建
                    if (!error.length) {
                        error = $('<span class="error"></span>').appendTo(panel);
                    }
                    error.html('上传失败');
                }
            });
            // 文件上传失败，显示上传出错。
            uploader.on('uploadError', function (file) {
                var fileItem = _this._fileList.find('#' + file.id);
                var panel = fileItem.find('.file-panel');
                var error = fileItem.find('span.error');
                // 避免重复创建
                if (!error.length) {
                    error = $('<span class="error"></span>').appendTo(panel);
                }
                error.html('上传失败');
            });
            uploader.on('error', function (code) {
                switch (code) {
                    case "Q_EXCEED_NUM_LIMIT":
                        layer.msg("最多只能上传 " + _this.settings.max + "个文件", {icon: 2});
                        break;
                    case "Q_TYPE_DENIED":
                        var extStr = _this.settings.accept.extensions;
                        var msg = "文件内容为空或类型不支持";
                        if (extStr && $.common.isNotEmpty(extStr)) {
                            msg += ',当前只支持后缀名：' + extStr;
                        }
                        layer.msg(msg, {icon: 2});
                        break;
                    case "F_EXCEED_SIZE":
                        layer.msg("上传文件超过限制大小,限制最大" + _this.settings.fileSize + "M", {icon: 2});
                        break;
                    default:
                        layer.msg("文件上传错误，错误代码：" + code, {icon: 2});
                }

            });
            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on('uploadComplete', function (file) {
            });

            if (_this.settings.existFiles && _this.settings.existFiles.length > 0) {
                $.each(_this.settings.existFiles, function (index, item) {
                    if (item && item != '' && item.url != '') {
                        var obj = new Blob(["abc"], {type: ''});
                        var existFile = new WebUploader.Lib.File(WebUploader.guid('exist_'), obj);
                        var file = new WebUploader.File(existFile);
                        file.setStatus('complete');
                        file.name = item.name;
                        file.url = item.url;
                        uploader.addFiles(file);
                        var fileItem = _this._fileList.find('#' + file.id);
                        if (_this.settings.field != '') {
                            fileItem.append($('<input type="hidden" name="' + _this.settings.field + 'Id" value="' + item.id + '">'));
                            fileItem.append($('<input type="hidden" name="' + _this.settings.field + 'Name" value="' + item.name + '">'));
                            fileItem.append($('<input type="hidden" name="' + _this.settings.field + '" value="' + item.url + '">'));
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

