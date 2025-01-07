
package com.mycompany.dao;

import com.mycompany.orm.Category;
import java.util.List;
import javax.persistence.TemporalType;
import org.hibernate.Query;
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
    
    public List<Category> fetchCategories()
    {

        Session session  = this.factory.openSession();
       
        Query q = session.createQuery("from Category");
        List <Category> list = q.list();
        session.close();
    
        return list;
    }
 
    
    public Category getCategoryById(int cid)
    {
        Category cat=null;
        try{
           Session session=  factory.openSession();
           cat = session.get(Category.class, cid);
           session.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return cat;
    }
    
    public int countCategory()
    {
        int count=0;
        Session session = factory.openSession();
        
        Query q = session.createQuery("from Category");
        
        List <Category> list = q.list();
        
        for(Category a: list)
        {
            count++;
        }
 
        return count;
    }
}
