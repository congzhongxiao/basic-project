UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
UE.Editor.prototype.getActionUrl = function(action) {
    if (action == 'uploadimage'){
        return ctx+'/common/upload/ueditor'; /* 你自己的图片上传action */
    }else{
        return this._bkGetActionUrl.call(this, action);
    }
};