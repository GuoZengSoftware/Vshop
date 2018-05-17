<%--
  User: Ygz
  Date: 2017/5/1
  Time: 20:22
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
	String Path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ Path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ygz.vshop.com/timestamp" prefix="time"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<link rel="stylesheet" href="css/jquery.jOrgChart.css" />
<link rel="stylesheet" href="css/custom.css" />
<style type="text/css">
body {
	padding: 70px;
}
</style>
</head>
<body>
	<!--引入nav-->
	<%@ include file="nav.jsp"%>
	<div class="container-fluid "
		style="width: 100%; margin: 0 auto; height: 500px; background: url('images/bkgd.png') repeat top left;">
		<div class="main">
			<ul id="org" style="display: none">
				<li>
					<table border="0" width="100%">
						<tr>
							<td align="center"><img src="images/app5.gif"></td>
						</tr>
						<c:if test="${current_userinfo.user_account ne null}">
							<tr>
								<td align="center">${current_userinfo.user_account}</td>
							</tr>
							<tr>
								<td align="center"><time:timestamp
										timestamp="${current_userinfo.user_date}" format="yyyy-MM-dd" /></td>
							</tr>
							<tr>
								<td align="center"><a
									href="View/user.do?user_account=${current_userinfo.user_account}">查看联系</a></td>
							</tr>
							<tr>
								<td align="center"><fmt:formatNumber type="number"
										value="${(current_userinfo.user_right-current_userinfo.user_left-1)/2}"></fmt:formatNumber>
								</td>
							</tr>
						</c:if>
						<c:if test="${current_userinfo.user_account eq null}">
							<tr>
								<td align="center"><a href="View/add.jsp">推荐</a></td>
							</tr>
						</c:if>
					</table>
					<ul>
						<li>
							<table border="0" width="100%" cellpadding="0" cellspacing="0"
								height="60">
								<tr>
									<td align="center"><img src="images/app1.gif"></td>
								</tr>
									<c:if test="${user2_1.user_account ne null}">
									<tr>
										<td align="center"><a href="View/main.do?user_account=${user2_1.user_account}">${user2_1.user_account}</a></td>
									</tr>
									<tr>
										<!-- 使用自定义EL函数 -->
										<td align="center">${time:fmtTimeStamp(user2_1.user_date,"yyyy-MM-dd")}</td>
									</tr>
									<tr>
										<td align="center"><a
											href="View/user.do?user_account=${user2_1.user_account}">查看联系</a></td>
									</tr>
									<tr>
										<td align="center"><fmt:formatNumber type="number"
												value="${(user2_1.user_right-user2_1.user_left-1)/2}"></fmt:formatNumber>
										</td>
									</tr>
								</c:if>
								<c:if test="${user2_1.user_account eq null}">
									<tr>
										<td align="center"><a href="View/add.jsp">推荐</a></td>
									</tr>
								</c:if>
				
							</table>
							<ul>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app2.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">json</a></td>
										</tr>
										<tr>
											<td align="center">2015-09-11</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app3.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">token</a></td>
										</tr>
										<tr>
											<td align="center">2015-07-14</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app4.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">iken</a></td>
										</tr>
										<tr>
											<td align="center">2015-09-11</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>

							</ul>
						</li>
						<li>
							<table border="0" width="100%" cellpadding="0" cellspacing="0"
								height="60">
								<tr>
									<td align="center"><img src="images/app4.gif"></td>
								</tr>
								<tr>
									<c:if test="${user2_2.user_account ne null}">
											<tr>
												<td align="center"><a href="View/main.do?user_account=${user2_2.user_account}">${user2_2.user_account}</a>

												</td>
											</tr>
											<tr>
												<td align="center">${time:fmtTimeStamp(user2_2.user_date,"yyyy-MM-dd")}</td>
											</tr>
											<tr>
												<td align="center"><a href="View/user.do?user_account=${user2_2.user_account}">查看联系</a></td>
											</tr>
											<tr>
												<td align="center">	<fmt:parseNumber type="number" value="${(user2_2.user_right-user2_2.user_left-1)/2}"></fmt:parseNumber>
										</td>
											</tr>
										</c:if>
										<c:if test="${user2_2.user_account eq null}">
											<tr>
												<td align="center"><a href="View/add.jsp">推荐</a></td>
											</tr>
										</c:if>

							</table>
							<ul>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app5.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">arry</a></td>
										</tr>
										<tr>
											<td align="center">2015-08-08</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app3.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">mini</a></td>
										</tr>
										<tr>
											<td align="center">2015-09-22</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/app1.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">cat</a></td>
										</tr>
										<tr>
											<td align="center">2015-09-22</td>
										</tr>
										<tr>
											<td align="center"><a href="#">查看联系</a></td>
										</tr>
										<tr>
											<td align="center">(0)</td>
										</tr>
									</table>
								</li>

							</ul>
						</li>
						<li>
							<table border="0" width="100%" cellpadding="0" cellspacing="0"
								height="60">
								<tr>
									<td align="center"><img src="images/ap3.gif"></td>
								</tr>
								<c:if test="${user2_3.user_account ne null}">
									<tr>
										<td align="center"><a href="View/main.do?user_account=${user2_3.user_account}">${user2_3.user_account}</a></td>
									</tr>
									<tr>
										<!-- 使用自定义EL函数 -->
										<td align="center">${time:fmtTimeStamp(user2_3.user_date,"yyyy-MM-dd")}</td>
									</tr>
									<tr>
										<td align="center"><a
											href="View/user.do?user_account=${user2_3.user_account}">查看联系</a></td>
									</tr>
									<tr>
										<td align="center"><fmt:formatNumber type="number"
												value="${(user2_3.user_right-user2_3.user_left-1)/2}"></fmt:formatNumber>
										</td>
									</tr>
								</c:if>
								<c:if test="${user2_3.user_account eq null}">
										<tr>
											<td align="center"><a href="View/add.jsp">推荐</a></td>
										</tr>
								</c:if>
							</table>
							<ul>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/ap3.gif" /></td>
										</tr>
										<tr>
											<td align="center"><a href="add.html">推荐</a></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/ap3.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">推荐</a></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
									</table>
								</li>
								<li>
									<table border="0" width="100%" cellpadding="0" cellspacing="0"
										height="60">
										<tr>
											<td align="center"><img src="images/ap3.gif"></td>
										</tr>
										<tr>
											<td align="center"><a href="#">推荐</a></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
										<tr>
											<td align="center"></td>
										</tr>
									</table>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul>

		</div>
		<div style="width: 980px; margin: 0px auto;">
			<div id="chart" class="orgChart"></div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.2.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/prettify.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.jOrgChart.js"></script>

	<script type="text/javascript">
		jQuery(document).ready(function() {
			$("#org").jOrgChart({
				chartElement : '#chart',
				dragAndDrop : false
			});
		});

		jQuery(document).ready(function() {
			$("#show-list").click(function(e) {
				e.preventDefault();

				$('#list-html').toggle('fast', function() {
					if ($(this).is(':visible')) {
						$('#show-list').text('Hide underlying list.');
						$(".topbar").fadeTo('fast', 0.9);
					} else {
						$('#show-list').text('Show underlying list.');
						$(".topbar").fadeTo('fast', 1);
					}
				});
			});

			$('#list-html').text($('#org').html());

			$("#org").bind("DOMSubtreeModified", function() {
				$('#list-html').text('');

				$('#list-html').text($('#org').html());

				prettyPrint();
			});
		});

		$(function() {
			$("#search").click(function() {
				var key = $("#key_title");
				if (key.val() == "") {
					key.focus();
					return false;
				}
				$("#search_fm").submit();
			});
			showMsg("divMsg");
		});

		function showMsg(objId) {
			var timerOut = null;
			clearTimeout(timerOut);
			timerOut = setTimeout(function() {
				$("#" + objId).css("display", "none");
			}, 2000);
		}
	</script>

</body>
</html>