<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="权限选择"/>
    <@css_common/>
    <@css_ztree/>
</head>
<style>
</style>
<body class="hold-transition box box-main">
<input id="treeId" name="treeId" type="hidden" value="${permission.id}"/>
<input id="treeName" name="treeName" type="hidden" value="${permission.name}"/>
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
        var url = "${ctx}/permission/findAllTree";
        var options = {
            url: url,
            expandLevel: 0,
            onClick: zOnClick
        };
        $.tree.init(options);
    });

    function zOnClick(event, treeId, treeNode) {
        var treeId = treeNode.id;
        var treeName = treeNode.name;
        $("#treeId").val(treeId);
        $("#treeName").val(treeName);
    }
</script>
</body>
</html>
