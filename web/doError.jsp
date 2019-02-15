<%-- 
    Document   : doError
    Created on : 15-feb-2019, 18.46.27
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.bean.MYBean"%>
<%@page import="it.genchi.password.utilita.MsgBox"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="it.genchi.password.bean.MYBean" scope="session" />
<%
    String messaggio="";
    for (String msg : bean.getErrore().getMsgs()) {
        messaggio=messaggio+msg+"\n";
    }
    MsgBox.show(messaggio);
%>

