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
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    </head>
    <body>


        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading bg-info">
                    Utente: ${login.utente.toUpperCase()}
                </div>
                <table class="table table-condensed table-hover table-striped">
                    <thead>
                        <tr class="intestazione">
                            <th data-column-id="email" data-order="email">EMAIL</th>
                            <th data-column-id="password">PASSWORD</th>
                            <th class="comandi">COMANDI</th>
                        </tr>
                    </thead>

                    <tbody>
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

                    <form action="doAggiungiEmail.jsp">
                        <tr>
                            <td><input class="form-control" type="text" name="email" /></td>
                            <td><input class="form-control" type="password" name="password" /></td>
                        <input  type="hidden" name="utente" value="${login.utente}" />
                        <td><button class="btn btn-primary">AGGIUNGI</button></td>
                        </tr>
                    </form>
                    </tbody>
                </table>
                <br/><br/>


                <div class="panel panel-info">
                    <div class="panel-heading bg-info">Gruppo password : ${tipi.getTipi().get(param.tipoSelezionato)}</div>
                </div>                            
                <table class="table table-condensed table-hover table-striped">
                    <thead>
                        <tr class="intestazione">
                            <th data-column-id="idsito">IDSITO</th>
                            <th data-column-id="nome">NOME</th>
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
                                out.print("<td>" + s.getDescrizione() + "</td>");
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

                    <form action="doAggiungiSito.jsp">
                        <tr>
                            <td><input class="form-control" type="text" name="descrizione" /></td>
                            <td><input class="form-control" type="text" name="utente" /></td>
                            <td><input class="form-control" type="password" name="password" /></td>
                            <td><button class="btn btn-primary">AGGIUNGI</button></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Indirizzo : </span>
                                    </div>
                                    <input type="text"  name="indirizzo" class="form-control" placeholder="Username" aria-label="Indirizzo" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <input type="hidden" name="idTipo" value="${param.tipoSelezionato}"/>
                        <input type="hidden" name="idTipo" value="${login.utente}"/>
                    </form>
                    </tbody>
                </table>
            </div>
        </div>                
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </body>
</html>
