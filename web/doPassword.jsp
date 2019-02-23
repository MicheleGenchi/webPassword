<%-- 
    Document   : doTipoPassword
    Created on : 27-gen-2019, 15.45.02
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<%@page import="it.genchi.password.db.SitoDAO"%>
<%@page import="it.genchi.password.db.TipoDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="listaEmail" class="it.genchi.password.bean.ListaEmailBean" scope="request" />
<jsp:useBean id="listaSiti" class="it.genchi.password.bean.ListaSitiBean" scope="request" />

<%
    String tipo=request.getParameter("tipoSelezionato");
    EmailDAO daoemail=new EmailDAO();
    daoemail.fill(listaEmail, login.getUtente());
    SitoDAO daosito=new SitoDAO();
    daosito.fill(listaSiti, login.getUtente(), tipo);
%>
<jsp:forward page="viewPassword.jsp" />