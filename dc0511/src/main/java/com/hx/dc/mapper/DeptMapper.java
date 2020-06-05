package com.hx.dc.mapper;

import com.hx.dc.entity.Dept;

import java.util.List;

/**
 * ProjectName:dc0511
 * Package:com.hx.dc.mapper
 * ClassName:DeptMapper
 * Description:
 *
 * @Author:huage
 * @Date:2020/5/26 12:53
 */
public interface DeptMapper {
    //查找所有dept
    public List<Dept> queryAllDept();
    //添加总部门
    public int addDept(Dept dept);
    //查找指定dept
    public Dept queryDept(Dept dept);
    //修改部门
    public int updateDept(Dept dept);
    //删除部门
    public int removeDept(String[] depNames);
}
