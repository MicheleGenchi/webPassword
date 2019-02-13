<%-- 
    Document   : doPassword
    Created on : 25-gen-2019, 22.28.23
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.ErrMsg"%>
<%@page import="it.genchi.password.db.TipoDAO"%>
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />

<%
    TipoDAO dao = new TipoDAO();
    dao.fill(tipi, login.getUtente());
%>
<jsp:forward page="viewTipo.jsp" />
