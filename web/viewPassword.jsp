<%-- 
    Document   : viewPassword
    Created on : 1-feb-2019, 11.55.55
    Author     : JAVASE
--%>

<%@page import="it.genchi.password.bean.SitoBean"%>
<%@page import="it.genchi.password.bean.EmailBean"%>
<%@page import="java.lang.reflect.Field"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="listaEmail" class="it.genchi.password.bean.ListaEmailBean" scope="request" />
<jsp:useBean id="listaSiti" class="it.genchi.password.bean.ListaSitiBean" scope="request" />
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />
<jsp:useBean id="email" class="it.genchi.password.bean.EmailBean" scope="request" />
<jsp:useBean id="sito" class="it.genchi.password.bean.SitoBean" scope="request" />
<jsp:useBean id="errori" class="it.genchi.password.utilita.ErrMsg" scope="request" />

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pagina di visualizzazione delle password</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>

        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading bg-info">
                    Utente: ${login.utente.toUpperCase()}
                </div>
                <form class="panel" action="doAggiungiEmail.jsp">
                    <table class="table table-condensed table-hover table-striped">
                        <thead>
                            <tr>
                                <th data-column-id="email" data-order="email">EMAIL</th>
                                <th data-column-id="password">PASSWORD</th>
                                <th class="comandi">COMANDI</th>
                            </tr>
                        </thead>

                        <tbody class="panel-heading">
                            <% //Creazione tabella righe
                                for (EmailBean e : listaEmail.getLista()) {
                                    out.print("<tr>");
                                    out.print("<td>");
                                    out.print(e.getEmail());
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print(e.getePassword());
                                    out.print("</td>");
                                    out.print("<td>");
                                    out.print("<a href=\"viewModificaEmail.jsp?email=" + e.getEmail() + "\"> Modifica</a>");
                                    out.print(" - <a href=\"doEliminaEmail.jsp?email=" + e.getEmail() + "\"> Elimina</a>");
                                    out.print("</td>");
                                    out.print("</tr>");
                                }
                            %>

                            <tr>
                                <td><input class="form-control" type="text" name="email" placeholder="digita l'email"/></td>
                                <td><input class="form-control" type="password" name="ePassword" placeholder="digita la password associata"/>
                                    <input  type="hidden" name="utente" value="${login.utente}" />
                                    <input type="hidden" name="tipoSelezionato" value="${param.tipoSelezionato}" /></td>
                                <td><button class="btn btn-primary">AGGIUNGI</button></td>

                            </tr>
                        </tbody>
                    </table>
                </form>
                <br/><br/>


                <div class="panel panel-info">
                    <div class="panel-heading bg-info">Gruppo : ${tipi.getTipi().get(param.tipoSelezionato)}</div>
                </div> 
                <form action="doAggiungiSito.jsp">
                    <table class="table table-condensed table-hover table-striped">
                        <thead class="intestazione">
                            <tr>
                                <th data-column-id="idsito">IDSITO</th>
                                <th colspan="2" data-column-id="nome">NOME</th>
                                <th data-column-id="utente">UTENTE</th>
                                <th data-column-id="password">PASSWORD</th>
                                <th class="comandi">COMANDI</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% //creazione tabella
                                for (SitoBean s : listaSiti.getLista()) {
                                    out.print("<tr>");
                                    out.print("<td>" + s.getIdSito() + "</td>");
                                    out.print("<td colspan=\"2\">" + s.getDescrizione() + "</td>");
                                    out.print("<td>" + s.getUtente() + "</td>");
                                    out.print("<td>" + s.getPassword() + "</td>");
                                    out.print("<td class=\"indirizzo\"><a href=\"viewModificaSito.jsp?idSito=" + s.getIdSito() + "\"> Modifica</a>");
                                    out.print(" - <a href=\"doEliminaSito.jsp?idSito=" + s.getIdSito() + "\"> Elimina</a></td>");
                                    if (!s.getIndirizzo().isEmpty()) {
                                        out.print("</tr>");
                                        out.print("<tr class=\"intestazione\"><td colspan=\"5\">Indirizzo : " + s.getIndirizzo() + "</td>");
                                        out.print("</tr>");
                                    }
                                }
                            %>
                            <tr>     
                                <td><input class="form-control" type="text" name="descrizione" placeholder="nome del sito"/></td>
                                <td><input class="form-control" type="text" name="utente" placeholder="utente di login"/></td>
                                <td><input class="form-control" type="password" name="password" placeholder="password del sito"/></td>
                            </tr>
                            <tr>
                            <tr class="input-group">
                                <td><span class="input-group-addon">Url : </span>
                                    <input  class="form-control" type="text"  name="indirizzo" placeholder="home page del sito web" /></td>
                            </tr>
                            <tr>
                                <td><center><button class="btn btn-primary">AGGIUNGI</button></center>
                        <input type="hidden" name="idTipo" value="${param.tipoSelezionato}"/>
                        <input type="hidden" name="idTipo" value="${login.utente}"/></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>      
    </body>
</html>
