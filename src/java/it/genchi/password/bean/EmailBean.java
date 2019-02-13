/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.bean;

import it.genchi.password.utilita.Errors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author JAVASE
 */
public class EmailBean extends MYBean {
    private String email;
    private String ePassword;
    private String utente;
    private final Pattern emailPattern = 
    Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
    
    public EmailBean() {
        email="";
        ePassword="";
        utente="";
    }

    public String getePassword() {
        return ePassword;
    }

    public void setePassword(String ePassword) {
        this.ePassword = ePassword;
    }

   
    
    public String getUtente() {
        return utente;
    }

    public void setUtente(String utente) {
        this.utente = utente;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        //if (isValid())
            this.email = email;
    }


    
    public boolean isValid() {
        Matcher matcher = emailPattern.matcher(email);
        if (email.isEmpty())
            errore.aggiungi(Errors.RegistrazioneFallita+" email é vuota o duplicata");
        if (ePassword.isEmpty()) 
            errore.aggiungi(Errors.RegistrazioneFallita+" la password non può essere nulla");
        if (utente.isEmpty())
            errore.aggiungi(Errors.RegistrazioneFallita+" inserire un utente valido per l'email");
        
        if (!matcher.find())
            errore.aggiungi(Errors.RegistrazioneFallita+" formato email errato");
        
        return !errore.isErr();
    }
}
