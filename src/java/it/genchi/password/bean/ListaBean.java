/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.bean;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JAVASE
 */
public class ListaBean<e> {

    private List<e> lista;

    public ListaBean() {
        this.lista = new ArrayList<>();
    }

    public List<e> getLista() {
        return lista;
    }

    public void setLista(List<e> lista) {
        this.lista = lista;
    }

    public void aggiungi(e bean) {
        lista.add(bean);
    }  
}
