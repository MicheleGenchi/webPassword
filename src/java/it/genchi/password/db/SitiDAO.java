/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.SitoBean;
import it.genchi.password.bean.TipoBean;
import it.genchi.password.utilita.ErrMsg;
import it.genchi.password.utilita.Errors;
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
public class SitiDAO extends DAOClass {
    
    @Override
    public boolean fill(ListaBean lista, String...stringa) {
        boolean valid=false;
        String sql = "SELECT idSito,descrizione,indirizzo,utente,password, "
                + "idTipo,Login FROM password2.sito where Login=? and idTipo=? order by descrizione;";

        try { 
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, stringa[0]); //utente
            st.setString(2, stringa[1]); //idTipo
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SitoBean sito=new SitoBean();
                sito.setIdSito(rs.getInt("idSito"));
                sito.setDescrizione(rs.getString("descrizione"));
                sito.setIndirizzo(rs.getString("indirizzo"));
                sito.setUtente(rs.getString("utente"));
                sito.setPassword(rs.getString("password"));
                sito.setIdTipo(rs.getString("idTipo"));
                sito.setLogin(rs.getString("login"));
                lista.aggiungi(sito);
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
