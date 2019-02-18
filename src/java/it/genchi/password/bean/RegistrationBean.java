/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.bean;

/**
 *
 * @author JAVASE
 */
public class RegistrationBean {
    private boolean success;

    public RegistrationBean() {
        success=false;
    }
    

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
