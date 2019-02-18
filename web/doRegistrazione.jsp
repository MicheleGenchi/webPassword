<%-- 
    Document   : doRegistration
    Created on : 30-gen-2019, 16.51.11
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="registration" class="it.genchi.password.bean.RegistrationBean" scope="request" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<jsp:setProperty name="email" property="*"/>

<%
    login.getErrore().clear();
    email.getErrore().clear();
   
    if (login.isValid()) {
        LoginDAO daoLogin = new LoginDAO();
        boolean esiste = daoLogin.trovato(login.getUtente());

        if (esiste) {
            login.getErrore().clear();
            login.getErrore().aggiungi(Errors.DuplicateUtente);
            if (!email.isValid()) {
                   email.getErrore().aggiungi(Errors.InvalidEmail);
            }
        }
    }

    if (login.getErrore().isErr() || email.getErrore().isErr()) {
        %><jsp:forward page="viewRegistrazione.jsp" /><%
    } else {
        LoginDAO daoLogin=new LoginDAO();
        EmailDAO daoEmail=new EmailDAO();
        daoLogin.aggiungi(login);
        daoEmail.aggiungi(email);
    %>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        swal("Congratulazione!", "Utente registrato con successo...", "success");
    </script>
    <jsp:forward page="doTipo.jsp" /><%
        }
%>
