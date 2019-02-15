<%-- 
    Document   : doAggiungiEmail
    Created on : 14-feb-2019, 23.23.47
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<%@page import="it.genchi.password.utilita.MsgBox"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />
<jsp:setProperty name="email" property="*" />

<%
    EmailDAO dao=new EmailDAO();
    dao.aggiungi(email);
%>
<jsp:forward page="doPassword.jsp"/>;

