package com.love.silin.base;

/**
 * @program: silin
 * @description:
 * @author: siming.wang
 * @create: 2019-01-11 17:19
 **/

public class SiLinException extends Exception{
    private String message;

    public SiLinException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
