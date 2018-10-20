<%-- 
    Document   : displayData
    Created on : 11 oct. 2018, 10:45:21
    Author     : fleur
--%>

<%@page import="Models.Account"%>
<%@page import="Models.Client"%>
<%@page import="Models.BankBranch"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <title>Banana</title>
    </head>
    <body>
        
            <%
            if(request.getAttribute("listAccount") != null)
            {
                List<Account> listAccount = (List<Account>) request.getAttribute("listAccount"); 
            %>
            <div class="bg-info"><h3 class="text-center">LISTE ACCOUNT</h3></div>
                <table class="table">
                <thead>
                  <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Libelle</th>
                    <th scope="col">IBAN</th>
                    <th scope="col">Oseille</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                for (Account account: listAccount)
                {
                %>
                  <tr>
                    <th scope="row"><%=account.getNum_compte()%></th>
                    <td><%=account.getLibelle()%></td>
                    <td><%=account.getIBAN()%></td>
                    <td><%=account.getSolde()%></td>
                    <td><a href="${pageContext.request.contextPath}/servletAccount?delete=<%=account.getNum_compte()%>"><span class="fa fa-trash" style="color:red;"></span></a></td>
                  </tr>
                  <%
                }
                 %>
            </tbody>
        </table>
                 <%
            }
              %>
              
              
     
       <%
            if(request.getAttribute("listClient") != null)
            {
                List<Client> listClient = (List<Client>) request.getAttribute("listClient"); 
            %>
            <div class="bg-info"><h3 class="text-center">LISTE CLIENTS</h3></div>
                <table class="table">
                <thead>
                  <tr>
                    <th scope="col">ID client</th>
                    <th scope="col">NOM</th>
                    <th scope="col">PRENOM</th>
                    <th scope="col">DATE</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <%
                for (Client client: listClient)
                {
                %>
                  <tr>
                    <th scope="row"><%=client.getNumClient()%></th>
                    <td><%=client.getNomClient()%></td>
                    <td><%=client.getPrenomClient()%></td>
                    <td><%=client.getDateNaiss()%></td>
                    <td><a href="${pageContext.request.contextPath}/servletClient?delete=<%=client.getNumClient()%>"><span class="fa fa-trash" style="color:red;"></span></a></td>
                  </tr>
                  <%
                }
                 %>
            </tbody>
        </table>
                 <%
            }
              %>
              
              
     
       <%
            if(request.getAttribute("listBank") != null)
            {
                List<BankBranch> listBank = (List<BankBranch>) request.getAttribute("listBank"); 
            %>
            <div class="bg-info"><h3 class="text-center">LISTE DES BANKS</h3></div>
                <table class="table">
                <thead>
                  <tr>
                    <th scope="col">ID BANK</th>
                    <th scope="col">ADRESSE BANK</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                <%
                for (BankBranch bank: listBank)
                {
                %>
                  <tr>
                    <th scope="row"><%=bank.getCodeAgence()%></th>
                    <td><%=bank.getAdresse()%></td>
                    <td><a href="${pageContext.request.contextPath}/servletBank?delete=<%=bank.getCodeAgence()%>"><span class="fa fa-trash" style="color:red;"></span></a></td>
                  </tr>
                  <%
                }
                 %>
            </tbody>
        </table>
                 <%
            }
              %>
    </body>
</html>
