package DAO;

import Models.BankBranch;
import java.util.List;
import javax.persistence.Query;

/**
 *
 * @author fleur
 */
public class DAO_BankBranch extends IDAO<BankBranch> {

    public static final DAO_BankBranch instanceDAO = new DAO_BankBranch();
    
    public static DAO_BankBranch getInstance(){
        return  instanceDAO;
    }
    
    @Override
    public List<BankBranch> getAll() {
        Query q = em.createQuery("select e from BankBranch e");
        return q.getResultList();
    }

    @Override
    public BankBranch getByID(int id) {
        BankBranch b = em.find(BankBranch.class, id);
        if(b == null){
            return null;
        }
        return b;

    }

}
