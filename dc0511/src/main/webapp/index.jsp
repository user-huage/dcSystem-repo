<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/common.jspf"%>
<html>
<head>
    <title>点餐系统</title>
    <script type="text/javascript">
        //创建选项卡
        function addTabs(name,src){
            if($('#tt').tabs('exists',name)){
                $('#tt').tabs ('select',name);
            }else{
                $('#tt').tabs ('add',{
                    title:name,
                    closable:true,
                    href:src
                });
            }
        }
    </script>
</head>
<body>
<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',split:false" style="height:25px;background-image:url(${proPath}/image/top.png);background-repeat: no-repeat; background-size:100%,100%;">
        <span style="float: right;">
            欢迎当前用户：&nbsp;&nbsp;&nbsp;
            <a href="#">修改密码</a>&nbsp;&nbsp;&nbsp;
            <a href="#">退出系统</a>&nbsp;&nbsp;&nbsp;
        </span>
    </div>
    <div data-options="region:'south',collapsible:false" style="height:40px;"></div>
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:200px;">
        <div class="easyui-accordion" data-options="fit:true">
            <div title="系统管理">
                <ul class="easyui-tree">
                    <li><a onclick="addTabs('目录管理','${proPath}/goUrl.mvc?src=menu')">目录管理</a></li>
                    <li><a onclick="addTabs('部门管理','${proPath}/goUrl.mvc?src=dept')">部门管理</a></li>
                    <li><a onclick="addTabs('员工管理','${proPath}/goUrl.mvc?src=emp')">员工管理</a></li>
                    <li><a onclick="addTabs('角色管理','${proPath}/goUrl.mvc?src=role')">角色管理</a></li>
                </ul>
            </div>
            <div title="员工管理">
                <ul class="easyui-tree">
                    <li><a onclick="addTabs('职务管理','${proPath}/goUrl.mvc?src=post')">职务管理</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'center'">
        <div class="easyui-tabs" data-options="fit:true" id="tt">
            <div title="欢迎使用"></div>
        </div>
    </div>
</div>
</body>
</html>
