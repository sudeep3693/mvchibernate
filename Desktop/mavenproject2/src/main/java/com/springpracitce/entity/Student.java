
package com.springpracitce.entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import javax.persistence.Entity;
import javax.persistence.Id;


/**
 *
 * @author user
 */
@Entity
public class Student {

    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int id;
    private String email;
    private String password;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Student() {
    }

    public Student(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    
    
    @Override
    public String toString() {
        return "student{" + "email=" + email + ", password=" + password + '}';
    }
    
    
    
}
