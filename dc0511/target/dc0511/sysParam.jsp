<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h4>系统参数</h4>
<table id="dg"></table>
<h4>餐营模式</h4>
<table id="dg1"></table>
<h4>支付流程</h4>
<table id="dg2"></table>

<script type="text/javascript">
    $(function(){
        $('#dg').datagrid({
            url:'${proPath}/sysParam/selectParam.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'field',title:'所属类型键',width:100},
                {field:'type',title:'所属类型名',width:100},
                {field:'fieldName',title:'参数键',width:100},
                {field:'fieldValue',title:'参数值',width:100}
            ]],
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-reload',
                text:'重新加载系统参数',
                handler: function(){
                    alert('刷新按钮')
                }
            }],
            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });

//        $("#dg").datagrid("load",{
//            sysParamField:"mode"
//        });
        $('#dg1').datagrid({
            url:'${proPath}/sysParam/selectParam.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'fieldName',title:'模式编号',width:100},
                {field:'fieldValue',title:'餐营模式',width:100},
                {field:'type',title:'是否启用',width:100,
                    formatter: function (value, row, index) {
                        if (value=='y'){
                            return value='是';
                        }else if(value=='0'){
                            return value='否';
                        }else {
                            return value='异常';
                        }
                    }
                }
            ]],
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-ok',
                text: '启用',
                handler: function(){
                    alert('启用按钮')
                }
            }],
            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });

        $("#dg1").datagrid("load",{
            field:"mode"
        });

        $('#dg2').datagrid({
            url:'${proPath}/sysParam/selectParam.mvc',
            singleSelect:true,
            columns:[[
                {checkbox:true},
                {field:'fieldName',title:'流程编号',width:100},
                {field:'fieldValue',title:'支付流程',width:100},
                {field:'type',title:'是否启用',width:100,
                    formatter: function (value, row, index) {
                        if (value=='y'){
                            return value='是';
                        }else if(value=='0'){
                            return value='否';
                        }else {
                            return value='异常';
                        }
                    }
                }
            ]],
            fitColumns:true,
            toolbar:[{
                iconCls: 'icon-ok',
                text: '启用',
                handler: function(){
                    alert('启用按钮')
                }
            }],
            //nowrap:false,
            pagination:true,
            rownumbers:true,
            pageSize:5,
            pageList:[5,10,15,20,25],
            /* queryParams: {
             userName: '1'
             }
             */
            /* rowStyler: function(index,row){
             if (row.unitcost>80){
             return 'background-color:#6293BB;color:#fff;';
             }
             }, */

            striped:true

        });

        $("#dg2").datagrid("load",{
            field:"flow_name"
        });

    });

</script>
</body>
</html>
