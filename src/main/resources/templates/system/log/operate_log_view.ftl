<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="系统日志详情"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal" >
        <div class="form-group">
            <label class="col-sm-2 control-label">模块名称：</label>
            <div class="form-control-static">${operateLog.name}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">业务类型：</label>
            <div class="form-control-static">
                <#if operateLog.type == 0>
                    <label class="badge badge-primary">登录</label>
                    <#elseif  operateLog.type == 1>
                        <label class="badge badge-primary">新增</label>
                    <#elseif  operateLog.type == 2>
                        <label class="badge badge-primary">修改</label>
                    <#elseif  operateLog.type == 3>
                        <label class="badge badge-primary">删除</label>
                    <#elseif  operateLog.type == 4>
                        <label class="badge badge-primary">导出</label>
                    <#elseif  operateLog.type == 5>
                        <label class="badge badge-primary">导入</label>
                    <#elseif  operateLog.type == 6>
                        <label class="badge badge-primary">授权</label>
                    <#elseif  operateLog.type == 7>
                        <label class="badge badge-primary">其他</label>
                </#if>

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">请求方法：</label>
            <div class="form-control-static">${operateLog.method}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">请求类型：</label>
            <div class="form-control-static">${operateLog.requestType}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">请求Url：</label>
            <div class="form-control-static">${operateLog.operUrl}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">请求参数：</label>
            <div class="form-control-static ">${operateLog.operParam}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">返回参数：</label>
            <div class="form-control-static">${operateLog.resultParam}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">操作状态：</label>
            <div class="form-control-static">
                <#if operateLog.state == 0>
                    <label class="badge badge-primary">成功</label>
                <#else >
                    <label class="badge badge-danger">失败</label>
                </#if>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">操作用户：</label>
            <div class="form-control-static">${operateLog.operUserName}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">操作时间：</label>
            <div class="form-control-static">${operateLog.operTime?string('yyyy-MM-dd hh:mm:ss')}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">操作IP：</label>
            <div class="form-control-static">${operateLog.operIp}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">操作地点：</label>
            <div class="form-control-static">${operateLog.operLocation}</div>
        </div>
    </form>
</div>
<@js_common/>
</body>
</html>