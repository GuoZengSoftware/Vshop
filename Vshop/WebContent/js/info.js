$(function(){
	$(".hlell").click(function()
	{
		var user_name=$("#user_name");
		var user_birth=$("#user_birth");
		var user_phone=$("#user_phone");
		var user_city=$("#user_city");
		var user_password=$("#user_password");
		var user_alter_password1=$("#user_alter_password1");
		var user_alter_password2=$("#user_alter_password2");
		var user_matter=$("#user_matter");
		var user_answer=$("#user_answer");
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
				if(user_password.val()==null)
				{
					user_password.focus();
					return false;
				}
				if(user_alter_password2.val()!=user_alter_password1.val())
				{
					user_alter_password2.focus();
					return false;
				}
				if(user_matter.val()==null)
				{
					user_matter.focus();
					return false;
				}
				if(user_answer.val()==null)
				{
					user_answer.focus();
					return false;
				}
				window.location.reload();
		var url="View/updateuserinfo.do";
		$.ajax({
			url:url,
			type:"POST",
			data:{
				"user_name":user_name.val(),
				"user_birth":user_birth.val(),
				"user_phone":user_phone.val(),
				"user_city":user_city.val(),
				"user_password":user_password.val(),
				"user_alter_password2":user_alter_password2.val(),
				"user_matter":user_matter.val(),
				"user_answer":user_answer.val(),
				"time":new Date().getTime()
			},
			dataType:"json"
		});
	});
});