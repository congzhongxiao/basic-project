<#macro meta title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <#nested>
    <title>${title}</title>
</#macro>
<#macro css_common>
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/plugins/chosen/chosen.css" rel="stylesheet">
    <link href="${ctx}/static/css/animate.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/custom-ui.css" rel="stylesheet"/>
    <#nested>
</#macro>
<#macro js_common>
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/js/bootstrap.min.js"></script>
    <!-- bootstrap-table 表格插件 -->
    <script src="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.js?v=20191219"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/mobile/bootstrap-table-mobile.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/toolbar/bootstrap-table-toolbar.min.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/columns/bootstrap-table-fixed-columns.js"></script>
    <!-- jquery-validate 表单验证插件 -->
    <script src="${ctx}/static/plugins/validate/jquery.validate.min.js"></script>
    <script src="${ctx}/static/plugins/validate/messages_zh.min.js"></script>
    <script src="${ctx}/static/plugins/validate/jquery.validate.extend.js"></script>
    <!-- jquery-validate 表单树插件 -->
    <script src="${ctx}/static/plugins/bootstrap-treetable/bootstrap-treetable.js"></script>
    <!-- jquery-export 表格导出插件 -->
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/export/tableExport.js"></script>
    <script src="${ctx}/static/plugins/chosen/chosen.jquery.js"></script>
    <!-- 遮罩层 -->
    <script src="${ctx}/static/plugins/blockUI/jquery.blockUI.js"></script>
    <script src="${ctx}/static/plugins/iCheck/icheck.min.js"></script>
    <script src="${ctx}/static/plugins/layer/layer.min.js"></script>
    <script src="${ctx}/static/plugins/layui/layui.js"></script>
    <#nested>
    <script src="${ctx}/static/js/common.js?v=4.1.0"></script>
    <script src="${ctx}/static/js/custom-ui.js?v=4.1.0"></script>
</#macro>

<#macro css_ztree>
    <link href="${ctx}/static/plugins/jquery-ztree/3.5/css/metro/zTreeStyle.css" rel="stylesheet"/>
</#macro>

<#macro js_ztree>
    <script src="${ctx}/static/plugins/jquery-ztree/3.5/js/jquery.ztree.all-3.5.js"></script>
</#macro>
<#macro js_wangEditor>
<script src="${ctx}/static/plugins/wangeditor/wangEditor.js"></script>
</#macro>
<#macro js_upload>
<script src="${ctx}/static/js/upload.js"></script>
</#macro>
<#macro js_richtext>
<script src="${ctx}/static/js/rich-text.js"></script>
</#macro>

<#macro css_webuploader>
    <link href="${ctx}/static/plugins/webuploader/webuploader.css" rel="stylesheet"/>
</#macro>
<#macro js_webuploader>
    <script src="${ctx}/static/plugins/webuploader/webuploader.nolog.js"></script>
    <script src="${ctx}/static/plugins/webuploader/leeImageUploader.js"></script>
</#macro>