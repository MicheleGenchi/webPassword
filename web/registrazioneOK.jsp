<%-- 
    Document   : RegistrazioneOK
    Created on : 17-feb-2019, 16.04.24
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="loginreg" class="it.genchi.password.bean.LoginBean" scope="request" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />

<%
    LoginDAO daoLogin = new LoginDAO();
    EmailDAO daoEmail = new EmailDAO();
    login = loginreg;
    daoLogin.aggiungi(login);
    daoEmail.aggiungi(email);
%>