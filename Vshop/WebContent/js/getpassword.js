$(function() {
	$(".getpassword").click(function() {
		var user_account = $("#user_account");
		var user_matter = $("#user_matter");
		var user_answer = $("#user_answer");
		if (user_account.val() == "") {
		alert("n");
			user_account.focus();
			return false;
		}
		if (user_matter.val() == "") {
			alert("s");
			user_matter.focus();
			return false;
		}
		if (user_answer.val() == "") {
			user_answer.focus();
			return false;
		}
		var url="retrievepassword.do";
		$.ajax({
			url:url,
			type:"post",
			data:{
				"user_account":user_account.val(),
				"user_matter":user_matter.val(),
				"user_answer":user_answer.val(),
				"time" : new Date().getTime()
				},
			dataType:"json",
			success:function(msg)
			{
				if(msg==1)
				{
					$(".link_pwd").html("账号或密保问题错误");
				}
				else if(msg==2)
				{
					$(".link_pwd").html("密保答案错误");
				}
				else if(msg==3)
				{
					location.href="View/updatepass.jsp";
				}
			}
		});
	});
});