
package com.mycompany.dao;

import com.mycompany.orm.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class UserDao {
    
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getElementByEmailAndPassword(String email, String password)
    {
        User user=null;
        
        try{
            //HQL QUERY
            
            String query="from User where userEmail =:e and userPassword=: p";
            Session session = this.factory.openSession();
            
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();         
            session.close();
            
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        
        return user;
    }
}
