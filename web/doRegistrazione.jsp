<%-- 
    Document   : doRegistration
    Created on : 30-gen-2019, 16.51.11
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.LoginDAO"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<jsp:setProperty name="email" property="*"/>

<%
    login.getErrore().clear();
    email.getErrore().clear();
    
    LoginDAO daoLogin=new LoginDAO();
    if (login.isValid()) {
        boolean esiste=daoLogin.trovato(login);
        if (esiste) {
            login.getErrore().aggiungi("L'utente é già registrato");
            %><jsp:forward page="viewRegistrazione.jsp" /><%
        } else {
            EmailDAO daoEmail=new EmailDAO();
            if (email.isValid()) {
                daoLogin.aggiungi(login);
                daoEmail.aggiungi(email);
                %><jsp:forward page="RegistrazioneOK.jsp" /><%
            } else {
                %><jsp:forward page="viewRegistrazione.jsp" /><%    
            }
        }
    } else {
        %><jsp:forward page="viewRegistrazione.jsp" /><%
    }   
%>

