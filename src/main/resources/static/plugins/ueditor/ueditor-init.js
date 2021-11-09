UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
UE.Editor.prototype.getActionUrl = function(action) {
    if (action == 'uploadimage' || action == 'uploadscrawl'  || action == 'uploadfile' || action== 'uploadvideo'){
        return '/common/upload/ueditor'; /* 你自己的图片上传action */
    }else if(action == 'catchimage'){//重定义远程文件上传地址
        return '/common/upload/ueditor/catch'; /* 你自己的图片上传action */
    }else{
        return this._bkGetActionUrl.call(this, action);
    }
};