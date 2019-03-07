<%-- 
    Document   : doModificaEmail
    Created on : 1-mar-2019, 16.19.10
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.SitoDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="sito" class="it.genchi.password.bean.SitoBean" scope="request" />
<jsp:setProperty name="sito" property="*" />
<jsp:setProperty name="sito" property="idTipo" param="tipoSelezionato" />          
<%
    SitoDAO dao = new SitoDAO();
    boolean aggiornato = dao.modifica(sito);
%>
<jsp:forward page="doPassword.jsp">
    <jsp:param name="tipoSelezionato" value="${param.tipoSelezionato}" />
</jsp:forward>


