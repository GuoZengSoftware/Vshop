<%--
  User: Ygz
  Date: 2017/5/2
  Time: 21:54
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  String Path=request.getContextPath();
    String basePath=request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + Path+ "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>国增-Java无限级分销管理系统</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<link rel="stylesheet" href="css/reset.css" type="text/css">
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>

<body>
<div class="wrapper">
    <form action="index.jsp" method="post">
        <div class="admin_login_main">
            <div class="admin_login_logo" style="height:130px;">无限级分销管理系统</div>
            <div
                    style="width: 384px; height: 326px; background: #fff; border-radius: 10px;">
                <div
                        style="text-align: center; color: #707070; font-size: 30px; font-weight: blod; padding: 20px; font-family: '微软雅黑';">
                    重置密码&nbsp;<span style="color: #3FB3E9; font-size: 14px;">Reset
							Password</span>
                </div>
                <div
                        style="width: 340px; margin: 0px auto; border-bottom: 1px solid #E0E0E0;"></div>
                <div
                        style="width: 302px; margin: 0px auto; height: 85px; border-radius: 5px; text-align: center; color: #707070; font-size: 14px; margin-top: 30px; border: 1px solid #E0E0E0;">
                    <div style="border-bottom: 1px solid #E0E0E0;">
                        <label>密码：</label> <input type="password" id="user_alter_password1"
                                                  style="border: none; background-color: #fbfbfb; width: 200px; height: 40px;" />
                               <input type="hidden" id="user_account" value="${sessionScope.account}">                   
                    </div>

                    <div>
                        <label>确认：</label> <input type="password" id="user_alter_password2"
                                                  style="border: none; background-color: #fbfbfb; width: 200px; height: 40px;" />
                    </div>
                </div>
                <div style="width:302px;margin:0px auto;margin-top:30px;">
                    <button type="submit" class="updatepass"
                            style="width: 300px; height: 45px; color:#fff; background: #009CE5; display: block; border: 0px; border-radius: 5px;"
                            value="">重置密码</button>
                    <span class="link_pwd"></span>
                </div>
            </div>
        </div>
    </form>

</div>
<div id="Bottom" >&copy;国增 2017</div>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="js/updatepass.js"></script>
</body>
</html>