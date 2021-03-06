<%--
  User: Ygz
  Date: 2017/5/2
  Time: 21:59
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>国增学院-Java无限级分销管理系统</title>
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
        input[type='text'] {
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
<!--引入nav-->
<%@ include file="nav.jsp"%>
<div class="container-fluid ">
    <table class="table table-hover table-bordered">
        <tr>
            <td colspan="2" style="font-size: 16px;font-weight:bold;text-align:center;">推荐会员</td>
        </tr>
        <tr>
            <td align="right">推荐人：</td>
            <td>${mainuserinfo.user_recommend}</td>
        </tr>
        <tr>
            <td align="right"  style="vertical-align: middle;">登录账号：</td>
            <td>${mainuserinfo.user_account}</td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">真实姓名：</td>
            <td>${mainuserinfo.user_name}</td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">出生日期：</td>
            <td>${mainuserinfo.user_date}</td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">手机号码：</td>
            <td>${mainuserinfo.user_phone}</td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">所在城市：</td>
            <td>${mainuserinfo.user_city}</td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <a class="btn  btn-primary"  href="View/main.do">返回</a>
            </td>
        </tr>
    </table>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.2.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
</body>
</html>