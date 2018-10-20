package Controllers;

import DAO.*;
import Models.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fleur
 */
@WebServlet(name = "servletClient", urlPatterns = {"/servletClient"})
public class servletClient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String prenom = request.getParameter("prenomClient");
        String nom = request.getParameter("nomClient");
        int num_client = Integer.parseInt(request.getParameter("numClient"));
        String num_account = request.getParameter("account");
        try (PrintWriter out = response.getWriter()) {
            DAO_Client client_dao = DAO_Client.getInstance();
            Client client = new Client();
            client.setNomClient(nom);
            client.setPrenomClient(prenom);
            client.setNumClient(num_client);

            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.YEAR, 1988);
            cal.set(Calendar.MONTH, Calendar.JANUARY);
            cal.set(Calendar.DAY_OF_MONTH, 1);
            client.setDateNaiss(cal.getTime());

            DAO_Account account_dao = DAO_Account.getInstance();
            Account account = account_dao.getByID(num_account);
            account.setClients(client);
            client.setAccounts(account);
            boolean c = client_dao.insert(client);
            boolean a = account_dao.update(account);
            if (c && a) {
                out.print("\nInsertion OK");
                String url = request.getRequestURL().toString();
                String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
                response.sendRedirect(baseURL);
            } else {
                out.print("\nInsertion KO");
            }
        } catch (Exception e) {

        }
        processRequest(request, response);
    }
    
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        int NumClient = 0;
        if(request.getParameter("delete")!= null){
            NumClient = Integer.parseInt(request.getParameter("delete"));
        }
        if(NumClient!= 0)
        {
             try (PrintWriter out = response.getWriter()) {
                DAO_Client dao_client = DAO_Client.getInstance();
                Client client = dao_client.getByID(NumClient);
                boolean remove = dao_client.remove(client);
                if(remove)
                {
                    out.println("Delete OK");
                }else{
                    out.println("Delete KO");
                }
            } catch (Exception e) {
            }
        }
        processRequest(request, response);
    }    
}
