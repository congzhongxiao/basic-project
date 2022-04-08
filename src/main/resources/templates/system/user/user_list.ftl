<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="用户管理"/>
    <@css_common/>
    <@css_layout/>
    <@css_ztree/>
</head>
<body class="gray-bg">
<div class="ui-layout-west">
    <div class="box box-main">
        <div class="box-header">
            <div class="box-title">
                <i class="fa icon-grid"></i>组织架构
            </div>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" id="btnExpand" title="展开" style="display:none;"><i
                            class="fa fa-chevron-up"></i></button>
                <button type="button" class="btn btn-box-tool" id="btnCollapse" title="折叠"><i
                            class="fa fa-chevron-down"></i></button>
                <button type="button" class="btn btn-box-tool" id="btnRefresh" title="刷新节点"><i
                            class="fa fa-refresh"></i></button>
            </div>
        </div>
        <div class="ui-layout-content">
            <div id="tree" class="ztree"></div>
        </div>
    </div>
</div>
<div class="ui-layout-center">
    <div class="container-div">
        <div class="row">
            <div class="col-sm-12 search-collapse">
                <form id="user-form">
                    <input type="hidden" id="selectOrgId" name="selectOrgId">
                    <div class="select-list">
                        <ul>
                            <li>
                                用户账号：<input type="text" name="username"/>
                            </li>
                            <li>
                                用户姓名：<input type="text" name="nickname"/>
                            </li>
                            <li>
                                手机号码：<input type="text" name="mobile"/>
                            </li>
                            <li>
                                主要职务：
                                <select id="dutyId" name="dutyId"  class="chosen-select form-control" data-msg="请选择主要职务">
                                    <option value="">请选择主要职务</option>
                                    <#list dutyList as duty>
                                        <option value="${duty.id}">${duty.dutyName}</option>
                                    </#list>
                                </select>
                            </li>
                            <li>
                                <a class="btn btn-success btn-rounded btn-sm" onclick="$.table.search()"><i class="fa fa-search"></i>&nbsp;搜索</a>
                                <a class="btn btn-warning btn-rounded btn-sm" onclick="$.form.reset()"><i class="fa fa-refresh"></i>&nbsp;重置</a>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>

            <div class="btn-group-sm" id="toolbar" role="group">
                    <a class="btn btn-primary" onclick="addUser()">
                        <i class="fa fa-plus"></i> 新增
                    </a>
                    <a class="btn btn-danger multiple " onclick="$.operate.removeAll()">
                        <i class="fa fa-remove"></i> 删除
                    </a>
            </div>
                <div class="col-sm-12 select-table table-striped">
                    <table id="bootstrap-table"></table>
                </div>
        </div>
    </div>
</div>
<@js_common/>
<@js_layout/>
<@js_ztree/>
<script>
    var prefix = " ${ctx}/user";
    $(function () {
        var panehHidden = false;
        if ($(this).width() < 769) {
            panehHidden = true;
        }
        $('body').layout({initClosed: panehHidden, west__size: 185});
        loadOrgTree();
        loadUserList();
    });

    function loadOrgTree() {
        var url = "${ctx}/organization/findUserControlTree";
        var options = {
            url: url,
            expandLevel: 2,
            onClick: zOnClick
        };
        $.tree.init(options);
        function zOnClick(event, treeId, treeNode) {
            $("#selectOrgId").val(treeNode.id);
            $.table.search();
        }
    }

    $('#btnExpand').click(function () {
        $._tree.expandAll(true);
        $(this).hide();
        $('#btnCollapse').show();
    });

    $('#btnCollapse').click(function () {
        $._tree.expandAll(false);
        $(this).hide();
        $('#btnExpand').show();
    });

    $('#btnRefresh').click(function () {
        $("#selectOrgId").val(null);
        loadOrgTree();
        $.form.reset();
    });

    /* 用户管理-停用 */
    function disable(id) {
        $.modal.confirm("确认要停用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }
    /* 用户管理启用 */
    function enable(id) {
        $.modal.confirm("确认要启用管理员用户吗？", function () {
            $.operate.post(prefix + "/state", {"id": id});
        })
    }

    function empower(id) {
        var url = prefix + '/empower/' + id;
        $.modal.open("设置角色", url);
    }

    function userDuty(id,username) {
        var url = prefix +  '/userDuty/' + id;
        $.modal.openTab("设置兼职("+username+")", url);
    }

    function addUser(){
        var url = prefix + '/addUser?orgId=' + $("#selectOrgId").val();
        $.modal.open("新增用户", url);
    }

    function resetPassword(id) {
        $.modal.confirm("确定重置该用户的登录密码？<br/>重置后密码：12345678", function () {
            $.operate.post(prefix + "/resetPassword", {"id": id});
        })
    }

    function loadUserList() {
        $(function () {
            var options = {
                url: prefix + "/findList",
                updateUrl: prefix + "/update/{id}",
                removeUrl: prefix + "/delete",
                modalName: "管理员",
                uniqueId: "id",
                columns: [{
                    checkbox: true
                },
                    {
                        field: 'index',
                        title: '序号',
                        formatter: function (value, row, index) {
                            return index + 1;
                        }
                    },
                    {
                        field: 'username',
                        title: '用户账号'
                    },
                    {
                        field: 'nickname',
                        title: '用户姓名'
                    },
                    {
                        field: 'companyName',
                        title: '所属公司'
                    },
                    {
                        field: 'deptName',
                        title: '所属部门'
                    },
                    {
                        field: 'dutyName',
                        title: '主要职务'
                    },
                    {
                        field: 'mobile',
                        title: '手机号码'
                    },
                    {
                        field: 'sort',
                        title: '显示顺序'
                    },
                    {
                        field: 'status',
                        title: '状态',
                        align: 'center',
                        formatter: function (value, row, index) {
                            if (row.status == 1) {
                                return '<i class=\"fa fa-toggle-on text-success fa-2x\" onclick="disable(\'' + row.id + '\')"></i> ';
                            } else {
                                return '<i class=\"fa fa-toggle-off text-success fa-2x\" onclick="enable(\'' + row.id + '\')"></i> ';

                            }
                        }
                    },
                    {
                        field: 'createTime',
                        title: '创建时间',
                        sortable: true
                    },
                    {
                        title: '操作',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var actions = [];
                            actions.push('<a class="btn btn-warning btn-xs " href="javascript:void(0)" onclick="empower(\'' + row.id + '\')"><i class="fa fa-key"></i>设置角色</a> ');
                            actions.push("<a class='btn btn-warning btn-xs' href='javascript:void(0)' onclick=resetPassword('"+row.id+"')><i class='fa fa-refresh'></i>重置密码</a> ");
                            actions.push('<a class="btn btn-success btn-xs " href="javascript:void(0)" onclick="userDuty(\'' + row.id + '\',\'' + row.username + '\')"><i class="fa fa-id-card"></i>设置兼职</a> ');
                            actions.push('<a class="btn btn-success btn-xs " href="javascript:void(0)" onclick="$.operate.edit(\'' + row.id + '\')"><i class="fa fa-edit"></i>编辑</a> ');
                            actions.push('<a class="btn btn-danger btn-xs " href="javascript:void(0)" onclick="$.operate.remove(\'' + row.id + '\')"><i class="fa fa-remove"></i>删除</a>');
                            return actions.join('');
                        }
                    }]
            };
            $.table.init(options);
        });
    }
</script>
</body>
</html>