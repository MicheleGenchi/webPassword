/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author JAVASE
 */
public class DBConnect {

    public static Connection get() {
        Connection conn=null;
        try {
            Context initContext=new InitialContext();
            Context envContext= (Context) initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource) envContext.lookup("connpool");
            conn=ds.getConnection();
            
        } catch (NamingException | SQLException ex) {

            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            return conn;
        }
    }
}
