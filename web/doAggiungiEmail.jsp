<%-- 
    Document   : doAggiungiEmail
    Created on : 14-feb-2019, 23.23.47
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:setProperty name="email" property="*" />

<%
    EmailDAO dao=new EmailDAO();
    if (!dao.aggiungi(email))
        email.getErrore().aggiungi(Errors.InsertFailure);
%>
<jsp:forward page="doPassword.jsp"/>;

