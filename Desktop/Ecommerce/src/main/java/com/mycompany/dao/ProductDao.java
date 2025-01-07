
package com.mycompany.dao;

import com.mycompany.orm.Product;
import java.util.List;
import org.hibernate.Query;
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
        session.close();
        return pid;  
    }
    
    public int countProducts(){
        int no=0;
        Session s = factory.openSession();
        
        Query q = s.createQuery("from Product");
        
        List <Product> list = q.list();
        
        for(Product p: list){
            no++;
        }
        
        s.close();
        return no;
    }
}
