<%-- 
    Document   : doEliminaEmail
    Created on : 14-feb-2019, 22.55.01
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />

<%
    String emailDaEliminare=request.getParameter("email");
    EmailDAO daoEmail=new EmailDAO();
    if (!daoEmail.elimina(emailDaEliminare))
        email.getErrore().aggiungi("Non sono riuscito ad eliminare l'email");
%>
<jsp:forward page="doPassword.jsp"/>