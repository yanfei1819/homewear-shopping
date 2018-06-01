package org.shopping.entity;

/**
 * Created by dell on 2018-04-27.
 */
public class Result {
    private String code;
    private String msg;
    private Object data;
    public String getStatus() {
        return code;
    }
    public void setStatus(String code) {
        this.code = code;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public Object getData() {
        return data;
    }
    public void setData(Object data) {
        this.data = data;
    }
}
