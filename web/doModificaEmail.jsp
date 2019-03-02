<%-- 
    Document   : doModificaEmail
    Created on : 1-mar-2019, 16.19.10
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<%
    Integer idEmail = Integer.parseInt(request.getParameter("idEmail"));
    String email = request.getParameter("email");
    String password = request.getParameter("ePassword");
    EmailDAO dao = new EmailDAO();
    boolean aggiornato = dao.modifica(idEmail, email, password);
%>
<jsp:forward page="doPassword.jsp">
    <jsp:param name="tipoSelezionato" value="${param.tipoSelezionato}" />
</jsp:forward>


