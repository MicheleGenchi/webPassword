<%-- 
    Document   : doEliminaEmail
    Created on : 14-feb-2019, 22.55.01
    Author     : JAVASE
--%>
<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:setProperty name="email" property="*" />

<%
    String tipo=request.getParameter("tipoSelezionato");
    String emailDaEliminare=request.getParameter("email");
    EmailDAO dao=new EmailDAO();
    if (!dao.elimina(emailDaEliminare))
        email.getErrore().aggiungi(Errors.InsertFailure);
%>
<jsp:forward page="doPassword.jsp"/>