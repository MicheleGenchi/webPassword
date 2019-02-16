/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.utilita;

import javax.swing.JDialog;
import javax.swing.JOptionPane;

/**
 *
 * @author JAVASE
 */
public class MsgBox {

    public static void show(String title,String messaggio) {
        JOptionPane optionPane = new JOptionPane(messaggio, JOptionPane.WARNING_MESSAGE);
        JDialog dialog = optionPane.createDialog(title);
        dialog.setAlwaysOnTop(true); // to show top of all other application
        dialog.setVisible(true); // to visible the dialog
    }
}
