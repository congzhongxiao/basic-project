<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>欢迎登录</title>

    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">


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
            height: 370px;
            background: #FFFFFF;
            padding: 25px;
        }

        .login-title {
            color: #3c8dbc;
            font-size: 25px;
            text-align: center;
            padding: 10px;
            border-bottom: 1px solid #d8d6d6;
        }

        .login-form-group {
            margin: 20px 0;
            position: relative;
        }

        .login-form-group input {
            width: 100%;
            border: 1px solid #c6c6c6;
            height: 50px;
            padding: 8px 0px 8px 40px;
            font-size: 16px;
            outline: none;
        }

        .login-form-group .input-icon {
            position: absolute;
            top: 10px;
            left: 15px;
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
        .login-btn:hover{
            background: #347ba5;
        }
    </style>
</head>

<body class="login-page">
<div class="login-panel">
    <div class="login-title">欢迎登录</div>
    <form role="form">
        <div class="login-form-group">
            <span class="input-icon"><i class="fa fa-user"></i></span>
            <input placeholder="请输入登录帐号" id="username" name="username" type="text" value="" autofocus>
        </div>
        <div class="login-form-group">
            <span class="input-icon"><i class="fa fa-lock"></i></span>
            <input class="" placeholder="请输入密码" id="password" name="password" value=""
                   type="password">
        </div>
        <div class="login-form-group">
            <button id="login" class="login-btn" type="submit" >登录</button>
        </div>
    </form>
</div>

<!-- jQuery -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/plugins/layer/layer.min.js"></script>
<script>
    $(function () {
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
                layer.msg('请输入登录帐号', {time: 1000});
                return false;
            }
            if (!$("#password").val()) {
                layer.msg('请输入密码', {time: 1000});
                return false;
            }
            $.ajax({
                url: '/login',
                type: 'post',
                data: $('form').serialize(),
                dataType: 'json',
                success: function (data) {
                    if (data.success) {
                        layer.msg(data.message, {time: 1000}, function () {
                            window.location.href = "${ctx}/";
                        });
                    } else {
                        layer.open({
                            title: '登录失败',
                            icon: 5,
                            content: data.message,
                            time: 2000
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
