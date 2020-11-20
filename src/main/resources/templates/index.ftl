<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>后台管理系统</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/jquery.contextMenu.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/animate.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/skins.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/custom-ui.css?v=4.1.0" rel="stylesheet"/>
</head>
<body class="fixed-sidebar full-height-layout gray-bg theme-dark skin-blue" style="overflow: hidden">
<div id="wrapper">

    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close">
            <i class="fa fa-times-circle"></i>
        </div>
        <div class="nav navbar-left-header">
            <a href="javascript:void(0);">
                <div class="logo">
                    <span class="logo-lg">后台管理系统</span>
                </div>
                <div class="mini-logo hide">
                        <span class="logo-lg">
                           HT
                        </span>
                </div>
            </a>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="#"><i class="fa fa-cog"></i> <span class="nav-label">功能区</span> <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="menuItem" href="${ctx}/product">图片上传</a></li>
                        <li><a class="menuItem" href="${ctx}/person">导入导出功能</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cog"></i> <span class="nav-label">系统管理</span> <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="menuItem" href="${ctx}/user">用户管理</a></li>
                        <li><a class="menuItem" href="${ctx}/role">角色管理</a></li>
                        <li><a class="menuItem" href="${ctx}/permission">权限管理</a></li>
                        <li><a class="menuItem" href="${ctx}/area">行政区划</a></li>
                        <li><a class="menuItem" href="${ctx}/server">服务监控</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->

    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2" style="color:#FFF;" href="#" title="收起菜单">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right welcome-message">
                    <li><a title="全屏显示" href="javascript:void(0)" id="fullScreen"><i class="fa fa-arrows-alt"></i> 全屏显示</a>
                    </li>
                    <li class="dropdown user-menu">
                        <a href="javascript:void(0)" class="dropdown-toggle" data-hover="dropdown">
                            <span class="hidden-xs"><@shiro.principal property="nickname"/></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <a onclick="resetPwd()">
                                    <i class="fa fa-key"></i> 修改密码</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="/logout">
                                    <i class="fa fa-sign-out"></i> 退出登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left tabLeft">
                <i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active menuTab" data-id="${ctx}/home">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right tabRight">
                <i class="fa fa-forward"></i>
            </button>
            <a href="javascript:void(0);" class="roll-nav roll-right tabReload"><i class="fa fa-refresh"></i> 刷新</a>
        </div>

        <a id="ax_close_max" class="ax_close_max" href="#" title="关闭全屏"> <i class="fa fa-times-circle-o"></i> </a>

        <div class="row mainContent" id="content-main">
            <iframe class="index_iframe" name="iframe0" width="100%" height="100%" data-id="${ctx}/home"
                    src="${ctx}/home" frameborder="0" seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<!-- 全局js -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${ctx}/static/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${ctx}/static/js/jquery.contextMenu.min.js"></script>
<script src="${ctx}/static/plugins/blockUI/jquery.blockUI.js"></script>
<script src="${ctx}/static/plugins/layer/layer.min.js"></script>
<script src="${ctx}/static/js/custom-ui.js?v=4.1.0"></script>
<script src="${ctx}/static/js/common.js?v=4.1.0"></script>
<script src="${ctx}/static/js/index.js"></script>
<script src="${ctx}/static/plugins/fullscreen/jquery.fullscreen.js"></script>
<script>
    /* 用户管理-重置密码 */
    function resetPwd() {
        var url = '${ctx}/user/resetPassword';
        $.modal.open("重置密码", url, '770', '380');
    }

</script>
</body>
</html>
