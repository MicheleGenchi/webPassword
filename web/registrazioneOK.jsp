<%-- 
    Document   : RegistrazioneOK
    Created on : 17-feb-2019, 16.04.24
    Author     : JAVASE
--%>

<%
    out.println("<p>Registrazione avvenuta con successo!!!</p>");
%>
<script  src = "//code.jquery.com/jquery-1.11.1.min.js" ></script> 
<script  src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
<script type="text/javascript">
    //alert("prova");
    swal("Congratulazioni!", "Ora sei un utente registrato", "success");
</script>