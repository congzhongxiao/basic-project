<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>公司后台管理系统</title>
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/plugins/contextMenu/jquery.contextMenu.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/font-awesome.min.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/animate.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/common.css?version=${version}" rel="stylesheet"/>
    <link href="${ctx}/static/css/app.css?version=${version}" rel="stylesheet"/>
</head>
<body class="mini-menu">
<div class="wrapper">
    <div class="main-head">
        <div class="head-logo-panel">
            <a class="head-logo" href="#">后台管理系统</a>
            <a class="mini-head-logo" href="#">HD</a>
        </div>
        <div class="head-bar">
            <a href="#" class="menu-model-bar">
                <span class="fa fa-bars"></span>
            </a>
        </div>
        <div class="head-menu-panel">
            <ul class="nav navbar-nav head-menu pull-left  hidden-xs">
                <li><a href="#">首页 </a></li>
                <li><a href="#">新闻中心</a></li>
                <li><a href="#">产品案例</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-hover="dropdown">更多 <span
                                class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">中文</a></li>
                        <li><a href="#">英文</a></li>
                        <li><a href="#">日文</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav head-menu pull-right navbar-right">
                <li><a title="全屏显示" href="javascript:void(0)" id="fullScreen"><i class="fa fa-arrows-alt"></i> 全屏显示</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-hover="dropdown"><i
                                class="fa fa-fw fa-user"></i><@shiro.principal property="nickname"/> <span
                                class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="javascript:;" onclick="">
                                <i class="fa fa-user-circle-o"></i> 个人中心</a>
                        </li>
                        <li>
                            <a href="javascript:;" onclick="resetPwd()">
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
        </div>

<#--        <nav class="navbar">
            <div class="navbar-collapse ">

                <ul class="nav navbar-nav navbar-right">
                    <li><a title="全屏显示" href="javascript:void(0)" id="fullScreen"><i class="fa fa-arrows-alt"></i> 全屏显示</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-hover="dropdown"><i
                                    class="fa fa-fw fa-user"></i><@shiro.principal property="nickname"/> <span
                                    class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="javascript:;" onclick="">
                                    <i class="fa fa-user-circle-o"></i> 个人中心</a>
                            </li>
                            <li>
                                <a href="javascript:;" onclick="resetPwd()">
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
            </div><!-- /.navbar-collapse &ndash;&gt;
        </nav>-->
    </div>
    <div class="main-left">
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
                    <a href="#"><i class="fa fa-key"></i> <span class="nav-label">权限管理</span> <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="menuItem" href="${ctx}/role">角色管理</a></li>
                        <li><a class="menuItem" href="${ctx}/permission">权限管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-server"></i> <span class="nav-label">系统监控</span> <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="menuItem" href="${ctx}/operateLog">系统日志</a></li>
                        <li><a class="menuItem" href="${ctx}/loginLog">登录日志</a></li>
                        <li><a class="menuItem" href="${ctx}/server">服务监控</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-cog"></i> <span class="nav-label">系统管理</span> <span
                                class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li><a class="menuItem" href="${ctx}/user">管理员管理</a></li>
                        <li><a class="menuItem" href="${ctx}/dictionary">字典管理</a></li>
                        <li><a class="menuItem" href="${ctx}/area">行政区划</a></li>
                        <li><a class="menuItem" href="${ctx}/organization/">组织架构</a></li>
                        <li><a class="menuItem" href="${ctx}/system/config/basic">系统基础设置</a></li>

                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="main-content">
        <div class="content-tabs">
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
        <div class="content-main" id="content-main">
            <iframe class="index_iframe" name="iframe0" width="100%" height="100%" data-id="${ctx}/home"
                    src="${ctx}/home"
                    frameborder="0" seamless></iframe>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="${ctx}/static/js/jquery.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/metisMenu/jquery.metisMenu.js?version=${version}"></script>
<script src="${ctx}/static/plugins/slimscroll/jquery.slimscroll.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/contextMenu/jquery.contextMenu.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/blockUI/jquery.blockUI.js?version=${version}"></script>
<script src="${ctx}/static/plugins/layer/layer.min.js?version=${version}"></script>
<script src="${ctx}/static/js/common-core.js?version=${version}"></script>
<script src="${ctx}/static/js/common-extend.js?version=${version}"></script>
<script src="${ctx}/static/js/index.js?version=${version}"></script>
<script src="${ctx}/static/plugins/fullscreen/jquery.fullscreen.js?version=${version}"></script>
<script>
    /* 用户管理-重置密码 */
    function resetPwd() {
        var url = '${ctx}/user/changePassword';
        $.modal.open("密码修改", url, '770', '380');
    }

    function changePassword() {
        var url = '${ctx}/user/changePassword';
        layer.open({
            type: 2,
            closeBtn: 0,
            area: ['770px', '380px'],
            shade: 0.3,
            title: "密码修改",
            content: url,
            btn: ['<i class="fa fa-check-square-o" />提交修改', '<i class="fa fa-sign-out" />退出登录'],
            // 弹层外区域关闭
            shadeClose: false,
            yes: function (index, layero) {
                var iframeWin = layero.find('iframe')[0];
                iframeWin.contentWindow.submitHandler(index, layero);
            },
            btn2: function () {
                $.modal.confirm('点击确定将返回登录页面，确定退出系统？', function () {
                    window.location.href = "${ctx}/logout";
                });
                return false;
            }
        });
    }

    $(function () {
        try {
            $.get('${ctx}/user/checkPasswordReset', function (result) {
                if (!result.success) {
                    layer.open({
                        title: '账号安全检测',
                        icon: 0,
                        closeBtn: 0,
                        content: result.message,
                        btn: ['修改密码'],
                        yes: function (index) {
                            layer.close(index);
                            changePassword();
                        }
                    });
                }
            });
        } catch (e) {
            console.info("密码过期检查异常");
        }

    });
</script>
</body>
</html>
