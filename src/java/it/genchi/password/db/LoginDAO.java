/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.LoginBean;
import it.genchi.password.bean.MYBean;
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

    public boolean trova(String utenteLogin) {
        String sql;
        boolean trovato = false;
        sql = "SELECT count(*) FROM password2.login "
                + "where utente=? order by utente;";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, utenteLogin);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                trovato = (rs.getInt(1) > 0);
            }
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

    public boolean trova(String utenteLogin, String password) {
        String sql;
        boolean trovato = false;
        sql = "SELECT count(*) FROM password2.login "
                + "where utente=? and password=? order by utente;";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, utenteLogin);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                trovato = (rs.getInt(1) > 0);
            }
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

    public boolean aggiungi(LoginBean newLogin) {
        boolean valid = false;
        String sql = "INSERT INTO login (utente, password) values (?,?)";
        if (newLogin.isValid()) {
            try {
                Connection conn = DBConnect.get();
                PreparedStatement st;
                st = conn.prepareStatement(sql);
                st.setString(1, newLogin.getUtente());
                st.setString(2, newLogin.getPassword());
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
        return valid;
    }

}
