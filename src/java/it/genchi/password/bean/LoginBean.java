/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.bean;

import it.genchi.password.utilita.ErrMsg;

/**
 *
 * @author JAVASE
 */
public class LoginBean extends MYBean {

    private String utente;
    private String password;
    
    
    public LoginBean() {
        utente = "";
        password = "";
    }

   
    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    public boolean isValid() {
        if (utente.isEmpty()) 
            errore.aggiungi("utente non valido o vuoto");
        if (password.isEmpty()) 
            errore.aggiungi("password non valida o vuota");
        return !errore.isErr();
    }

}
