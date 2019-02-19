<%-- 
    Document   : RegistrazioneOK
    Created on : 17-feb-2019, 16.04.24
    Author     : JAVASE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Congratulazioni!</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-css">
        <link href="custom.css" rel="stylesheet" type="text/css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-6">
                    <div class="alert alert-success">

                        <span class="glyphicon glyphicon-ok"></span> <strong>Congratulazioni!</strong>
                        <hr class="message-inner-separator">
                        <p>Ora sei un utente registrato al programma password...</p><br/>
                        
                        <div class="col-sm-12 controls">
                            <a href="doTipo.jsp"><button type="button" class="btn btn-success" data-dismiss="alert" aria-hidden="true">
                                    CHIUDI</button></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
