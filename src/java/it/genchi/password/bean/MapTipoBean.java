/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.bean;

import java.util.Map;
import java.util.TreeMap;

/**
 *
 * @author JAVASE
 */
public class MapTipoBean extends ListaBean<TipoBean> {
    private final Map<String, String> tipi;

    public MapTipoBean() {
        tipi = new TreeMap<String, String>();
    }

    @Override
    public void aggiungi(TipoBean tipo) {
        tipi.put(tipo.getIdTipo(), tipo.getDescrizione());
    }

    public Map<String, String> getTipi() {
        return tipi;
    }
    

    
}
