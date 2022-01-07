$(function () {

    //  layer扩展皮肤
    if (window.layer !== undefined) {
        layer.config({
            extend: 'moon/style.css',
            skin: 'layer-ext-moon'
        });
    }

    // select2复选框事件绑定
    if ($.fn.select2 !== undefined) {
        $.fn.select2.defaults.set("theme", "bootstrap");
        $("select.form-control:not(.noselect2)").each(function () {
            $(this).select2().on("change", function () {
                $(this).valid();
            })
        })
    }

    //消息提示初始化方法
    if ($.fn.tooltip != undefined) {
        $("[data-toggle='tooltip']").tooltip();
    }

    // laydate 时间控件绑定
    if ($(".select-time").length > 0) {
        layui.use('laydate', function () {
            var laydate = layui.laydate;
            var startDate = laydate.render({
                elem: '#startTime',
                max: $('#endTime').val(),
                theme: 'molv',
                trigger: 'click',
                done: function (value, date) {
                    // 结束时间大于开始时间
                    if (value !== '') {
                        endDate.config.min.year = date.year;
                        endDate.config.min.month = date.month - 1;
                        endDate.config.min.date = date.date;
                    } else {
                        endDate.config.min.year = '';
                        endDate.config.min.month = '';
                        endDate.config.min.date = '';
                    }
                }
            });
            var endDate = laydate.render({
                elem: '#endTime',
                min: $('#startTime').val(),
                theme: 'molv',
                trigger: 'click',
                done: function (value, date) {
                    // 开始时间小于结束时间
                    if (value !== '') {
                        startDate.config.max.year = date.year;
                        startDate.config.max.month = date.month - 1;
                        startDate.config.max.date = date.date;
                    } else {
                        startDate.config.max.year = '2099';
                        startDate.config.max.month = '12';
                        startDate.config.max.date = '31';
                    }
                }
            });
        });
    }

    /** 自定义表单组装html **/
    if ($(".custom-form-html").length > 0) {
        $(".custom-form-html").each(function () {
            var _this = $(this);
            var code = _this.data("code");
            var ue = UE.getEditor(code);
            ue.ready(function () {
                ue.setHeight(300);
                var toolDiv = $('<div class="ueditor-tool"></div>');
                var imageLocalBtn = $('<a class="btn btn-success btn-xs" href="javascript:void(0);">远程图片本地化</a>');
                var cleanUrlBtn = $('<a class="btn btn-success btn-xs" href="javascript:void(0);">清除非本站链接</a>');
                imageLocalBtn.click(function () {
                    $.modal.loading("正在本地化图片，请稍后...");
                    var config = {
                        url: ctx + '/common/imageLocal',
                        type: 'post',
                        data: {"content": ue.getContent()},
                        dataType: 'json',
                        cache: false,
                        success: function (result) {
                            if (result.success) {
                                ue.setContent(result.data.content);
                                $.modal.msgSuccess(result.message);
                            }
                            $.modal.closeLoading();
                        }
                    };
                    $.common.sendAjax(config);
                });
                cleanUrlBtn.click(function () {
                    $.modal.loading("正在清理外链，请稍后...");
                    var config = {
                        url: ctx + '/common/cleanUrl',
                        type: 'post',
                        data: {"content": ue.getContent()},
                        dataType: 'json',
                        cache: false,
                        success: function (result) {
                            if (result.success) {
                                ue.setContent(result.data.content);
                                $.modal.msgSuccess(result.message);
                            }
                            $.modal.closeLoading();
                        }
                    };
                    $.common.sendAjax(config);
                });
                toolDiv.append(imageLocalBtn);
                toolDiv.append(cleanUrlBtn);
                _this.append(toolDiv);
            });
        });
    }
    // laydate time-input 时间控件绑定
    if ($(".time-input").length > 0) {
        layui.use('laydate', function () {
            var com = layui.laydate;
            $(".time-input").each(function (index, item) {
                var time = $(item);
                // 控制控件外观
                var type = time.attr("data-type") || 'date';
                // 控制回显格式
                var format = time.attr("data-format") || 'yyyy-MM-dd';
                // 控制日期控件按钮
                var buttons = time.attr("data-btn") || 'clear|now|confirm', newBtnArr = [];
                // 日期控件选择完成后回调处理
                var callback = time.attr("data-callback") || {};
                if (buttons) {
                    if (buttons.indexOf("|") > 0) {
                        var btnArr = buttons.split("|"), btnLen = btnArr.length;
                        for (var j = 0; j < btnLen; j++) {
                            if ("clear" === btnArr[j] || "now" === btnArr[j] || "confirm" === btnArr[j]) {
                                newBtnArr.push(btnArr[j]);
                            }
                        }
                    } else {
                        if ("clear" === buttons || "now" === buttons || "confirm" === buttons) {
                            newBtnArr.push(buttons);
                        }
                    }
                } else {
                    newBtnArr = ['clear', 'now', 'confirm'];
                }
                com.render({
                    elem: item,
                    theme: 'molv',
                    trigger: 'click',
                    type: type,
                    format: format,
                    btns: newBtnArr,
                    done: function (value, data) {
                        try {
                            time.val(value);
                            $(time).valid();
                        } catch (e) {
                        }
                        if (typeof window[callback] != 'undefined'
                            && window[callback] instanceof Function) {
                            window[callback](value, data);
                        }
                    }
                });
            });
        });
    }
    // tree 关键字搜索绑定
    if ($("#keyword").length > 0) {
        $("#keyword").bind("focus", function focusKey(e) {
            if ($("#keyword").hasClass("empty")) {
                $("#keyword").removeClass("empty");
            }
        }).bind("blur", function blurKey(e) {
            if ($("#keyword").val() === "") {
                $("#keyword").addClass("empty");
            }
            $.tree.searchNode(e);
        }).bind("input propertychange", $.tree.searchNode);
    }
    // tree表格树 展开/折叠
    var expandFlag;
    $("#expandAllBtn").click(function () {
        var dataExpand = $.common.isEmpty(table.options.expandAll) ? true : table.options.expandAll;
        expandFlag = $.common.isEmpty(expandFlag) ? dataExpand : expandFlag;
        if (!expandFlag) {
            $.bttTable.bootstrapTreeTable('expandAll');
        } else {
            $.bttTable.bootstrapTreeTable('collapseAll');
        }
        expandFlag = expandFlag ? false : true;
    });
    /**
     * 图片上传插件组合，页面调用格式：
     * <div class="lee-image-upload" data-field="" data-size="1" >
     *   <input type="hidden" class="exist-image" value="" data-id="">
     * </div>
     * 参数说明：
     *  data-field:必须，field值自动扩展页面隐藏域，{field}:上传后的url,{field}Id:上传后的id值。
     *  data-size:非必须，默认值为1，上传数量限制；设置为大于1时，自动放开多选限制。
     *  exist-image：可多个，放入后，页面自动加载数据；value:存放已存在图片的url,data-id:存放已上传图片的id
     *
     */
    if ($.fn.leeImageUploader != undefined) {
        $(".lee-image-upload").each(function () {
            var field = $(this).data("field") ? $(this).data("field") : '';
            var size = $(this).data("size") ? $(this).data("size") : 1;
            var existArray = [];
            $(this).find(".exist-image").each(function () {
                var id = $(this).data("id");
                var image = new Object();
                if ($.common.isNotUndefined(id) && $.common.isNotEmpty(id)) {
                    image.id = id;
                }
                image.url = $(this).val();
                existArray.push(image);
            });
            $(this).leeImageUploader({
                uploadUrl: ctx + '/common/upload/image',
                max: size,
                field: field,
                existFiles: existArray
            });
        });
    }

    /**
     * 文件上传插件组合，页面调用格式：
     * <div class="lee-file-upload" data-field="" data-size="1" data-type="">
     *   <input type="hidden" class="exist-file" value="${file.url}" data-id="${file.id}" data-name="${file.name}">
     * </div>
     * 参数说明：
     *  data-field:必须，field值自动扩展页面隐藏域，{field}:上传后的url,{field}Id:上传后的id值;{field}Name:上传文件名。
     *  data-size:非必须，默认值为1，上传数量限制；设置为大于1时，自动放开多选限制。
     *  data-type: 非必填，file/video,默认值为file,当设置为file时，不限制类型，当设置为video时，上传必须为指定文件后缀，可扩展。
     *  exist-file：可多个，放入后，页面自动加载数据；value:存放已存在图片的url,data-id:存放已上传文件的id，data-name:存放已上传文件名称。
     *
     */
    if ($.fn.leeFileUploader != undefined) {
        $(".lee-file-upload").each(function () {
            var field = $(this).data("field") ? $(this).data("field") : '';
            var size = $(this).data("size") ? $(this).data("size") : 1;
            var type = $(this).data("type") ? $(this).data("type") : 'file';
            var accept = {}
            if (type == 'video') {
                accept = {
                    title: 'Videos',
                    extensions: 'swf,flv,mp3,mp4,wav,wma,wmv,avi,mpg,rm,rmvb'
                }
            }
            var existArray = [];
            $(this).find(".exist-file").each(function () {
                var url = $(this).val();
                var fileName = $(this).data("name");
                var id = $(this).data("id");
                var file = {};
                if ($.common.isNotUndefined(url) && $.common.isNotEmpty(url)) {
                    file.url = url;
                }
                if ($.common.isNotUndefined(fileName) && $.common.isNotEmpty(fileName)) {
                    file.name = fileName;
                }
                if ($.common.isNotUndefined(id) && $.common.isNotEmpty(id)) {
                    file.id = id;
                }
                existArray.push(file);
            });
            $(this).leeFileUploader({
                uploadUrl: ctx + '/common/upload/file',
                downloadUrl: ctx + '/common/download/file',
                max: size,
                field: field,
                accept: accept,
                existFiles: existArray
            });
        });
    }
    // 按下ESC按钮关闭弹层
    $('body', document).on('keyup', function (e) {
        if (e.which === 27) {
            $.modal.closeAll();
        }
    });
});

