$(function()
{
	var user_account=$("input[name='user_account']");
	$(".btn").click(function()
	{
		var user_name=$("input[name='user_name']");
		var user_birth=$("input[name='user_birth']");
		var user_phone=$("input[name='user_phone']");
		var user_city=$("input[name='user_city']");
		var user_password1=$("input[name='user_password1']");
		var user_password2=$("input[name='user_password2']");
		console.log(user_account);
		if(user_account.val()==null)
		{
			user_account.focus();
			return false;
		}
		if(user_name.val()==null)
		{
			user_name.focus();
			return false;
		}
		if(user_birth.val()==null)
		{
			user_birth.focus();
			return false;
		}
		if(user_phone.val()==null)
		{
			user_phone.focus();
			return false;
		}
		
		if(user_city.val()==null)
		{
			user_city.focus();
			return false;
		}
		
		if(user_password2.val()!=user_password1.val())
		{
			user_password2.focus();
			return false;
		}
		$("form").submit();
	});
	// 检查账号是否注册过
	user_account.blur(function()
	{
			if(user_account.val()!="")
			{
				$.ajax({
					url:'check.do',
					type:'post',
					data:{
						"user_account":user_account.val(),
						"time":new Date().getTime(),
					},
					dataType:'json',
					success:function(msg)
					{
						if(msg==1)
						{
							$(".check_user").html("该账号已经被使用请更换");
							$(".check_user").css({"color":"red","font-size":"12px"});
							$(".btn").hide();
						}
						else
						{
							$(".check_user").html("该账号可以使用");
							$(".check_user").css({"color":"green","font-size":"12px"});
							$(".btn").show();
						}
					},
					error:function(er){
						alert(er.error);
					}
				});
			}
	});
});