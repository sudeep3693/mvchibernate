
package com.springpracitce.services;

import com.springpracitce.dao.StudentDao;
import com.springpracitce.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class StudentService {
    
    @Autowired
    private StudentDao studentDao;
    
    public int saveStudent(Student student){
        
        int id = studentDao.addStudent(student);
        return id;
    }
}
