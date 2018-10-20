package DAO;

import java.util.List;
import javax.persistence.*;

/**
 * 
 * @author fleur
 * @param <T> an Entity
 */
public abstract class IDAO<T> 
{
    // get EntityManager
    final EntityManagerFactory emf = Persistence.createEntityManagerFactory("banqueTP_ORMPU");
    final EntityManager em = emf.createEntityManager();
    
    /**
     * Insert a Generic new tuple into database.
     * 
     * @param newTuple an instance of Entity
     * @return true if persistence is okay, else return false.
     */
    public boolean insert(T newTuple) {        
        em.getTransaction().begin();
        try 
        {            
            em.persist(newTuple);
        } catch (Exception e)
        {
            return false;
        }
        em.getTransaction().commit();
        return true;
    }

    /**
     * 
     * @return a list of entities 
     */
    public abstract List<T> getAll();

    /**
     * 
     * @param id an identifier
     * @return an Entity
     */
    public abstract T getByID(int id);

    /**
     * Update an Entity.
     * 
     * @param TupleToUpdate the entity to update
     * @return true if update is well executed, else return false
     */
    public boolean update(T TupleToUpdate)
    {        
        em.getTransaction().begin();
        try
        {        
            em.merge(TupleToUpdate);
        } catch (Exception e) 
        {
            return false;
        }        
        mmit();
        return true;
    }

    /**
     * Remove an Entity.
     * 
     * @param TupleToBeRemoved a reference to the object to remove
     * @return true if remove is well executed, else return false
     */
    public boolean remove(T TupleToBeRemoved)
    {        
        em.getTransaction().begin();
        try 
        {            
            em.remove(TupleToBeRemoved);
        } catch (Exception e)
        {
            System.out.println(e);
            return false;
        }        
        em.getTransaction().commit();
        return true;
    }

}
