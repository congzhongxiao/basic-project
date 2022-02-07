<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="人员列表"/>
    <@css_common/>
    <@css_layout/>
    <@css_ztree/>
    <style type="text/css">
        .selected-user-title{
            border-bottom: 1px solid #eee;
            padding: 12px 10px 2px 15px;
            font-size: 16px;
            background: #f0f4f7;
        }
        .user_list{
            padding: 10px;
        }
        .user_list .alert{
            padding: 8px 35px 8px 15px;
            margin-bottom: 8px!important;
        }
    </style>
</head>
<body class="white-bg">
<div class="ui-layout-center">
    <div class="selected-user-title">
        选中人员
    </div>
    <div class="user_list">

    </div>
</div>
<div class="ui-layout-west">
    <div class="box box-main">
        <div class="box-header">
            <div class="box-title">
                <i class="fa icon-grid"></i>组织架构
            </div>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" id="btnRefresh" title="刷新节点"><i
                            class="fa fa-refresh"></i></button>
            </div>
        </div>
        <form id="gzw_item_info-form">
            <input type="hidden" id="deptId" name="deptId">
            <input type="hidden" id="issueId" name="issueId" value="${issueId}">
                <input type="hidden" id="userIds" name="userIds">
        </form>
        <div class="ui-layout-content">
            <div id="tree" class="ztree"></div>
        </div>
    </div>
</div>
<@js_common/>
<@js_layout/>
<@js_ztree/>
<script>
    var prefix = " ${ctx}/user";
    let checkedUserInfos = window.parent.getCheckUserInfos();
    let checkedUserIds = window.parent.getCheckedUserIds();

    $(function () {
        var panehHidden = false;
        if ($(this).width() < 100) {
            panehHidden = true;
        }
        $('body').layout({initClosed: panehHidden, west__size: 385});
        loadOrgTree();

        initShowInfos();
    });

    var setting = {
        check: {
            enable: true
        },
        async: {
            enable: true,
            url: "${ctx}/user/findUserAndOrgTree",
            autoParam: ["id=orgId"],
            type: "post"
        },
        data: {
            simpleData: {
                enable: true
            },
        },
        callback: {
            onCheck: zTreeOnCheck,
            onAsyncSuccess: zTreeOnAsyncSuccess,
        }
    };

    // 点击节点触发事件
    function zTreeOnCheck(event, treeId, treeNode) {
        let id = treeNode.id;
        if (treeNode.checked) {
            // 选中节点中如果已经有了，则不进行添加操作
            let index = $.inArray(id, checkedUserIds);
            if(index != -1) {
                return;
            }
            // 添加显示信息
            addShowInfo(treeNode);
            // 添加节点数组信息
            addInfos(treeNode);

        } else {
            // 删除已勾选信息
            deleteInfos(id);
            deleteShowInfo(id);
        }
    }

    // 将勾选的用户信息添加到数组中
    function addInfos(treeNode) {
        // 获取数据
        let dataId = treeNode.id;
        let userName = treeNode.name;
        let extData = treeNode.extData;
        let userId = extData.userId;
        let nickname = extData.nickname;
        let companyId = extData.companyId;
        let companyName = extData.companyName;
        let companyCode = extData.companyCode;
        let deptId = extData.deptId;
        let deptName = extData.deptName;
        let dutyId = extData.dutyId;
        let dutyName = extData.dutyName;

        // 生成对象
        let data = new Object();
        data.id = dataId;
        data.dataId = dataId;
        data.userId = userId;
        data.name = userName;
        data.nickname = nickname;
        data.companyId = companyId;
        data.companyName = companyName;
        data.companyCode = companyCode;
        data.deptId = deptId;
        data.deptName = deptName;
        data.dutyId = dutyId;
        data.dutyName = dutyName;

        // 添加到已选中
        checkedUserIds.push(dataId);
        checkedUserInfos.push(data);
    }

    // 将取消勾选的用户信息从数组中去除
    function deleteInfos(itemId) {
        let index = $.inArray(itemId, checkedUserIds);
        if(index != -1) {
            checkedUserIds.splice(index, 1);
            checkedUserInfos.splice(index, 1);
        }
    }

    // 初始化显示信息
    function initShowInfos() {
        if (checkedUserInfos.length > 0) {
            for (let node of checkedUserInfos) {
                addShowInfo(node);
            }
        }
    }

    function addShowInfo(treeNode) {
        let inputEle =
            '<div class="alert alert-info alert-dismissable all_user_tree" id="' + treeNode.id + '">'
            + '         <button type="button" class="close" data-dismiss="alert" onclick="removeAlert(this)"'
            + '     data-id="' + treeNode.id + '" '
            + '     aria-hidden="true">'
            + '         &times;'
            + ' </button>'
            + treeNode.name
            + ' </div>'
        $(".user_list").append(inputEle);
    }

    // 删除显示信息
    function removeAlert(obj) {
        let id = $(obj).data('id');
        let index = $.inArray(id, checkedUserIds);
        if(index != -1) {
            checkedUserIds.splice(index, 1);
            checkedUserInfos.splice(index, 1);

            // 获取勾选的节点，然后修改勾选状态
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var node = treeObj.getNodeByParam("id",id );
            node.checked = false;
            treeObj.updateNode(node);
        }
    }

    function deleteShowInfo(id) {
        $("#" + id).remove();
    }


    function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
        for (let ele of checkedUserInfos) {
            var treeObj = $.fn.zTree.getZTreeObj("tree");
            var node = treeObj.getNodeByParam("id", ele.dataId);
            if (node != null) {
                node.checked = true;
                treeObj.updateNode(node);
            }
        }
    }


    function loadOrgTree() {
        $.fn.zTree.init($("#tree"), setting);
    }


    $('#btnExpand').click(function () {
        // $._tree.expandAll(true);
        $(this).hide();
        $('#btnCollapse').show();
    });

    $('#btnCollapse').click(function () {
        // $._tree.expandAll(false);
        $(this).hide();
        $('#btnExpand').show();
    });

    $('#btnRefresh').click(function () {
        loadOrgTree();
    });


    function submitHandler() {
        // 将当前页勾选的数据返回给父页面
        window.parent.setAllUserTreeUserInfos(checkedUserIds, checkedUserInfos);
        $.modal.close();
    }


</script>
</body>
</html>