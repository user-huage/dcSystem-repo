package com.hx.dc.service.impl;

import com.hx.dc.entity.Dept;
import com.hx.dc.mapper.DeptMapper;
import com.hx.dc.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

    @Autowired
    @Qualifier("deptMapper")
    private DeptMapper deptMapper;

    @Override
    public List<Dept> queryAllDept() {
        return deptMapper.queryAllDept();
    }

    @Override
    public String addDept(Dept dept) {
        String msg="添加失败！！！";
        Dept reuturnDept = deptMapper.queryDept(dept);
        if(reuturnDept!=null){
            msg="部门已存在，无法重复添加！！！";
            return msg;
        }
        int num = deptMapper.addDept(dept);

        if(num==1){
            msg="添加成功！！！";
        }
        return msg;
    }

    @Override
    public Dept queryDept(Dept dept) {
        return deptMapper.queryDept(dept);
    }

    @Override
    public String updateDept(Dept dept) {
        String msg="修改失败！！！";
        Dept reuturnDept = deptMapper.queryDept(dept);
        if(reuturnDept!=null && reuturnDept.getDepId()!=dept.getDepId()){
            msg="部门已存在，无法重复修改！！！";
            return msg;
        }
        int num = deptMapper.updateDept(dept);

        if(num==1){
            msg="修改成功！！！";
        }
        return msg;
    }

    @Override
    public String removeDept(String[] depNames) {
        String msg="删除成功！！！";
        int num = deptMapper.removeDept(depNames);
        if(num==0){
            msg="删除失败！！！";
        }
        return msg;
    }

}
