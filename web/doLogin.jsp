<%-- 
    Document   : doLista
    Created on : 3-ago-2017, 22.27.35
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.utilita.ErrMsg"%>
<%@page import="it.genchi.password.db.TipoDAO"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />

<%
    LoginDAO loginDAO = new LoginDAO();
    String button = request.getParameter("conferma");
    login.getErrore().clear();
    
    switch (button) {
        case "Nuovo":
        %><jsp:forward page="viewRegistrazione.jsp" /><%
        case "Entra": 
            if (login.isValid() && loginDAO.trovato(login)) {
                %><jsp:forward page="doTipo.jsp" /><%
                } else {
                    login.getErrore().aggiungi(Errors.LoginFallito);
                %><jsp:forward page="viewLogin.jsp" /><%
                }
    }

%>





