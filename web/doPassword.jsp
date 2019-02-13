<%-- 
    Document   : doTipoPassword
    Created on : 27-gen-2019, 15.45.02
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.db.EmailDAO"%>
<%@page import="it.genchi.password.db.SitiDAO"%>
<%@page import="it.genchi.password.db.TipoDAO"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="listaEmail" class="it.genchi.password.bean.ListaEmailBean" scope="session" />
<jsp:useBean id="listaSiti" class="it.genchi.password.bean.ListaSitiBean" scope="session" />
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />

<%
    String tipo=request.getParameter("tipoSelezionato");
    EmailDAO daoemail=new EmailDAO();
    daoemail.fill(listaEmail, login.getUtente());
    SitiDAO daositi=new SitiDAO();
    daositi.fill(listaSiti, login.getUtente(), tipo);
%>
<jsp:forward page="viewPassword.jsp" />