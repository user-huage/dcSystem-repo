<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/common.jspf"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript">
    $(function () {
        $('#aa').datetimebox({
            required:true,
            showSeconds:true
        });
    })
</script>
<input id="aa" type="text" name="birthday"></input>
</body>
</html>
