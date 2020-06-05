package com.hx.dc.mapper;

import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Post;

import java.util.List;

public interface EmpMapper {
    public List<Emp> queryAllEmp(Emp emp);
    public List<Post> ajaxQueryPost(Emp emp);
    public int addEmp(Emp emp);
    public Emp queryEmpByUserName(Emp emp);
    public Dept queryDeptByDeptName(Emp emp);
}
