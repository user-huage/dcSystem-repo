package com.hx.dc.service;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Post;

import java.util.List;


public interface EmpService {
    public PageInfo queryAllEmp(Emp emp,int pageNumber, int pageSize);
    public List<Post> ajaxQueryPost(Emp emp);
    public String addEmp(Emp emp);
}
