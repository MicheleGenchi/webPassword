/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.LoginBean;
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
public class LoginDAO extends DAOClass {

    public boolean trovato(String utenteLogin) {
        boolean trovato = false;
        String sql = "SELECT utente, password FROM password2.login "
                + "where utente=? order by utente;";
        try (
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, utenteLogin);
            ResultSet rs = st.executeQuery();
            trovato = rs.next();
            st.close();
            conn.close();
        } catch (Exception ex) {
            errore.aggiungi(Errors.LoginFallito);
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("Database error in " + this.getClass().getSimpleName());
        } finally {
            return trovato;
        }
    }

    public boolean aggiungi(LoginBean login) {
        String sql = "INSERT INTO login (utente, password) values (?,?)";
        boolean valid = false;
        try {
            Connection conn = DBConnect.get();
            PreparedStatement st;
            st = conn.prepareStatement(sql);
            st.setString(1, login.getUtente());
            st.setString(2, login.getPassword());
            int row = st.executeUpdate();
            valid = row >= 1;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return valid;
        }
    }

}
