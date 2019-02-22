/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;
import it.genchi.password.bean.MapTipoBean;
import it.genchi.password.bean.TipoBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JAVASE
 */
public class TipoDAO extends DAOClass {
    
    public boolean fill(MapTipoBean map) {
        boolean valid=false;
        String sql = "SELECT DISTINCT(tipo.idTipo), tipo.descrizione "
                + "FROM password2.tipo";
        try (
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                TipoBean tipo=new TipoBean();
                tipo.setIdTipo(rs.getString("idTipo"));
                tipo.setDescrizione(rs.getString("descrizione"));
                map.aggiungi(tipo);
            }
            valid=true;
        } catch (SQLException ex) {
            Logger.getLogger(TipoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("database error in " + this.getClass().getSimpleName(), ex);
        } finally {
            return valid;
        }
    }
    
    
}
