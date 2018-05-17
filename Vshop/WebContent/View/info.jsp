<%--
  User: Administrator
  Date: 2017/5/2
  Time: 21:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        input[type='text'],select,input[type='password']{
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
            <td align="right">登录账号：</td>
            <td>${sessionScope.userinfo.user_account}</td>
        </tr>
        <tr>
            <td align="right">推荐人：</td>
            <td>${sessionScope.userinfo.user_recommend}</td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">真实姓名：</td>
            <td><input type="text" id="user_name" value="${sessionScope.userinfo.user_name}"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">出生日期：</td>
            <td><input type="text" id="user_birth" value="${sessionScope.userinfo.user_birth}" onclick="WdatePicker()"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">手机号码：</td>
            <td><input type="text" id="user_phone" value="${sessionScope.userinfo.user_phone}"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">所在城市：</td>
            <td><input type="text" id="user_city" value="${sessionScope.userinfo.user_city}"/></td>
        </tr>

        <tr>
            <td align="right" style="vertical-align: middle;">修改密码：</td>
            <td><input type="password" id="user_alter_password1" value=""/><input type="hidden" id="user_password" value="${sessionScope.userinfo.user_password}"/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">确认密码：</td>
            <td><input type="password" id="user_alter_password2" value=""/></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">密保问题：</td>
            <td><select id="user_matter"> 
                <option value="0" <c:if test="${sessionScope.userinfo.user_matter==0}">selected='selected'</c:if>>您母亲的姓名？</option>
                <option value="1" <c:if test="${sessionScope.userinfo.user_matter==1}">selected='selected'</c:if>>您配偶的生日？</option>
                <option value="2" <c:if test="${sessionScope.userinfo.user_matter==2}">selected='selected'</c:if>>您的学号（工号）是？</option>
                <option value="3" <c:if test="${sessionScope.userinfo.user_matter==3}">selected='selected'</c:if>>您母亲的生日？</option>
                <option value="4" <c:if test="${sessionScope.userinfo.user_matter==4}">selected='selected'</c:if>>您高中班主任的姓名？</option>
                <option value="5" <c:if test="${sessionScope.userinfo.user_matter==5}">selected='selected'</c:if>>您父亲的生日？</option>
                <option value="6" <c:if test="${sessionScope.userinfo.user_matter==6}">selected='selected'</c:if>>您配偶的姓名？</option>
                <option value="7" <c:if test="${sessionScope.userinfo.user_matter==7}">selected='selected'</c:if>>您小学班主任的姓名？</option>
            </select></td>
        </tr>
        <tr>
            <td align="right" style="vertical-align: middle;">密保答案：</td>
            <td><input type="text" id="user_answer" value="${sessionScope.userinfo.user_answer}"/></td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="hlell" onclick="reloads()">提交保存</button>
            </td>
        </tr>
        <c:if test="${msg!=null}">
			<tr>
        		<td colspan="2" align="center" style="color:red">${msg}</td>
        	</tr>        
        </c:if>
    </table>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/info.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
</body>
</html>