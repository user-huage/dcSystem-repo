package com.hx.dc.controller;

import com.github.pagehelper.PageInfo;
import com.hx.dc.entity.Emp;
import com.hx.dc.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class EmpController {

    @Autowired
    @Qualifier("empService")
    private EmpService empService;

    @RequestMapping("queryAllEmp")
    @ResponseBody
    public Map<String,Object> queryAllEmp(Emp emp,int page, int rows){
        Map<String,Object> pageMap=new HashMap<String, Object>();
        PageInfo pageInfo = empService.queryAllEmp(emp,page,rows);
        pageMap.put("total",pageInfo.getTotal());
        pageMap.put("rows",pageInfo.getList());
        return pageMap;
    }
    @RequestMapping("ajaxQueryPost")
    @ResponseBody
    public Object ajaxQueryPost(Emp emp){
        return empService.ajaxQueryPost(emp);
    }
    @RequestMapping("addEmp")
    @ResponseBody
    public Object addEmp(Emp emp){
        String msg = empService.addEmp(emp);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg",msg);
        return map;
    }
}
