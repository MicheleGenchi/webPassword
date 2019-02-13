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
public class TipoBean extends MYBean {
    private String idTipo;
    private String descrizione;
    
    public TipoBean() {
        idTipo="";
        descrizione="";
    }

    public String getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(String idTipo) {
        this.idTipo = idTipo;
    }



    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
        
}
