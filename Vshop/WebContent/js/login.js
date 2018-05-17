/**
 * Created by  on 2017/5/14.
 */
/**
 * 用户登陆js验证
 */
$(function()
{
    $(".admin_login_btn").click(function() {
        var account = $("#account");
        var password = $("#password");
        if(account.val()=="")
        {
            account.focus();
            return false;
        }
        if(password.val()=="")
        {
            password.focus();
            return false;
        }
        var url="login.do";
        $.ajax({
            url:url,
            type:"POST",
            data:{
                "account":account.val(),
                "password":password.val(),
                "time":new Date().getTime()
            },
            dataType:"json",
            success:function(msg)
            {
                if(msg==1)
                {
                    $(".link_pwd").html("用户名错误");
                    return false;
                }else if(msg==2)
                {
                    $(".link_pwd").html("密码错误")
                    return false;
                }
                else if(msg==3)
                {
                	location.href="View/main.do";
                }
            }
              });
       });
});