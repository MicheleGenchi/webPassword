<%-- 
    Document   : viewRegistrazione
    Created on : 30-gen-2019, 16.25.23
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.ErrMsg"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />

<!DOCTYPE html>
<html>
    <head>
        <title>Registrazione nuovo utente</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>

          <%
              String  onload_string="";
            boolean registrazione = Boolean.parseBoolean(request.getParameter("registrazione"));
            if (registrazione) {
                onload_string="modifica();";
                %><jsp:include page="registrazioneOK.jsp" /><%
        } else {
            if (login.getErrore().isErr()) {
                errori.setMsgs(login.getErrore().getMsgs());
        %><jsp:include page="doErrori.jsp" /><%
        } else if (email.getErrore().isErr()) {
            errori.getMsgs().addAll(email.getErrore().getMsgs());
        %><jsp:include page="doErrori.jsp" /><%
                }
            }
        %>

    <body onload="<%= onload_string %>" style="background-color: navy">
        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">                                
                <div class="panel panel-info" >
                    <div class="panel-heading bg-info">
                        <div id="title" class="panel-title">Registrazione nuovo utente</div>
                    </div>  

                    <div style="padding-top:30px" class="panel-body" >
                        <form id="loginform" class="form-horizontal" role="form" action="doRegistrazione.jsp">
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input autofocus id="login-username" type="text" class="form-control" name="utente" value="${login.utente}" placeholder="Digita il tuo nome" />                                        
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="password" placeholder="digita la tua password" value="${login.password}" />
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input id="login-username" type="text" class="form-control" name="email" value="${email.email}" placeholder="Digitala tua email" />                                        
                                @esempio.com
                            </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="ePassword" placeholder="digita la password della email" value="${email.getePassword()}" />
                            </div>

                            <div style="margin-top:10px" class="form-group">                                <!-- Button -->
                                <div class="col-sm-12 controls">
                                    <button type="submit" id="btn-registrati"  name="conferma" class="btn btn-primary" value="registrati">Registrati</button>
                                </div>
                            </div>
                        </form>     
                    </div>                     
                </div>  
            </div>
        </div>
        <script  src = "//code.jquery.com/jquery-1.11.1.min.js" ></script> 
        <script  src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script> 
        <script type="text/javascript">
                                        function modifica() {
                                            $("#title").replaceWith("Utente già registrato");
                                            $("#loginform").attr('action','doTipo.jsp');
                                            $("#btn-registrati").html("ENTRA");
                                            swal("Congratulazioni!", "Ora sei un utente registrato \nPremi Entra per accedere con le credenziali", "success");
                                        };
        </script>
    </body>
</html>

