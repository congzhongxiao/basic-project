<#include "layout/include.ftl" >
<!DOCTYPE html>
<html lang="zh">
<head>
    <@meta title="系统日志详情"/>
    <@css_common/>
</head>
<body class="white-bg">
<div class="wrapper wrapper-content animated fadeInRight ibox-content">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">模块名称：</label>
            <div class="form-control-static">${operateLog.name}</div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">业务类型：</label>
            <div class="form-control-static">
                <label class="badge badge-success">
                    <#if operateLog.type == 0>
                        登录
                    <#elseif  operateLog.type == 1>
                        新增
                    <#elseif  operateLog.type == 2>
                        修改
                    <#elseif  operateLog.type == 3>
                        删除
                    <#elseif  operateLog.type == 4>
                        导出
                    <#elseif  operateLog.type == 5>
                        导入
                    <#elseif  operateLog.type == 6>
                        授权
                    <#elseif  operateLog.type == 7>
                        其他
                    </#if>
                </label>
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
                    <label class="badge badge-success">成功</label>
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