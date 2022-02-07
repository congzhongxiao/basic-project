<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="组织选择"/>
    <@css_common/>
    <@css_ztree/>
</head>
<style>
</style>
<body class="hold-transition box box-main">
<input id="treeId" name="treeId" type="hidden" value="${organization.id}"/>
<input id="treeName" name="treeName" type="hidden" value="${organization.name}"/>
<input id="orgType" name="orgType" type="hidden" value="${childOrg.orgType}"/>
<div class="wrapper">
    <div class="treeSearchInput" id="search">
        <label for="keyword">关键字：</label><input type="text" class="empty" id="keyword" maxlength="50">
        <button class="btn" id="btn" onclick="$.tree.searchNode()"> 搜索</button>
    </div>
    <div id="tree" class="ztree treeselect"></div>
</div>
<@js_common/>
<@js_ztree/>
<script>
    $(function () {
        var url = "${ctx}/organization/findAllTree";
        var options = {
            url: url,
            expandLevel: -1,//小于0则全部展开
            onClick: zOnClick,
            beforeClick: beforeClick
        };
        $.tree.init(options);
    });
    function beforeClick(treeId, treeNode) {
        var orgType = $("#orgType").val();
        if(orgType == '0'){
            if (treeNode.type == '0' || treeNode.type == '1') {
                $.modal.msgError("当前组织为公司时上级组织不能选择公司或部门");
                return false;
            }
        }
        return true;
    }
    function zOnClick(event, treeId, treeNode) {
        var treeId = treeNode.id;
        var treeName = treeNode.name;
        $("#treeId").val(treeId);
        $("#treeName").val(treeName);
    }

</script>
</body>
</html>
