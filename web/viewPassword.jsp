<%-- 
    Document   : viewPassword
    Created on : 1-feb-2019, 11.55.55
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.bean.SitoBean"%>
<%@page import="it.genchi.password.bean.EmailBean"%>
<%@page import="java.lang.reflect.Field"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="listaEmail" class="it.genchi.password.bean.ListaEmailBean" scope="session" />
<jsp:useBean id="listaSiti" class="it.genchi.password.bean.ListaSitiBean" scope="session" />
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="session" />
<jsp:useBean id="sito" class="it.genchi.password.bean.SitoBean" scope="session" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password</title>
    </head>
    <body>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

        <div class="container">
            <p class="titolo">Utente: ${login.utente}<p>
            <table>
                <tr class="intestazione">
                    <td style="width:300px;">email</td>
                    <td style="width:200px;">password</td>
                    <td style="width:150px;" class="comandi">Comandi</td>
                </tr>

                <% //Creazione tabella righe
                    for (EmailBean e : listaEmail.getLista()) {
                        out.print("<tr>");
                        out.print("<td  style=\"width:300px;\">");
                        out.print(e.getEmail());
                        out.print("</td>");
                        out.print("<td style=\"width:200px;\">");
                        out.print(e.getePassword());
                        out.print("</td>");
                        out.print("<td style=\"width:150px;\">");
                        out.print("<a href=\"viewModificaEmail.jsp?email=" + e.getEmail() + "\"> Modifica</a>");
                        out.print(" - <a href=\"doEliminaEmail.jsp?email=" + e.getEmail() + "\"> Elimina</a>");
                        out.print("</td>");
                        out.print("</tr>");
                    }
                %>
            </table>
            <br><br>
            <table>
                <tr class="intestazione">
                    <td>email</td><td>password</td><td class="comandi">Comandi</td>
                </tr>

                <form action="doAggiungiEmail.jsp">
                    <tr>
                        <td style="width:300px;"><Label><p><input style="width:300px" type="text" name="email" /></p></label></td>
                        <td style="width:200px;"><Label><p><input style="width:200px"  type="password" name="password" /></p></label></td>
                    <input type="hidden" name="utente" value="${login.utente}" />
                    <td style="width:150px;"><p><input class="button" type="submit" value="aggiungi email" /></p></td>
                    </tr>
                </form>
            </table>

            <p class="titolo"> tipo : ${tipi.getTipi().get(param.tipoSelezionato)}</p>  
            <table><tr class="intestazione">
                    <td>idSito</td><td>Nome</td><td>Utente</td><td>Password</td><td class="comandi">Comandi</td>
                </tr>
                <% //creazione tabella
                    for (SitoBean s : listaSiti.getLista()) {
                        out.print("<tr>");
                        out.print("<td>" + s.getIdSito() + "</td>");
                        out.print("<td>" + s.getDescrizione() + "</td>");
                        out.print("<td>" + s.getUtente() + "</td>");
                        out.print("<td>" + s.getPassword() + "</td>");
                        out.print("<td class=\"indirizzo\"><a href=\"viewModificaSito.jsp?idSito=" + s.getIdSito() + "\"> Modifica</a>");
                        out.print(" - <a href=\"doEliminaSito.jsp?idSito=" + s.getIdSito() + "\"> Elimina</a></td>");
                        if (!s.getIndirizzo().isEmpty()) {
                            out.print("</tr>");
                            out.print("<tr class=\"indirizzo\"><td colspan=\"4\">" + s.getIndirizzo() + "</td>");
                            out.print("</tr>");
                        }
                    }
                %>
            </table>
            <br><br>
            <table>
                <tr class="">
                    <td>Nome</td><td>Utente</td><td>Password</td><td class="comandi">Comandi</td>
                </tr>

                <form action="doAggiungiSito.jsp">
                    <tr>
                        <td><Label><p><input type="text" name="descrizione" /></p></label></td>
                        <td><Label><p><input type="text" name="utente" /></p></label></td>
                        <td><Label><p><input type="password" name="password" /></p></label></td>
                        <td><p><input class="button" type="submit" value="aggiungi sito" /></p></td>
                    </tr>
                    <tr class="indirizzo">
                        <td colspan="5"><Label><p>Indirizzo : <input class="indirizzo" type="text" name="indirizzo" /></p></label></td>
                    </tr>
                    <input type="hidden" name="idTipo" value="${param.tipoSelezionato}"/>
                    <input type="hidden" name="idTipo" value="${login.utente}"/>
                </form>
            </table>
        </div>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </body>
</html>
