/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.MapTipoBean;
import it.genchi.password.bean.MYBean;
import it.genchi.password.bean.TipoBean;
import it.genchi.password.utilita.ErrMsg;
import it.genchi.password.utilita.Errors;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAVASE
 */
public class TipoDAO extends DAOClass {
    
    public boolean fill(MapTipoBean map, String nomeUtente) {
        boolean valid=false;
        String sql = "SELECT DISTINCT(tipo.idTipo), tipo.descrizione "
                + "FROM password2.tipo, password2.sito "
                + "where sito.login=? and tipo.idTipo=sito.idTipo order by descrizione;";
        
        try { 
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, nomeUtente);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TipoBean tipo=new TipoBean();
                tipo.setIdTipo(rs.getString("idTipo"));
                tipo.setDescrizione(rs.getString("descrizione"));
                map.aggiungi(tipo);
            }
            valid=true;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(TipoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("database error in " + this.getClass().getSimpleName(), ex);
        } finally {
            return valid;
        }
    }
    
    
}
