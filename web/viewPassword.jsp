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
    </head>
    <body onload="resetEmailForm()" style="background-image: ">
        <div class="container">
            <div class="panel panel-heading"> 
                <center><h2 style="vertical-align: middle"><span><a href="viewLogin.jsp"><img src="home.png" /></a></span> ARCHIVIO DELLE MIE PASSWORD  </h2></center>
            </div>
            <div class="panel panel-info">
                <div class="panel-heading bg-info">
                    Utente: ${login.utente.toUpperCase()}
                </div>
                <form id="formEmail" class="panel" action="doAggiungiEmail.jsp">
                    <div class="table-responsive">
                        <table class="table table-condensed table-hover">
                            <thead>
                                <tr style="background-color: darkgray">
                                    <th style="width:80px" scope="col" data-column-id="idEmail">ID</th>
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
                                        out.print(e.getIdEmail());
                                        out.print("</th>");
                                        out.print("<td>");
                                        out.print(e.getEmail());
                                        out.print("</td>");
                                        out.print("<td>");
                                        out.print(e.getePassword());
                                        out.print("</td>");
                                        out.print("<td>");
                                        String tipo = request.getParameter("tipoSelezionato");
//                                      out.print("<a href=\"viewModificaEmail.jsp?tipoSelezionato=" + tipo + "&email=" + e.getEmail() + "\"> Modifica </a>");
                                        out.print("<a href=\"#\" onclick=\"modificaEmail('" + e.getIdEmail() + "','" + e.getEmail() + "','" + e.getePassword() + "')\"> Modifica </a>");
                                        String link = "doEliminaEmail.jsp";
                                        out.print(" - <a href=\"javascript:confermaDelete('" + e.getEmail() + "','" + link + "','" + tipo + "','" + e.getIdEmail() + "')\"> Elimina </a>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                    }
                                %>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan=2 scope="row">
                                        <input id="idEmail" type="hidden" name="idEmail" />
                                        <input id="temail" class="form-control" type="text" name="email" placeholder="digita l'email"/></th>
                                    <td><input id="tpassword" class="form-control" type="password" name="ePassword" placeholder="digita la password associata"/>
                                        <input  type="hidden" name="utente" value="${login.utente}" />
                                        <input  type="hidden" name="tipoSelezionato" value="${param.tipoSelezionato}" /></td>
                                    <td><button type="submit" id="tnewEmail" class="btn btn-primary">AGGIUNGI</button>
                                    <button type="button" id="annullaModificaEmail" class="btn btn-success" onclick="resetEmailForm()">ANNULLA</button></td>
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
                                        out.print("<td>");
                                        String tipo = request.getParameter("tipoSelezionato");
                                        out.print("<a href=\"viewModificaSito.jsp?tipoSelezionato=" + tipo + "&sito=" + s.getIdSito() + "\"> Modifica </a>");
                                        String link = "doEliminaSito.jsp";
                                        out.print("- <a href=\"javascript:confermaDelete('" + s.getDescrizione() + "','" + link + "','" + tipo + "','" + s.getIdSito() + "')\"> Elimina </a>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                        if (!s.getIndirizzo().isEmpty()) {
                                            out.print("<th class=\"intestazione\"><td colspan=\"5\">Indirizzo : " + s.getIndirizzo() + "</td></th>");
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
        <script  src = "//code.jquery.com/jquery-1.11.1.min.js" ></script> 
        <script  src = "https://unpkg.com/sweetalert/dist/sweetalert.min.js" ></script>
        <script>
            function confermaDelete(descrizione, link, tipo, any) {
                var desc = descrizione;
                var myLink = link;
                var myTipo = tipo;
                var myAny = any; // chiave primaria di eliminazione es. email=email, sito=idSito
                swal({
                    title: 'Conferma cancellazione',
                    text: 'Sei sicuro di voler cancellare ' + desc,
                    icon: 'warning',
                    buttons: true,
                    dangerMode: true,
                }).then((willDelete) => {
                    if (willDelete)
                        window.location.href = link + "?conferma=" + willDelete + "&tipoSelezionato=" + myTipo + "&any=" + myAny;
                });
            }
            ;

            function resetEmailForm() {
                $("#annullaModificaEmail").hide();
                $("#idEmail").attr('value', "");
                $("#temail").attr('value', "");
                $("#tpassword").attr('value', "");
                $('#tnewEmail').text("Aggiungi");
                $("#formEmail").attr('action', 'doAggiungiEmail.jsp');
            }

            function modificaEmail(idEmail, oldEmail, oldPassword) {
                $("#annullaModificaEmail").show();
                $("#idEmail").attr('value', idEmail);
                $("#temail").attr('value', oldEmail);
                $("#tpassword").attr('value', oldPassword);
                $('#tnewEmail').text("Modifica");
                $("#formEmail").attr('action', 'doModificaEmail.jsp');
            }
            ;
        </script>
    </body>
</html>
