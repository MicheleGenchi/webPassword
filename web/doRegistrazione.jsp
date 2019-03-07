<%-- 
    Document   : doRegistration
    Created on : 30-gen-2019, 16.51.11
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="request" />
<jsp:setProperty name="login" property="*" />
<jsp:setProperty name="email" property="*" />

<%
    login.getErrore().clear();
    email.getErrore().clear();
    errori.clear();
    LoginDAO daoLogin = new LoginDAO();
    EmailDAO daoEmail = new EmailDAO();
    if (login.isValid()) {
        boolean esiste = daoLogin.trova(login.getUtente());
        if (esiste) {
            login.getErrore().aggiungi(Errors.DuplicateUtente);
        } else {
            if (email.isValid()) {
                esiste = daoEmail.trova(email.getIdEmail());
                if (esiste) {
                    email.getErrore().aggiungi(Errors.DuplicateEmail);
                }
            } else {
                errori.setMsgs(email.getErrore().getMsgs());
            }
        }
    } else {
        errori.setMsgs(login.getErrore().getMsgs());
    }

    if (!login.getErrore().isErr() && !email.getErrore().isErr()) {
%><jsp:forward page="viewRegistrazione.jsp">
    <jsp:param name="registrazione" value="true" />
</jsp:forward>
<%
    }
%>
<jsp:forward page="viewRegistrazione.jsp" />









