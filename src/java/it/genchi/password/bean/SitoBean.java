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
public class SitoBean extends MYBean {
   private int idSito;
   private String descrizione;
   private String indirizzo;
   private String utente;
   private String password;        
   private String idTipo;
   private String login;

    public SitoBean() {
        idSito=0;
        descrizione="";
        indirizzo="";
        utente="";
        password="";
        idTipo="";
        login="";
    }

    public int getIdSito() {
        return idSito;
    }

    public void setIdSito(int idSito) {
        this.idSito = idSito;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
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

    public String getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(String idTipo) {
        this.idTipo = idTipo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }
   
   
}
