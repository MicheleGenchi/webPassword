<%-- 
    Document   : viewPassword
    Created on : 23-gen-2019, 21.07.47
    Author     : JAVASE
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="it.genchi.password.bean.TipoBean"%>
<%@page import="java.util.Formatter"%>
<jsp:useBean id="login" class="it.genchi.password.bean.LoginBean" scope="session" />
<jsp:useBean id="tipi" class="it.genchi.password.bean.MapTipoBean" scope="session" />
<jsp:setProperty name="login" property="*" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <title>Pagina di scelta del gruppo</title>
    </head>
    <body style="background-color: navy">

        <div class="container">  
            <div class="container">    
                <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">                                
                    <div class="panel panel-info" >
                        <div class="panel-heading bg-info">
                            <div class="panel-title">Le password sono divise in gruppi:</div><br/>
                            <div class="panel panel-info">
                                Utente : ${login.utente}
                            </div> 
                        </div>  

                        <div style="padding-top:30px" class="panel-body" >
                            <form id="formGruppo" class="form-horizontal" role="form" action="doPassword.jsp">
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon">Gruppo:</span>
                                    <select autofocus class="form-control inputstl" id="inputGroupSelect04" aria-label="Selezionare il gruppo" name="tipoSelezionato">
                                        <option  value="" selected>Seleziona un gruppo...</option>
                                        <%
                                            /* viene generato l'elenco delle option, interrogando il contenuto
                                                 * della enum Continenti. In quella corrispondente al valore del bean,
                                                 * si aggiunge anche la clausola selected */
                                            for (Entry<String, String> tipo : tipi.getTipi().entrySet()) {
                                                Formatter f = new Formatter();
                                                f.format("<option id=\"tipo\" value=\"%s\" %s>%s</option>",
                                                        tipo.getKey(),
                                                        tipo.getKey().equals(request.getParameter("tipoSelezionato")) ? "selected=\"selected\"" : "",
                                                        tipo.getValue());

                                                out.println(f.toString());
                                            }
                                        %>
                                    </select>
                                </div>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <div class="col-sm-12 controls">
                                        <button type="submit" id="sceltaGruppo" class="btn btn-success">Visualizza le password</button>
                                    </div>
                                </div>
                            </form>        
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                var $submit = $('#sceltaGruppo');
                var $selects = $('#inputGroupSelect04');

                $submit.on("click", function () {
                    $('#formGruppo').submit();
                });

                $selects
                        .on("change", function () {
                            var $not_selected = $selects.filter(function () {
                                return !$(this).val();
                            });
                            $submit.prop('disabled', $not_selected.length ? true : false);
                        })
                        .first()
                        .triggerHandler('change');
            });
        </script>
    </body>
</html>
