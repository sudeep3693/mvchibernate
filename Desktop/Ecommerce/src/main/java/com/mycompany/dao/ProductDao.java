
package com.mycompany.dao;

import com.mycompany.orm.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class ProductDao {
    
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int insertProduct( Product product){
        int pid;
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        
        pid = (int) session.save(product);
        tx.commit();
        
        
        return pid;
        
    }
}
