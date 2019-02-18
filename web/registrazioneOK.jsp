<%-- 
    Document   : RegistrazioneOK
    Created on : 17-feb-2019, 16.04.24
    Author     : JAVASE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body>

        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $().ready(function() {
                swal("Congratulazione!","Utente registrato con successo...","success");
            });
        </script>
    </body>
