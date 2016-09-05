package com.ht.dao;

import java.util.List;

import com.ht.bean.Classes;
import com.ht.bean.Grade;
import com.ht.bean.Student;
import com.ht.common.Pager;

public interface GradeDao extends BaseDao<Grade, Integer> {

    public List<Student> batchQlery(Student student);

    public void batchSave(List<Grade> grades);
    
    public Pager<Grade> queryByName(Pager<Grade> pager,String name);
    
    public Pager<Grade> queryByCourse(Pager<Grade> pager,String courseName);
    
    public List<Classes> queryClasses();
    
    public Pager<Grade> queryByClass(Pager<Grade> pager,int classID);
    
}
