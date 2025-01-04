
package com.mycompany.dao;

import com.mycompany.orm.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class CategoryDao {
    
    
    private SessionFactory factory;
    
    public CategoryDao(SessionFactory factory)
    {
         this.factory = factory;   
    }
    
    public int insertCategory(Category category)
    {
        Session session  = factory.openSession();
        
       Transaction tx = session.beginTransaction();
       
       int catid = (int)session.save(category);
       tx.commit(); 
        return catid;
    }
    
   /* public Category fetchCategory()
    {
        Category cat;
            
        
    }*/
}
