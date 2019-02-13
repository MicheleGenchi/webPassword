/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.EmailBean;
import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.ListaEmailBean;
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
public class EmailDAO extends DAOClass {
    
    @Override
    public boolean fill(ListaBean lista, String...stringa) {

        boolean valid=false;
        String sql = "SELECT email, password, utente FROM email where utente=? order by email;";

        try { 
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, stringa[0]); //utente
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmailBean email=new EmailBean();
                email.setEmail(rs.getString("email"));
                email.setePassword(rs.getString("password"));
                email.setUtente(rs.getString("utente"));
                lista.aggiungi(email);
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

    public boolean aggiungi(EmailBean newEmail) {
        String sql = "INSERT INTO email (email, password, utente) values (?,?,?)";
        boolean valid=false;
        try {
            Connection conn = DBConnect.get();
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            st.setString(1, newEmail.getEmail());
            st.setString(2, newEmail.getePassword());
            st.setString(3, newEmail.getUtente());
            int nrow = st.executeUpdate();
            valid=nrow>=1;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return valid;
        }
    }
}
