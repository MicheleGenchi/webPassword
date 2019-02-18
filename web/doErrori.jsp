<%-- 
    Document   : doErrori
    Created on : 15-feb-2019, 22.25.07
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.MsgBox"%>
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<%
    String messaggio = "";
    for (String msg : errori.getMsgs()) {
        //out.println("<p>" + msg + "</p>");
        messaggio = messaggio + "\n" + msg;
    }
    out.println("<p style=\"display:none\" id=\"messaggio\">" + messaggio + "</p>");
 %>
 
    <script  src = "//code.jquery.com/jquery-1.11.1.min.js" > </script> 
    <script  src = "bootstrap/bootstrap.min.js" > </script>
    <script  src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" > </script>
    <script>
        swal("Alert!", $('#messaggio').text(), "warning");
    </script>






