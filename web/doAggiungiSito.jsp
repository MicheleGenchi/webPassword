<%-- 
    Document   : doAggiungiSito
    Created on : 22-feb-2019, 23.06.15
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.SitoDAO"%>
<jsp:useBean id="sito" class="it.genchi.password.bean.SitoBean" scope="request" />
<jsp:setProperty name="sito" property="*" />

<%
    SitoDAO daoSito=new SitoDAO();
    if (!daoSito.aggiungi(sito))
        sito.getErrore().aggiungi(Errors.InsertFailure);
%>
<jsp:forward page="doPassword.jsp"/>
