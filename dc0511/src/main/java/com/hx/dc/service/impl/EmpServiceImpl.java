package com.hx.dc.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Dept;
import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Post;
import com.hx.dc.mapper.EmpMapper;
import com.hx.dc.mapper.PostMapper;
import com.hx.dc.service.EmpService;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("empService")
public class EmpServiceImpl implements EmpService {
    @Autowired
    @Qualifier("empMapper")
    private EmpMapper empMapper;

    @Autowired
    @Qualifier("postMapper")
    private PostMapper postMapper;

    @Override
    public PageInfo queryAllEmp(Emp emp, int pageNumber, int pageSize) {
        PageHelper.startPage(pageNumber,pageSize);
        List<Emp> emps = empMapper.queryAllEmp(emp);
        for(Emp emp1:emps){
            if("1".equals(emp1.getSex())){
                emp1.setSex("男");
            }else {
                emp1.setSex("女");
            }
            if("1".equals(emp1.getDeptType())){
                emp1.setDeptType("总部");
            }else {
                emp1.setDeptType("分部");
            }
            if("1".equals(emp1.getWorkStatus())){
                emp1.setWorkStatus("在职");
            }else {
                emp1.setDeptType("不在职");
            }
            if("1".equals(emp1.getLocks())){
                emp1.setLocks("是");
            }else {
                emp1.setLocks("否");
            }
            if("1".equals(emp1.getEmpStatus())){
                emp1.setEmpStatus("可用");
            }else {
                emp1.setEmpStatus("禁用");
            }
        }
        PageInfo pageInfo=new PageInfo(emps);
        return pageInfo;
    }

    @Override
    public List<Post> ajaxQueryPost(Emp emp) {
        System.out.println(emp);
        List<Post> posts = empMapper.ajaxQueryPost(emp);
        System.out.println(posts);
        return posts;
    }

    @Override
    public String addEmp(Emp emp) {
        String  msg="添加失败！！！";
        Emp emp1 = empMapper.queryEmpByUserName(emp);
        if(emp1!=null){
            msg="该用户已经存在，无法重复添加！！！";
            return msg;
        }
        emp.setWorkStatus("1");
        emp.setDepId(empMapper.queryDeptByDeptName(emp).getDepId());
        Post post=new Post();
        post.setPostName(emp.getPostName());
        post.setTotalName(emp.getTotalName());
        post.setSubName(emp.getSubName());
        Post post1 = postMapper.queryPostByPostName(post);
        System.out.println(post1);
        emp.setPostId(post1.getPostId());
        int num = empMapper.addEmp(emp);
        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }
}
