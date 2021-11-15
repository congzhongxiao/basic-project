<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>欢迎登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/static/plugins/bootstrap/css/bootstrap.min.css?version=${version}" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css?version=${version}" rel="stylesheet" type="text/css">
    <link rel="shortcut icon" href="${ctx}/static/favicon.ico"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        ::-webkit-input-placeholder { /* WebKit, Blink, Edge */
            color: #a1a1a1;
        }

        :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color: #a1a1a1;
        }

        ::-moz-placeholder { /* Mozilla Firefox 19+ */
            color: #a1a1a1;
        }

        :-ms-input-placeholder { /* Internet Explorer 10-11 */
            color: #a1a1a1;
        }

        .login-page {
            margin: 0px;
            padding: 0px;
            background: #3c8dbc;
            position: relative;
            height: 100vh;
        }

        .login-panel {
            position: absolute;
            border: 1px solid #f3f3f3;
            top: 50%;
            left: 50%;
            transform: translateY(-50%) translateX(-50%);
            width: 430px;
            height: 400px;
            background: #FFFFFF;
            padding: 25px;
            border-radius: 4px;
        }

        .login-title {
            color: #3c8dbc;
            font-size: 25px;
            text-align: center;
            padding: 0px 10px 10px 10px;
            border-bottom: 1px solid #d8d6d6;
        }

        .login-row {
            margin: 20px 0;
            position: relative;
        }

        .form-input {
            width: 100%;
            border: 1px solid #c6c6c6;
            height: 50px;
            padding: 8px 8px 8px 40px;
            font-size: 16px;
            outline: none;
            color: #8f8f8f;
        }

        .code {
            padding: 8px;
        }

        .input-icon {
            position: absolute;
            top: 10px;
            left: 30px;
            font-size: 22px;
            color: #b1b1b1;
        }

        .login-btn {
            width: 100%;
            height: 50px;
            background: #3c8dbc;
            border: none;
            color: #FFFFFF;
            font-size: 18px;
        }

        .login-btn:hover {
            background: #347ba5;
        }
    </style>
</head>

<body class="login-page">
<div class="login-panel">
    <div class="login-title">欢迎登录后台管理系统</div>
    <input type="hidden" id="captchaType" value="${captchaType}">
    <form role="form" class="form-horizontal">
        <div class="row login-row">
            <div class="col-xs-12">
                <span class="input-icon"><i class="fa fa-user"></i></span>
                <input class="form-input" placeholder="请输入登录账号" id="username" name="username" type="text" value=""
                       autofocus>
            </div>
        </div>
        <div class="row login-row">
            <div class="col-xs-12">
                <span class="input-icon"><i class="fa fa-lock"></i></span>
                <input class="form-input" placeholder="请输入密码" id="pwd" name="pwd" value=""
                       type="password">
            </div>
        </div>
        <#if isCaptchaLogin == 'true'>
            <div class="row login-row">
                <div class="col-xs-6">
                    <input placeholder="请输入验证码" class="form-input code" id="validateCode" name="validateCode" value=""
                           maxlength="4"
                           type="text">
                </div>
                <div class="col-xs-6"><a href="javascript:void(0);" title="点击更换验证码">
                        <img class="captchaImage" style="width: 100%;height: 50px;"/>
                    </a></div>
            </div>
        </#if>

        <div class="row login-row">
            <div class="col-xs-12">
                <button id="login" class="login-btn" type="submit">登录</button>
            </div>
        </div>
    </form>
</div>

<!-- jQuery -->
<script src="${ctx}/static/js/jquery.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/bootstrap/js/bootstrap.min.js?version=${version}"></script>
<script src="${ctx}/static/plugins/jsencrypt/jsencrypt.js?version=${version}"></script>
<script src="${ctx}/static/plugins/layer/layer.min.js?version=${version}"></script>
<script>
    <#if isCaptchaLogin == 'true'>

    function getCaptcha() {
        var captchaType = $("#captchaType").val();
        if (captchaType != 'math' && captchaType != 'char') {
            captchaType = 'char';
        }
        var url = "${ctx}/captcha/captchaImage?type=" + captchaType;
        $(".captchaImage").attr("src", url);
    }

    </#if>
    $(function () {
        <#if isCaptchaLogin == 'true'>
        getCaptcha();
        $(".captchaImage").click(function () {
            getCaptcha();
        });
        </#if>
        if (top != self) {
            layer.alert('未登录或登录超时，请重新登录',
                {
                    title: '系统提示',
                    icon: 0,
                    closeBtn: 0
                }, function () {
                    top.location = self.location;
                });
        }


        $("#login").click(function () {
            if (!$("#username").val()) {
                layer.msg('请输入登录账号', {time: 1000});
                return false;
            }
            if (!$("#pwd").val()) {
                layer.msg('请输入密码', {time: 1000});
                return false;
            }

            <#if isCaptchaLogin == 'true'>
            if (!$("#validateCode").val()) {
                layer.msg('请输入验证码', {time: 1000});
                return false;
            }
            </#if>
            var public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnq5fgSl3VzTXR54QkmlCyD1X/FC4ds5ZICyhOb8Snw1DUVDgz/wvnOAgG2NnLjg83gUS1Djo0B6IWzgZcT09gP7KyIISI/aPtb9UgmTYyv060DS2YYEzIaIfhx2ZBA9bSzOjaE6cgk5NZq38U6+my516o3j/JTuguhX3SHP+S6QIDAQAB";
            var encrypt = new JSEncrypt();
            encrypt.setPublicKey(public_key);
            var data = $("form").serializeArray();
            data.forEach(function (item) {
                if (item.name === 'username' || item.name === 'pwd') {
                    item.value = encrypt.encrypt(item.value);
                }
            });
            $.ajax({
                url: '/login',
                type: 'post',
                data: data,
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        layer.msg(data.message, {time: 1000}, function () {
                            window.location.href = "${ctx}/";
                        });
                    } else {
                        <#if isCaptchaLogin == 'true'>
                        getCaptcha();
                        </#if>
                        layer.open({
                            title: '登录失败',
                            icon: 5,
                            content: data.message
                        });
                    }
                }
            });
            return false;
        });
    });
</script>
</body>

</html>
