<%-- 
    Document   : doRegistration
    Created on : 30-gen-2019, 16.51.11
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.Errors"%>
<%@page import="it.genchi.password.db.LoginDAO"%>
<%@page import="it.genchi.password.db.EmailDAO"%>
<jsp:useBean id="registration" class="it.genchi.password.bean.RegistrationBean" scope="request" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="loginreg" class="it.genchi.password.bean.LoginBean" scope="request" />
<jsp:setProperty name="loginreg" property="*" />
<jsp:setProperty name="email" property="*" />
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
<script>
    function alertRegistrato() {
        var registrato =<%=request.getParameter("registrato")%>;
        swal("Congratulazioni!", registarto, "success");
        $("#btn-registrati").html("Entra " + registrato);
        $("#loginform").attr('action', 'doTipo.jsp');
    };
</script> 
<%
    LoginDAO daoLogin = new LoginDAO();
    EmailDAO daoEmail = new EmailDAO();
    if (loginreg.isValid()) {
        boolean esiste = daoLogin.trova(loginreg.getUtente());
        if (esiste) {
            loginreg.getErrore().aggiungi(Errors.DuplicateUtente);
        } else {
            if (!email.isValid()) {
                email.getErrore().aggiungi(Errors.InvalidEmail);
            } else {
                esiste = daoEmail.trova(email.getEmail());
                if (esiste) {
                    email.getErrore().aggiungi(Errors.DuplicateEmail);
                }
            }
        }
    }

    if (!loginreg.getErrore().isErr() && !email.getErrore().isErr()) {
        login = loginreg;
        daoLogin.aggiungi(login);
        daoEmail.aggiungi(email);
%><script>alertRegistrato();</script><%
            }
%>
<jsp:forward page="viewRegistrazione.jsp" />






