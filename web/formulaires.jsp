<%@page import="Models.Account"%>
<%@page import="java.util.List"%>
<%@page import="Models.BankBranch"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Banana</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div>
                <h1>TP1</h1>
                <br>
                <div class="row text-center">
                    <div class="col"><a href="${pageContext.request.contextPath}/servletDisplayAll?entity=client"> LIST CLIENT</a></div>
                    <div class="col"><a href="${pageContext.request.contextPath}/servletDisplayAll?entity=bankbranch">LIST BANK</a></div>
                    <div class="col"><a href="${pageContext.request.contextPath}/servletDisplayAll?entity=account">LIST ACCOUNT</a></div>
                </div>
            </div>
  
            <div class="row">
                <!-- CLIENT FORM -->
                <div class="col">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/servletClient" method="POST" >
                        <fieldset>
                            
                            <legend class="text-center">Création client</legend>
                            
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="bank_id"> Nom </label>  
                                <div class="col">
                                    <input name="nomClient" type="text" placeholder="Nom" class="form-control input-md" required> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Prénom</label>  
                                <div class="col">
                                    <input name="prenomClient" type="text" placeholder="Prénom" class="form-control input-md" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="numClient">Numéro client </label>  
                                <div class="col">
                                    <input name="numClient" type="text" placeholder="12345678" class="form-control input-md" required maxlength=8 minlength="8">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Account : </label>  
                                <div class="col">
                                    <select name="account" style="border-radius: 5px;">
                                        <%
                                            List<Account> listAccount = (List<Account>) request.getAttribute("listAccount");
                                            for (Account account : listAccount) {
                                                String AccountCode = account.getNum_compte();
                                                String AccountLibelle = account.getLibelle();
                                        %>
                                        <option value="<%=AccountCode%>"><%=AccountLibelle%></option>
                                        <%
                                            }
                                        %>

                                    </select>
                                </div>
                            </div>

                            <button type="submit" class=" float-right">Crréer client </button>
                        </fieldset>
                    </form>
                </div>

        
                <div class="col">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/servletBank" method="POST" >
                        <fieldset>
                            
                            <legend class="text-center">Ajout bankBranch</legend>

                            
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="bank_id">Adresse</label>  
                                <div class="col">
                                    <input name="adresse" type="text" placeholder="Adresse" class="form-control input-md">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Code</label>  
                                <div class="col">
                                    <input name="codeAgence" type="text" placeholder="12345" class="form-control input-md" maxlength=5 minlength=5>
                                </div>
                            </div>
                            <button type="submit" class="float-right">Créer</button>
                        </fieldset>
                    </form>
                </div>

                
                <div class="col">                
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/servletAccount" method="POST">
                        <fieldset>
                            
                            <legend class="text-center">Créer Account</legend>

                            <!-- Numero compte input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="bank_id">Numero</label>  
                                <div class="col">
                                    <input name="num_compte" type="text" placeholder="564654" class="form-control input-md" required maxlength=11  minlength=11>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">IBAN </label>  
                                <div class="col">
                                    <input name="IBAN" type="text" placeholder="IBAN" class="form-control input-md" required maxlength=27 minlength=27> 
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput"><span class="fas fa-tag"></span> Libelle : </label>  
                                <div class="col">
                                    <input name="libelle" type="text" placeholder="Libellet" class="form-control input-md" required>
                                </div>
                            </div>

                            
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Oseille</label>  
                                <div class="col">
                                    <input name="solde" type="text" placeholder="123456" class="form-control input-md" required maxlength=10> 
                                </div>
                            </div>

                        
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">Bank</label>  
                                <div class="col">
                                    <select name="bank" style="border-radius: 5px;">
                                        <%
                                            List<BankBranch> listBank = (List<BankBranch>) request.getAttribute("listBank");
                                            for (BankBranch bank : listBank) {
                                                int FieldCode = bank.getCodeAgence();
                                                String FieldAdresse = bank.getAdresse();
                                        %>
                                        <option value="<%=FieldCode%>"><%=FieldAdresse%></option>
                                        <%
                                            }

                                        %>

                                    </select> 
                                </div>
                            </div>
                            <button type="submit" class="float-right">Créer</button>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
