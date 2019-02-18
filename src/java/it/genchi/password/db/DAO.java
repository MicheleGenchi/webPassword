/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.MYBean;

public interface DAO {
    
    boolean fill(ListaBean lista, String...stringa); 
    boolean fill(ListaBean lista, MYBean myBean);
    boolean fill(ListaBean lista);
    boolean aggiungi(MYBean bean);
}
