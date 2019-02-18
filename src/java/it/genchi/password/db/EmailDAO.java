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

    public boolean trova(String email) {
        boolean trovata = false;
        ListaEmailBean lista = new ListaEmailBean();
        String sql = "SELECT email, utente, password FROM email where email=? order by email;";
        try (
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, email); //utente
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmailBean emailB= new EmailBean();
                emailB.setEmail(rs.getString("email"));
                emailB.setePassword(rs.getString("password"));
                emailB.setUtente(rs.getString("utente"));
                lista.aggiungi(emailB);
            }
            trovata = true;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(TipoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("database error in " + this.getClass().getSimpleName(), ex);
        } finally {
            return trovata;
        }
    }

    @Override
    public boolean fill(ListaBean lista, String... stringa) {

        boolean valid = false;
        String sql = "SELECT email, password, utente FROM email where utente=? order by email;";

        try {
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, stringa[0]); //utente
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmailBean email = new EmailBean();
                email.setEmail(rs.getString("email"));
                email.setePassword(rs.getString("password"));
                email.setUtente(rs.getString("utente"));
                lista.aggiungi(email);
            }
            valid = true;
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
        boolean valid = false;
        if (newEmail.isValid()) {
            try (Connection conn = DBConnect.get();
                    PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, newEmail.getEmail());
                st.setString(2, newEmail.getePassword());
                st.setString(3, newEmail.getUtente());
                int nrow = st.executeUpdate();
                valid = nrow >= 1;
                st.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return valid;
    }

    public boolean elimina(String emailToSearch) {
        boolean isDeleted = false;
        String sql = "delete from email where email=?";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, emailToSearch);
            int n = st.executeUpdate();
            isDeleted = (n >= 1);
        } catch (SQLException ex) {
            Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isDeleted;
        }
    }
}
