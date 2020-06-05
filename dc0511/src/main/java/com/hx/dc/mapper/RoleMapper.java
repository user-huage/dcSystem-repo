package com.hx.dc.mapper;


import com.hx.dc.entity.Emp;
import com.hx.dc.entity.Menu;
import com.hx.dc.entity.Role;

import java.util.List;

public interface RoleMapper {
    public List<Role> queryAllRole();
    public int deleteRole(int[] roleIds);
    public Role queryRoleByName(Role role);
    public int addRole(Role role);
    public int updateRole(Role role);
    public List<Emp> queryAllEmp();
    public List<Emp> queryRoleEmp(Role role);
    public List<Menu> queryAllMenu();
    public List<Menu> queryRoleMenu(Role role);
    public int deleteRoleEmp(Role role);
    public int deleteRoleMenu(Role role);
    public int insertRoleEmp(int empIds,int roleId);
    public int insertRoleMenu(int roleId,int menuIds);
}
