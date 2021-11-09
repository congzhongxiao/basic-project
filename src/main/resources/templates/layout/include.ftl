<#macro meta title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <#if sys_csrfToken??>
    <meta content="${sys_csrfToken}" name="csrf-token" />
    </#if>
    <#nested>
    <title>${title}</title>
</#macro>
<#macro css_common>
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/font-awesome.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/plugins/select2/select2.css?version=${version}" rel="stylesheet">
    <link href="${ctx}/static/plugins/select2/select2-bootstrap.css?version=${version}" rel="stylesheet">
    <link href="${ctx}/static/css/animate.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/common.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/app.css?version=${version}" rel="stylesheet"/>
    <#nested>
    <link rel="shortcut icon" href="${ctx}/static/favicon.ico"/>
</#macro>
<#macro js_common>
    <script> var ctx = '${ctx}'</script>
    <script src="${ctx}/static/js/jquery.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js?version=${version}"></script>
    <!-- bootstrap-table 表格插件 -->
    <script src="${ctx}/static/plugins/bootstrap-table/bootstrap-table.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/mobile/bootstrap-table-mobile.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/toolbar/bootstrap-table-toolbar.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/columns/bootstrap-table-fixed-columns.js?version=${version}"></script>
    <!-- jquery-validate 表单验证插件 -->
    <script src="${ctx}/static/plugins/validate/jquery.validate.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/validate/messages_zh.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/validate/jquery.validate.extend.js?version=${version}"></script>
    <!-- jquery-validate 表单树插件 -->
    <script src="${ctx}/static/plugins/bootstrap-treetable/bootstrap-treetable.js?version=${version}"></script>
    <!-- jquery-export 表格导出插件 -->
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/bootstrap-table/extensions/export/tableExport.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/select2/select2.js?version=${version}"></script>
    <!-- 遮罩层 -->
    <script src="${ctx}/static/plugins/blockUI/jquery.blockUI.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/layer/layer.min.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/layui/layui.js?version=${version}"></script>
    <#nested>
    <script src="${ctx}/static/js/common-core.js?version=${version}"></script>
    <script src="${ctx}/static/js/common-extend.js?version=${version}"></script>
</#macro>

<#macro css_ztree>
    <link href="${ctx}/static/plugins/jquery-ztree/3.5/css/metro/zTreeStyle.css?version=${version}" rel="stylesheet"/>
</#macro>

<#macro js_ztree>
    <script src="${ctx}/static/plugins/jquery-ztree/3.5/js/jquery.ztree.all-3.5.js?version=${version}"></script>
</#macro>

<#macro css_webuploader_image>
    <link href="${ctx}/static/plugins/webuploader/webuploader-image.css?version=${version}" rel="stylesheet"/>
</#macro>
<#macro js_webuploader_image>
    <script src="${ctx}/static/plugins/webuploader/webuploader.nolog.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/webuploader/leeImageUploader.js?version=${version}"></script>
</#macro>

<#macro css_webuploader_file>
    <link href="${ctx}/static/plugins/webuploader/webuploader-file.css?version=${version}" rel="stylesheet"/>
</#macro>
<#macro js_webuploader_file>
    <script src="${ctx}/static/plugins/webuploader/webuploader.nolog.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/webuploader/leeFileUploader.js?version=${version}"></script>
</#macro>

<#macro js_ueditor>
    <script src="${ctx}/static/plugins/ueditor/ueditor.config.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/ueditor/ueditor.all.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/ueditor/lang/zh-cn/zh-cn.js?version=${version}"></script>
    <script src="${ctx}/static/plugins/ueditor/ueditor-init.js?version=${version}"></script>
</#macro>