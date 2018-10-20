package DAO;

/**
 *
 * @author fleur
 */
import Models.BankBranch;
import Models.Client;
import Models.Account;
import java.util.*;
import javax.persistence.*;

public class DAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("banqueTP_ORMPU");
    private EntityManager em = emf.createEntityManager();

    /*
    @PersistenceContext(unitName = "banqueTP_ORMPU")
    private EntityManager em;
     */
    public void test() {
        DAO_BankBranch dbank = DAO_BankBranch.getInstance();
        DAO_Account daccount = DAO_Account.getInstance();
        DAO_Client dclient = DAO_Client.getInstance();

        BankBranch agence1 = new BankBranch();
        agence1.setAdresse("ddddddd");
        agence1.setCodeAgence(11111);
        BankBranch agence2 = new BankBranch();
        agence2.setAdresse("eeeeeee");
        agence2.setCodeAgence(22222);
        
        dbank.insert(agence1);
        dbank.insert(agence2);

        Client client1 = new Client();
        client1.setNomClient("Nom1");
        client1.setPrenomClient("Prenom1");
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.YEAR, 1988);
        cal.set(Calendar.MONTH, Calendar.JANUARY);
        cal.set(Calendar.DAY_OF_MONTH, 1);

        client1.setDateNaiss(cal.getTime());

        Client client2 = new Client();
        client2.setNomClient("Nom2");
        client2.setPrenomClient("Prenom2");
        cal.set(Calendar.YEAR, 2006);
        cal.set(Calendar.MONTH, Calendar.FEBRUARY);
        cal.set(Calendar.DAY_OF_MONTH, 27);

        client2.setDateNaiss(cal.getTime());

        dclient.insert(client1);
        dclient.insert(client2);


        Account a1 = new Account();
        a1.setNum_compte("7DJFY362ND");
        a1.setClients(client1);
        a1.setClients(client2);
        a1.setAgence(agence1);
        a1.setIBAN("jdwqdisnrabmdzqqtseewfvzuqy");
        a1.setLibelle("sdfsdfdsf");
        a1.setSolde(1122);

        client1.setAccounts(a1);
        client2.setAccounts(a1);

        daccount.insert(a1);
        



        //dclient.remove(client1);
        //dclient.remove(client2);
        
        
        //daccount.remove(a1);
        //d.remove(agence1);
        //em.persist(agence1);
        //em.persist(agence2);
        

        //em.getTransaction().commit();
        //Query q = em.createQuery("select e from BankBranch e");
        //Query q = em.createQuery("from BANKBRANCH e", BankBranch.class);
        /*
            agence1.setAdresse("xoxo");
            d.update(agence1);
            
            for(int i=0; i<d.getAll().size(); i++){
                System.out.println(d.getAll().get(i));
            }  */
    }

}
