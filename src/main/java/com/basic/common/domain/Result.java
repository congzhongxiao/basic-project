package com.basic.common.domain;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 统一结果返回对象
 */
@Data
@NoArgsConstructor
//空数据不包含显示
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Result {
    private boolean success;//成功标识
    private String message;//返回信息
    private Integer code;//返回码，统一定义各种结果的反馈代码
    private Object data;//统一返回的数据

    public Result(ResultCode code) {
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = code.getMessage();
    }

    public static Result success(){
        return new Result(ResultCode.COMMON_SUCCESS);
    }
    public static Result success(Object data){
        return new Result(ResultCode.COMMON_SUCCESS,data);
    }
    public static Result success(String msg ){
        return new Result(ResultCode.COMMON_SUCCESS,msg);
    }
    public static Result success(String msg,Object data ){
        return new Result(ResultCode.COMMON_SUCCESS,msg,data);
    }


    public static Result fail(){
        return new Result(ResultCode.COMMON_FAIL);
    }
    public static Result alert(ResultCode code){
        return new Result(code);
    }
    public static Result alert(ResultCode code,Exception e){
        e.printStackTrace();
        return new Result(code);
    }
    public static Result alert(ResultCode code,String message){
        return new Result(code,message);
    }

    public static Result fail(String msg ){
        return new Result(ResultCode.COMMON_FAIL,msg);
    }


    /**
     * 统一返回码，信息自定义
     * @param code
     * @param message
     */
    public Result(ResultCode code, String message) {
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = message;
    }

    public Result(ResultCode code,Object object){
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = code.getMessage();
        this.data = object;
    }

    public Result(ResultCode code,String msg,Object object){
        this.success = code.isSuccess();
        this.code = code.getCode();
        this.message = msg;
        this.data = object;
    }
}
