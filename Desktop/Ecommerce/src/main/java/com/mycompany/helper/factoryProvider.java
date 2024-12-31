
package com.mycompany.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class factoryProvider {
    private static SessionFactory factory;
    private void factoryProvider(){
        
    }
    
    public static SessionFactory getFactory()
    {
        try{
        if(factory ==null)
        {
            factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            
        }
        }
        catch(Exception e)
        {
            System.out.println("asdflkasdlfkasdjflasdfjasldk");
            e.printStackTrace();
        }
        
       return factory;
    }
    
    public static void main(String[] args) {
        
    }
 
}
