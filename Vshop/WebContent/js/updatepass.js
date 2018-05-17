$(function() {
	$(".updatepass").click(function() {
		var user_account = $("#user_account");
		var user_alter_password1 = $("#user_alter_password1");
		var user_alter_password2 = $("#user_alter_password2");
		if (user_account.val() == null) {
			user_account.focus();
			return false;
		}
		if (user_alter_password2.val() != user_alter_password1.val()) {
			user_alter_password2.focus();
			return false;
		}
		var url="alterpassword.do";
		$.ajax({
			url:url,
			type:'post',
			data:{
				"user_account":user_account.val(),
				"user_password":user_alter_password2.val()
			},
			dataType:'json',
			success:function(msg)
			{
				if(msg==1)
				{
					$(".link_pwd").html("用户名错误:");
				}
				else if(msg==2)
				{
					$(".link_pwd").html("密码错误");
				}
				else if(msg==3)
				{
					locahost.href="index.jsp";
				}
			}
		});
	});
});