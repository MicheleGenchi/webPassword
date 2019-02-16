<%-- 
    Document   : doErrori
    Created on : 15-feb-2019, 22.25.07
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.utilita.MsgBox"%>
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />
<%
    if (errori.isErr()) {
        String messaggio = "";
        for (String msg : errori.getMsgs()) {
            messaggio = messaggio + msg + "\n";
        }
        String title = request.getParameter("title");
        //MsgBox.show(title, messaggio);
        out.println("<p style=\"display:none\" id=\"messaggio\">" + messaggio + "</p>");

    }
%>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script>
    $( function() {
        messaggio=$("#messaggio").text();
        if (messaggio!=="")
            alert(messaggio);
    });
</script>
