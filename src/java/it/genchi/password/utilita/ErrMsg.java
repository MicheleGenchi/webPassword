/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.genchi.password.utilita;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author JAVASE
 */
public class ErrMsg {
    private final List<String> msgs;

    public ErrMsg() {
        this.msgs = new ArrayList<String>();
    }

     public List<String> getMsgs() {
        return msgs;
    }

    public void aggiungi(String msg) {
        msgs.add(msg);
    }
    
    public void aggiungi(Errors msg) {
        msgs.add(msg.getDescrizione());
    }
    
    public boolean isErr() {
        return !msgs.isEmpty();
    }
    
    public void clear() {
        msgs.clear();
    }
}

