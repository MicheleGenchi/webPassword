<%-- 
    Document   : viewLista
    Created on : 1-ago-2017, 8.43.42
    Author     : JAVASE
--%>

<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<!DOCTYPE html>
<hmtl>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Login archivio password</title>
    </head>
    <body style="background-color: navy">
        <%
            if (login.getErrore().isErr()) {
                errori.setMsgs(login.getErrore().getMsgs());
        %><jsp:include page="doErrori.jsp" /><%
            }
        %>

        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-3 col-md-offset-4 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Accesso al programma</div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <form id="loginform" class="form-horizontal" role="form">

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input autofocus id="login-username" type="text" class="form-control" name="utente" value="${login.utente}" placeholder="Digita il nome utente">                                        
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="password" value="${login.password}" placeholder="Digita la password">
                            </div>


                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->

                                <div class="col-sm-12 controls">
                                    <button formAction="doLogin.jsp" id="btn-login" href="#" class="btn btn-success">Entra  </button>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        Non ho un account! 
                                        <button  type="submit" formaction="viewRegistrazione.jsp" id="btn-fblogin" href="#"  class="btn btn-primary">Registrami</button>
                                    </div>
                                </div>
                            </div>    
                        </form>     
                    </div>                     
                </div>  
            </div>
        </div>
    </body>
</html>


