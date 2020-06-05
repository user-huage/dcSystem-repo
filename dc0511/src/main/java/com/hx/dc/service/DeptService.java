package com.hx.dc.service;

import com.hx.dc.entity.Dept;

import java.util.List;


public interface DeptService {
    public List<Dept> queryAllDept();
    public String addDept(Dept dept);
    public Dept queryDept(Dept dept);
    public String updateDept(Dept dept);
    public String removeDept(String[] depNames);
}
