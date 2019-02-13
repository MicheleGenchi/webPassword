
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.EmailBean;
import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.LoginBean;
import it.genchi.password.bean.MYBean;
import it.genchi.password.utilita.ErrMsg;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DAOClass implements DAO {
    protected ErrMsg errore;
    
    DAOClass() {
        errore=new ErrMsg();
    }
    
    @Override 
    public boolean fill(ListaBean lista, String...stringa) {
         throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
     
    @Override
    public boolean fill(ListaBean bean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean aggiungi(MYBean bean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean fill(ListaBean lista, MYBean myBean) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
