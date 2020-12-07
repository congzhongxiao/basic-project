/**
 * License:MIT
 * 下拉树插件
 * selectTree
 * author:Lee
 * date:2020-12-05
 * 示例Html:
 * <select class="select-tree" data-placeholder="请选择组织架构" id="org" name="org" data-msg="请选择组织架构">
     <option value=""></option>
     <option value="1" data-pid="0" >1</option>
     <option value="12" data-pid="1">12</option>
     <option value="123" data-pid="12" >123</option>
     <option value="13" data-pid="1">13</option>
     <option value="131" data-pid="13">131</option>
     <option value="132" data-pid="13" selected>132</option>
     <option value="133" data-pid="13">133</option>
     <option value="134" data-pid="13">134</option>
     <option value="135" data-pid="13">135</option>
     <option value="1341" data-pid="134">1341</option>
     <option value="2" data-pid="0">2</option>
     <option value="3" data-pid="0">3</option>
     <option value="21" data-pid="2">21</option>
    </select>
 示例js:
    $(".select-tree").selectTree({
        expandAll: false,//是否全部展开，如果为tree，expandLevel不生效
        expandLevel: 0//展开层级
    });
 */
(function ($, window, document, undefined) {
    var selectTreePlugin = 'selectTree',
        //定义一个存储数据的数组，用于下面重复选择判断，删除标签,
        defaults = {
            expandAll: true,//是否全部展开，如果为tree，expandLevel不生效
            expandLevel: 0//展开层级
        };
    var SelectTree = function (element, options) {
        this.element = element;
        this.original = $(element);//元select组件
        this.options = $.extend({}, defaults, options);//下拉选项
        this.data = [];//数据集合
        this.treeData = [];//树结构数据集合
        this.container = null;
        this.selectPanel = null;
        this.selectData = null;
        this.init();
        this.initDom();
        this.initPanelEvent();
        this.expandDom();
    }
    SelectTree.prototype = {
        init: function () {
            var _this = this;
            _this.data = _this.loadData();
            _this.treeData = _this.loadTreeData(_this.data);
        }, loadData: function () {
            var _this = this;
            var data = [];
            var options = _this.original.find('option');
            var selectValue = _this.original.val();
            if (options && options.length > 0) {
                $.each(options, function () {
                    var option = $(this);
                    var text = option.text();
                    var id = option.val();
                    var pid = option.data("pid");
                    var optionData = {};
                    if (text && id) {
                        optionData.text = text;
                        optionData.id = id;
                        optionData.pid = pid;
                        if (selectValue && selectValue != '' && selectValue == optionData.id) {
                            _this.selectData = optionData;
                        }
                        data.push(optionData);
                    }
                });
            }
            return data;
        }, loadTreeData: function (data) {
            var rootNode = [];
            $.each(data, function () {
                var pid = this.pid;
                var hasChild = false;
                $.each(data, function () {
                    if (pid == this.id) {
                        hasChild = true;
                    }
                });
                if (!hasChild) {
                    rootNode.push(this);
                }
            });
            for (var i = 0; i < rootNode.length; i++) {
                rootNode[i].level = 0;
                rootNode[i].children = getTree(data, rootNode[i].id, 0);
            }
            return rootNode;
        }, initDom: function () {
            var _this = this;
            var container = $('<div tabindex="0"  class="select-tree-container"></div>');
            var placeholder = _this.original.data("placeholder");
            _this.selectPanel = $('<div class="select-panel"></div>');
            var selectValueBox = $('<div class="select-value"></div>');
            if (_this.selectData && _this.selectData != null) {
                selectValueBox.text(_this.selectData.text);
            } else {
                if (placeholder && placeholder != '') {
                    selectValueBox.text(placeholder);
                } else {
                    selectValueBox.text('请选择');
                }
            }
            _this.selectPanel.append(selectValueBox);

            container.append('<span class="select-tree-arrow"></span>');
            container.append(_this.selectPanel);
            container.append(_this.initTreeDom());
            _this.original.after(container);
            _this.original.hide();
            _this.container = container;
        },
        initTreeDom: function () {//组装树结构
            var treePanel = $('<div class="tree-panel"></div>');
            var paddingValue = 0;
            treePanel.append(this.assembleTreeDom(this.treeData, paddingValue));
            treePanel.on('click', function (e) {
                e.stopPropagation();
            });
            return treePanel;
        },
        initPanelEvent: function () {
            var _this = this;
            _this.selectPanel.on('click', function (e) {

                //其他的容器处理
                if(_this.container.hasClass('open')) {
                    _this.container.removeClass("open");
                    $(".select-tree-container").removeClass('open');
                } else {
                    $(".select-tree-container").removeClass('open');
                    _this.container.addClass("open");
                }
                e.stopPropagation();
            });
            $(document).on('click', function () {
                _this.container.removeClass("open");
            });
        }, assembleTreeDom: function (nodeArr, paddingValue) {
            var _this = this;
            paddingValue = paddingValue + 20;
            var ulDom = '';
            if (nodeArr && nodeArr.length > 0) {
                ulDom = $('<ul class="tree-ul"></ul>');
                for (var i = 0; i < nodeArr.length; i++) {
                    var liData = nodeArr[i];
                    var liDom = $('<li></li>');
                    var optionDom = $('<div class="tree-option" style="padding-left:' + paddingValue + 'px;" ></div>');
                    var arrowBox = $('<span class="tree-option-arrow"></span>');
                    var optionValue = $('<span class="tree-option-value" data-id="' + liData.id + '">' + liData.text + '</span>');
                    optionDom.append(arrowBox);
                    optionDom.append(optionValue);
                    liDom.append(optionDom);
                    optionDom.on('click', function (e) {
                        var selectValue = $(this).find('.tree-option-value').text();
                        var selectId = $(this).find('.tree-option-value').data('id');
                        _this.container.find('.tree-option').removeClass('selected');
                        $(this).addClass('selected');
                        _this.selectPanel.find('.select-value').text(selectValue);
                        _this.original.val(selectId);
                        _this.container.removeClass('open');
                        e.stopPropagation();
                    });
                    if (liData.children && liData.children.length > 0) {
                        arrowBox.append("<b></b>");
                        arrowBox.addClass('open');
                        arrowBox.on('click', function (e) {
                            $(this).toggleClass('open');
                            var childTree = $(this).closest('li').children('.tree-ul');
                            if ($(this).hasClass('open')) {
                                childTree.slideDown('fast');
                            } else {
                                childTree.slideUp('fast');
                            }
                            e.stopPropagation();
                        });
                        liDom.append(_this.assembleTreeDom(liData.children, paddingValue));
                    }
                    ulDom.append(liDom);
                    if (!_this.options.expandAll) {//不是全部展开
                        var showLevel = _this.options.expandLevel;
                        var currentLevel = liData.level;
                        if (currentLevel > showLevel) {
                            arrowBox.removeClass('open');
                            ulDom.hide();
                        } else if (currentLevel == showLevel) {
                            arrowBox.removeClass('open');
                        }
                    }
                    if (_this.selectData && _this.selectData != null) {
                        if (liData.id == _this.selectData.id) {
                            optionDom.addClass('selected');
                        }
                    }
                }
                return ulDom;
            }

        }, expandDom: function () {
            var _this = this;
            var selectDom = _this.container.find(".tree-option.selected");
            if(selectDom && selectDom.length > 0) {
                var parentsDom = selectDom.parents('ul');
                parentsDom.show();
                parentsDom.siblings('.tree-option').find('.tree-option-arrow').addClass('open');
            }
        }
    };

    function getTree(treeData, pid, level) {
        level = level + 1;
        var treeArr = [];
        for (var i = 0; i < treeData.length; i++) {
            var node = treeData[i];
            if (node.pid == pid) {
                node.level = level;
                node.children = getTree(treeData, node.id, level);
                treeArr.push(node);
            }
        }
        return treeArr;
    }


    $.fn[selectTreePlugin] = function (options) {
        var stArray = [];
        this.each(function () {
            if (!$.data(this, 'plugin_' + selectTreePlugin)) {
                $.data(this, 'plugin_' + selectTreePlugin, new SelectTree(this, options));
                stArray.push($(this).data()['plugin_' + selectTreePlugin]);
            }
        });
        if (this.length === 1) {
            return stArray[0];
        } else {
            return stArray;
        }
    }

})(jQuery, window, document);