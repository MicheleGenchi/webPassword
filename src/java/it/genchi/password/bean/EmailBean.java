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
    private int idEmail;
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

    public int getIdEmail() {
        return idEmail;
    }

    public void setIdEmail(int idEmail) {
        this.idEmail = idEmail;
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


    @Override
    public boolean isValid() {
        Matcher matcher = emailPattern.matcher(email);
        if (email.isEmpty() & ePassword.isEmpty()) {
            errore.aggiungi(Errors.RegistrazioneFallita+" completare la registrazione digitando email e password");
        } else if (!matcher.find()) {
            errore.aggiungi(Errors.RegistrazioneFallita+" formato email errato");
        }
        return !errore.isErr();
    }
}
