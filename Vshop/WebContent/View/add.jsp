<%--
  User: Ygz
  Date: 2017/5/1
  Time: 20:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%  String Path=request.getContextPath();
    String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + Path+ "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>国增-Java无限级分销管理系统</title>
    <!-- Bootstrap -->
    <link href="bootstrap-3.3.5/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        body {
            padding: 70px;
        }

        .table {
            width: 50%;
            margin: 0px auto;
            margin-top: 30px;
        }
        input[type='text'],input[type='password']{
            width: 250px;
            border: 1px solid #eee;
            height: 40px;
            line-height: 40px;
            border-radius: 3px;
            padding-left: 10px;
        }
    </style>
</head>
<body>
<!-- 引入头部 -->
<%@ include file="nav.jsp" %>
<div class="container-fluid ">
<form  action="View/add_userinfo.do"  method="post">
    <table class="table table-hover table-bordered">
        <tr>
            <td colspan="2" style="font-size: 16px;font-weight:bold;text-align:center;">推荐会员</td>
        </tr>
        <tr>
            <td align="right">推荐人：</td>
            <td>${sessionScope.account}</td>
        </tr>
        <tr>
            <td align="right"  style="vertical-align: middle;">登录账号：</td>
            <td><input type="text" name="user_account"/><span class="check_user"></span></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">真实姓名：</td>
            <td><input type="text" name="user_name"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">出生日期：</td>
            <td><input type="text" name="user_birth" onclick="WdatePicker()"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">手机号码：</td>
            <td><input type="text" name="user_phone"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">所在城市：</td>
            <td><input type="text" name="user_city"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">登录密码：</td>
            <td><input type="password" name="user_password1"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">确认密码：</td>
            <td><input type="password" name="user_password2"/></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button class="btn  btn-primary" type="button">提交保存</button>
            </td>
        </tr>
        <tr>
        	<td colspan="2" style="color:red;text-align:center;font-size:20px">
        		${msg}
        	</td>
        </tr>
    </table>
</form>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/add.js"></script>
</body>
</html>