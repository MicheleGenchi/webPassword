<%-- 
    Document   : doLista
    Created on : 3-ago-2017, 22.27.35
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.utilita.ErrMsg"%>
<%@page import="it.genchi.password.db.TipoDAO"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="request" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<jsp:setProperty name="login" property="*" />

<%
    login.getErrore().clear();
    LoginDAO loginDAO = new LoginDAO();

    if (login.isValid()) {
        if (loginDAO.trova(login.getUtente())) {
            %><jsp:forward page="doTipo.jsp" /><%
        } else {                           
            login.getErrore().aggiungi(Errors.LoginFallito);
        }
    }
    errori.setMsgs(login.getErrore().getMsgs());
    %>
<jsp:include page="doErrori.jsp" />
<jsp:forward page="viewLogin.jsp" />