/** 刷新选项卡 */
var refreshItem = function () {
    var topWindow = $(window.parent.document);
    var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-id');
    var target = $('.index_iframe[data-id="' + currentId + '"]', topWindow);
    var url = target.attr('src');
    target.attr('src', url).ready();
}

/** 关闭选项卡 */
var closeItem = function (dataId) {
    var topWindow = $(window.parent.document);
    if ($.common.isNotEmpty(dataId)) {
        window.parent.$.modal.closeLoading();
        // 根据dataId关闭指定选项卡
        $('.menuTab[data-id="' + dataId + '"]', topWindow).remove();
        // 移除相应tab对应的内容区
        $('.content-main .index_iframe[data-id="' + dataId + '"]', topWindow).remove();
        return;
    }
    var panelUrl = window.frameElement.getAttribute('data-panel');
    $('.page-tabs-content .active i', topWindow).click();
    if ($.common.isNotEmpty(panelUrl)) {
        $('.menuTab[data-id="' + panelUrl + '"]', topWindow).addClass('active').siblings('.menuTab').removeClass('active');
        $('.content-main .index_iframe', topWindow).each(function () {
            if ($(this).data('id') == panelUrl) {
                // $(this).show().siblings('.index_iframe').hide();
                hideIframe(this);
                return false;
            }
        });
    }
}

