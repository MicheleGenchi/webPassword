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
    </head>
    <body style="background-color: navy">

        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading bg-info">
                    Utente: ${login.utente.toUpperCase()}
                </div>
                <form class="panel" action="doAggiungiEmail.jsp">
                    <div class="table-responsive">
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr style="background-color: darkgray">
                                    <th scope="col" data-column-id="email" data-order="email">EMAIL</th>
                                    <th scope="col" data-column-id="password">PASSWORD</th>
                                    <th scope="col">COMANDI</th>
                                </tr>
                            </thead>

                            <tbody class="panel-heading">
                                <% //Creazione tabella righe
                                    for (EmailBean e : listaEmail.getLista()) {
                                        out.print("<tr>");
                                        out.print("<th scope=\"row\">");
                                        out.print(e.getEmail());
                                        out.print("</th>");
                                        out.print("<td>");
                                        out.print(e.getePassword());
                                        out.print("</td>");
                                        out.print("<td>");
                                        String tipo = request.getParameter("tipoSelezionato");
                                        out.print("<a href=\"viewModificaEmail.jsp?tipoSelezionato=" + tipo + "&email=" + e.getEmail() + "\"> Modifica </a>");
                                        String link = "doEliminaEmail.jsp";
                                        out.print(" - <a href=\"javascript:confermaDelete('questa email : ','" + link + "','" + tipo + "','" + e.getEmail() + "')\"> Elimina </a>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                    }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th scope="row">
                                        <input class="form-control" type="text" name="email" placeholder="digita l'email"/></th>
                                    <td><input class="form-control" type="password" name="ePassword" placeholder="digita la password associata"/>
                                        <input  type="hidden" name="utente" value="${login.utente}" />
                                        <input  type="hidden" name="tipoSelezionato" value="${param.tipoSelezionato}" /></td>
                                    <td><button class="btn btn-primary">AGGIUNGI</button></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </form>
            </div>
        </div>



        <div class="container">
            <div class="panel panel-info">
                <div class="panel-heading bg-info">
                    Gruppo : ${tipi.getTipi().get(param.tipoSelezionato)}
                </div>

                <form class="panel" action="doAggiungiSito.jsp">
                    <div class="table-responsive">
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr style="background-color: darkgrey">
                                    <th scope="col" data-column-id="idsito">IDSITO</th>
                                    <th scope="col" colspan="2" data-column-id="nome" data-order="nome">NOME</th>
                                    <th scope="col" data-column-id="utente">UTENTE</th>
                                    <th scope="col" data-column-id="password">PASSWORD</th>
                                    <th scope="col" class="comandi">COMANDI</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% //creazione tabella

                                    for (SitoBean s : listaSiti.getLista()) {
                                        out.print("<tr>");
                                        out.print("<th scope=\"row\">" + s.getIdSito() + "</th>");
                                        out.print("<td colspan=\"2\">" + s.getDescrizione() + "</td>");
                                        out.print("<td>" + s.getUtente() + "</td>");
                                        out.print("<td>" + s.getPassword() + "</td>");
                                        String tipo = request.getParameter("tipoSelezionato");
                                        out.print("<a href=\"viewModificaSito.jsp?tipoSelezionato=" + tipo + "&sito=" + s.getIdSito() + "\"> Modifica </a>");
                                        String link = "doEliminaSito.jsp";
                                        out.print("- <a href=\"javascript:confermaDelete('questo idSito : ','" + link + "','" + tipo + "','" + s.getIdSito() + "')\"> Elimina </a>");
                                        if (!s.getIndirizzo().isEmpty()) {
                                            out.print("</tr>");
                                            out.print("<tr class=\"intestazione\"><td colspan=\"5\">Indirizzo : " + s.getIndirizzo() + "</td>");
                                            out.print("</tr>");
                                        }
                                    }
                                %>
                            </tbody>
                            <tfoot>     
                                <tr>
                                    <td colspan="2"><input class="form-control" type="text" name="descrizione" placeholder="nome del sito"/></td>
                                    <td colspan="2"><input class="form-control" type="text" name="utente" placeholder="utente di login"/></td>
                                    <td><input class="form-control" type="password" name="password" placeholder="password del sito"/></td>
                                    <td rowspan="3" style="vertical-align: middle; text-align: center;"><button class="btn btn-primary">AGGIUNGI</button></td>
                                </tr>
                                <tr>
                                    <td colspan="5"><span class="input-group-addon">Url : </span>
                                        <input  class="form-control" type="text"  name="indirizzo" placeholder="home page del sito web" />
                                        <input type="hidden" name="tipoSelezionato" value="${param.tipoSelezionato}"/>
                                        <input type="hidden" name="login" value="${login.utente}"/></td>
                                </tr>
                            </tfoot>

                        </table>
                    </div>
                </form>
            </div>
        </div>    
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script  src = "//code.jquery.com/jquery-1.11.1.min.js" ></script> 
        <script  src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
        <script>
            function confermaDelete(descrizione, link, tipo, email) {
                var myLink=link;
                var myTipo=tipo;
                var myEmail=email;
                swal({
                    title: 'Conferma',
                    text: "Sei sicuro di voler cancellare ?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Cancella'
                }).then(function (isConfirm) {
                    
                    window.location.href = link + "?conferma=" + isConfirm + "&tipo=" + myTipo + "&email=" + myEmail;

                });
            };
        </script>
    </body>
</html>
