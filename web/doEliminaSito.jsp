<%-- 
    Document   : doEliminaSito
    Created on : 1-mar-2019, 14.43.45
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.SitoDAO"%>
<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:setProperty name="email" property="*" />

<%
    Boolean conferma = (Boolean) Boolean.parseBoolean(request.getParameter("conferma"));
    String tipo = request.getParameter("tipoSelezionato");
    Integer sitoDaEliminare = Integer.parseInt(request.getParameter("any"));
    if (conferma) {
        SitoDAO dao = new SitoDAO();
        if (!dao.elimina(sitoDaEliminare)) {
            email.getErrore().aggiungi(Errors.InsertFailure);
        }
    }
%>
<jsp:forward page="doPassword.jsp">
    <jsp:param name="tipoSelezionato" value="${param.tipoSelezionato}"  />
</jsp:forward>
