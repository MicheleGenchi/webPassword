package it.genchi.password.bean;

import it.genchi.password.utilita.ErrMsg;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author JAVASE
 */
abstract public class MYBean  {
    protected final ErrMsg errore;

    public MYBean() {
        this.errore = new ErrMsg();
    }

    
    public ErrMsg getErrore() {
        return this.errore;
    }
    
    
}
