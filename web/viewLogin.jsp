<%-- 
    Document   : viewLista
    Created on : 1-ago-2017, 8.43.42
    Author     : JAVASE
--%>

<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<!DOCTYPE html>
<html>
    <head>
        <title>Login archivio password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body class="bg-dark">
        <%

            if (login.getErrore().isErr()) {
                errori.setMsgs(login.getErrore().getMsgs());
                %><jsp:include page="doErrori.jsp" /><%
            }
        %>

        <div class="container">    
            <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-3 col-md-offset-4 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >
                    <div class="panel-heading bg-info">
                        <div class="panel-title">Archivio password</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >
                        <form id="loginform" class="form-horizontal" role="form">
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name="utente" value="${login.utente}" placeholder="digita l'utente" />                                        
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="password" value="${login.password}" placeholder="digitare la password" />
                            </div>

                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->

                                <div class="col-sm-12 controls">
                                    <button type="submit" formAction="doLogin.jsp" id="btn-login" name="conferma"  value="Entra" class="btn btn-success">Login  </button>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        Non sei un'utente registrato! 
                                        <button  formAction="viewRegistrazione.jsp" type="submit" class="btn btn-primary" name="conferma" value="Nuovo">Registrami</button> 
                                    </div>
                                </div>
                            </div>    
                        </form>     
                    </div>                     
                </div>  
            </div>
        </div>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="bootstrap/bootstrap.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </body>
</html>


