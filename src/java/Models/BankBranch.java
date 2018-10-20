package Models;


import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author fleur
 */

@Entity
public class BankBranch implements Serializable {
    
    @Id
    @Column(length = 5, nullable = false)
    private int codeAgence;
    
    @Column(nullable = false)
    private String adresse;

    public BankBranch() {
    }

    public int getCodeAgence() {
        return codeAgence;
    }

    public void setCodeAgence(int codeAgence) {
        this.codeAgence = codeAgence;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    @Override
    public String toString() {
        return "BankBranch{" + "codeAgence=" + codeAgence + ", adresse=" + adresse + '}';
    }
    
    
    
    
    
}