/** 创建选项卡 */
function createMenuItem(dataUrl, menuName) {
    var panelUrl = window.frameElement.getAttribute('data-id');
    dataIndex = $.common.random(1, 100),
        flag = true;
    if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;
    var topWindow = $(window.parent.document);
    // 选项卡菜单已存在
    $('.menuTab', topWindow).each(function () {
        if ($(this).data('id') == dataUrl) {
            if (!$(this).hasClass('active')) {
                $(this).addClass('active').siblings('.menuTab').removeClass('active');
                $('.page-tabs-content').animate({marginLeft: ""}, "fast");
                // 显示tab对应的内容区
                $('.content-main .index_iframe', topWindow).each(function () {
                    if ($(this).data('id') == dataUrl) {
                        // $(this).show().siblings('.index_iframe').hide();
                        hideIframe(this);
                        return false;
                    }
                });
            }
            flag = false;
            return false;
        }
    });
    // 选项卡菜单不存在
    if (flag) {
        var str = '<a href="javascript:;" class="active menuTab" data-id="' + dataUrl + '" data-panel="' + panelUrl + '">' + menuName + ' <i class="fa fa-times"></i></a>';
        $('.menuTab', topWindow).removeClass('active');

        // 添加选项卡对应的iframe
        var str1 = '<iframe class="index_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" data-panel="' + panelUrl + '" seamless></iframe>';
        $('.content-main', topWindow).find('iframe.index_iframe').css("visibility", "hidden").parents('.content-main').append(str1);

        window.parent.$.modal.loading("数据加载中，请稍后...");
        $('.content-main iframe:visible', topWindow).load(function () {
            window.parent.$.modal.closeLoading();
        });

        // 添加选项卡
        $('.menuTabs .page-tabs-content', topWindow).append(str);
    }
    return false;
}


function hideIframe(iframe) {
    $(iframe).css("visibility", "visible");
    $(iframe).siblings('.index_iframe').each(function () {
        $(this).css("visibility", "hidden");
    });
}

