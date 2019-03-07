<%-- 
    Document   : doModificaEmail
    Created on : 1-mar-2019, 16.19.10
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:setProperty name="email" property="*" />
<%
    EmailDAO dao = new EmailDAO();
    boolean aggiornato = dao.modifica(email);
%>
<jsp:forward page="doPassword.jsp">
    <jsp:param name="tipoSelezionato" value="${param.tipoSelezionato}" />
</jsp:forward>


