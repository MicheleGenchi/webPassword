/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.EmailBean;
import it.genchi.password.bean.ListaBean;
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
    
    public boolean modifica(EmailBean newEmail) {
        boolean aggiornato=false;
        String sql="UPDATE password2.email set email=?, password=? where idEmail=?"; 
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, newEmail.getEmail());
            st.setString(2, newEmail.getePassword());
            st.setInt(3, newEmail.getIdEmail()); //primary key, indice email univoco
            int nRow = st.executeUpdate();
            aggiornato = nRow>0;
            st.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(TipoDAO.class.getName()).log(Level.SEVERE, null, ex);
            throw new RuntimeException("database error in " + this.getClass().getSimpleName(), ex);
        } finally {
            return aggiornato;
        }
    }
    

    public boolean trova(String email) {
        boolean trovata = false;
        String sql = "SELECT count(*) FROM email where email=? order by email";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setString(1, email); //primary key, indice email univoco
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                trovata = (rs.getInt(1) > 0);
            }
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
        String sql = "SELECT idEmail, email, password, utente FROM email where utente=? order by email;";

        try {
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, stringa[0]); //utente
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                EmailBean email = new EmailBean();
                email.setIdEmail(rs.getInt("idEmail"));
                email.setEmail(rs.getString("email"));
                email.setePassword(rs.getString("password"));
                email.setUtente(rs.getString("utente"));
                lista.aggiungi(email);
            }
            valid = true;
            rs.close();
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
        boolean valid = false;
        String sql = "INSERT INTO email (email, password, utente) values (?,?,?)";

        if (newEmail.isValid()) {
            try (Connection conn = DBConnect.get();
                    PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, newEmail.getEmail());
                st.setString(2, newEmail.getePassword());
                st.setString(3, newEmail.getUtente());
                int nrow = st.executeUpdate();
                valid = nrow >= 1;
            } catch (SQLException ex) {
                Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                return valid;
            }
        }
        return valid;
    }

    public boolean elimina(int emailToSearch) {
        boolean isDeleted = false;
        String sql = "delete from email where idEmail=?";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, emailToSearch);
            int n = st.executeUpdate();
            isDeleted = (n >= 1);
        } catch (SQLException ex) {
            Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isDeleted;
        }
    }
}
