/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import it.genchi.password.bean.ListaBean;
import it.genchi.password.bean.SitoBean;
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
public class SitoDAO extends DAOClass {

    @Override
    public boolean fill(ListaBean lista, String... stringa) {
        boolean valid = false;
        String sql = "SELECT idSito,descrizione,indirizzo,utente,password, "
                + "idTipo,login FROM password2.sito where login=? and idTipo=? order by descrizione;";
        String utente=stringa[0];
        String idTipo=stringa[1];
        try {
            Connection conn = DBConnect.get();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, utente); //utente
            st.setString(2, idTipo); //idTipo
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SitoBean sito = new SitoBean();
                sito.setIdSito(rs.getInt("idSito"));
                sito.setDescrizione(rs.getString("descrizione"));
                sito.setIndirizzo(rs.getString("indirizzo"));
                sito.setUtente(rs.getString("utente"));
                sito.setPassword(rs.getString("password"));
                sito.setIdTipo(rs.getString("idTipo"));
                sito.setLogin(rs.getString("login"));
                lista.aggiungi(sito);
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

    public boolean aggiungi(SitoBean newSito) {
        boolean valid = false;
        String sql = "INSERT INTO sito (descrizione, indirizzo, utente, password, idTipo, Login)"
                + "values (?,?,?,?,?,?)";
        if (newSito.isValid()) {
            try (Connection conn = DBConnect.get();
                    PreparedStatement st = conn.prepareStatement(sql)) {
                st.setString(1, newSito.getDescrizione());
                st.setString(2, newSito.getIndirizzo());
                st.setString(3, newSito.getUtente());
                st.setString(4, newSito.getPassword());
                st.setString(5, newSito.getIdTipo());
                st.setString(6, newSito.getLogin());
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
    
        public boolean elimina(Integer sitoToSearch) {
        boolean isDeleted = false;
        String sql = "delete from sito where idSito=?";
        try (
                Connection conn = DBConnect.get();
                PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, sitoToSearch);
            int n = st.executeUpdate();
            isDeleted = (n >= 1);
        } catch (SQLException ex) {
            Logger.getLogger(EmailDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return isDeleted;
        }
    }
}
