<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#MenuTable').treegrid({
            url:'${proPath}/queryAllMenu.mvc',
            method:'post',
            idField:'menuId',
            treeField:'menuName',
            columns:[[
                {checkbox:true},
                {field:'menuId',title:'目录编号'},
                {field:'menuName',title:'目录名称'},
                {field:'url',title:'URL'},
                {field:'powerName',title:'权限编码'},
                {field:'menuType',title:'目录类型'},
                {field:'status',title:'状态'},
                {field:'sort',title:'排序'}
            ]],
            loadMsg:'正在加载数据，请稍等',
            striped:true,
            rownumbers:true,
            toolbar:[
                {text:'添加根目录',iconCls:'icon-add',
                    handler:function(){
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addTotalMenu'
                        });
                    }
                },
                {text:'添加子目录',iconCls:'icon-add',
                    handler:function(){
                        var menuTables=$('#MenuTable').datagrid('getChecked');
                        if(menuTables.length>1){
                            alert("只能选择一个根目录进行添加！！！");
                            return;
                        }else if(menuTables.length==0){
                            alert("必须选择一个根目录才能进行添加！！！");
                            return;
                        }else if(menuTables[0].menuType=="按钮") {
                            alert("请一个根目录进行添加！！！");
                            return;
                        }
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=addSubMenu&parentId='+menuTables[0].menuId
                        });
                    }
                },
                {text:'修改',iconCls:'icon-edit',
                    handler:function(){
                        var menuTables=$('#MenuTable').datagrid('getChecked');
                        if(menuTables.length>1){
                            alert("只能选择一个目录进行修改！！！");
                            return;
                        }else if(menuTables.length==0){
                            alert("必须选择一个目录才能进行修改！！！");
                            return;
                        }
                        var status;
                        if(menuTables[0].status=="可用"){
                            status='1';
                        }else {
                            status='0';
                        }
                        var type;
                        if(menuTables[0].menuType=="菜单"){
                            type='1';
                        }else {
                            type='0';
                        }
                        $("#MenuWindow").window({
                            width:600,
                            height:400,
                            href:'${proPath}/goUrl.mvc?src=updateMenu&menuId='+menuTables[0].menuId+"&menuName="+menuTables[0].menuName+"&url="+menuTables[0].url+"&menuType="+type+"&powerName="+menuTables[0].powerName+"&status="+status+"&sort="+menuTables[0].sort
                        });
                    }
                },
                {text:'删除',iconCls:'icon-remove',
                    handler:function(){
                        var menuTables=$('#MenuTable').datagrid('getChecked');
                        if(menuTables.length==0){
                            alert("必须选择一个目录才能进行删除！！！");
                            return;
                        };
                        var a=new Array();
                        $(menuTables).each(function (i,menu) {
                            a[i]=menu.menuId;
                        });
                        var menuIds=a.toString();
                        $.messager.confirm("删除框","确认要删除吗？",function(r){
                            if(r){
                                $.ajax({
                                    url:"${proPath}/deleteMenu.mvc",
                                    method:"post",
                                    data:{menuIds:menuIds},
                                    success:function (msgg) {
                                        if (msgg.msg) {
                                            alert(msgg.msg);
                                            if(msgg.msg=="删除成功！！！") {
                                                $("#MenuTable").treegrid("load");
                                            }
                                        }
                                    }
                                });
                            }
                        });
                    }
                }
            ],
            pagination:true,
            title:'目录信息列表'
        });
    })
</script>
<table id="MenuTable"></table>
<div id="MenuWindow"></div>
</body>
</html>
