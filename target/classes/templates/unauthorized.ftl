<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .no-permission{
            position: relative;
            height: 400px;
            padding: 20px;
            text-align: center;
        }
        .no-permission span {
            position: absolute;
            top:50%;
            left:50%;
            transform: translateX(-50%) translateY(-50%);
        }
    </style>
</head>
<body>
    <div class="no-permission">
        <span>您的权限认证失败或者权限不足(┬＿┬)！</span>
    </div>
</body>
</html>