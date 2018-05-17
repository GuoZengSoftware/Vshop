<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var probability_id = null;

window.onload = function ()
{
	//装盘运动
	startMove();
	//获取奖品信息
	setPicture();
	//成长值
	getAdolesceValue();
	//关闭遮罩层
	onclickClose();
	//获奖名单滚动
	articleRoll();
}
//获奖名单滚动
function articleRoll()
{
	var oJframe = document.getElementById("jframe");
	var oArticle = document.getElementById("article");
	var stu = oArticle.offsetHeight - oJframe.offsetHeight;
	uniformMotion(oArticle,-stu,"top");
}
function getAdolesceValue()
{
	var oVessel = document.getElementById("vessel");
	var oValue = document.getElementById("value");
	
	StartMove(oValue,{width:150});
}

window.onscroll = function ()
{
	//先获取可视区距离网页的高度
	var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
	document.title = scrollTop;	
	
}
//网页运动框架
var timer = null;
function scrollTopStartMove(iTarget)
{
	clearInterval(timer);
	timer = setInterval(function ()
	{
		var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
		var speed;
		if(scrollTop > iTarget)
		{
			speed = -30;
		}else{
			speed = 30;
		}
		
		if(scrollTop == iTarget)
		{
			clearInterval(timer);
		}else 
		{
			
			document.documentElement.scrollTop = document.body.scrollTop = scrollTop + speed;
			
			if(scrollTop > iTarget)
			{
				document.documentElement.scrollTop = document.body.scrollTop = iTarget;
				clearInterval(timer);
			}
		}
	},30);
}
//转盘运动
function startMove()
{
	var oNeedle = document.getElementById("needle");
	var oCard = document.getElementById("card");
	oNeedle.onclick = StartMove2;
}
//开始旋转转盘
function StartMove2()
{	
	var oCard = document.getElementById("card");
	//先初始化转盘角度
	oCard.style.transition = "0s all ease";
	oCard.style.transform = "rotate(0deg)";
	//再启动转盘
	timer2out();
}
//结束转盘时打开遮罩层
var timer = null;
function Timeout(id)
{
	clearTimeout(timer);
	timer = setTimeout(function ()
	{
		var oSurprised = document.getElementById("surprised");
		var oShade = document.getElementById("shade");
		oSurprised.style.display = "block";
		oShade.style.display = "block";
		clearTimeout(timer);
		var oNeedle = document.getElementById("needle");
		oNeedle.onclick = StartMove2;
	},5500)
	
}
//关闭遮罩层
function onclickClose()
{
	var oClose = document.getElementById("close");
	var oSurprised = document.getElementById("surprised");
	var oShade = document.getElementById("shade");
	oClose.onclick = function ()
	{
		oSurprised.style.display = "none";
		oShade.style.display = "none";
	}
}
//启动转盘的延时器
var timer2 = null;
function timer2out()
{
	clearTimeout(timer2);
	timer2 = setTimeout(function ()
	{
		var oCard = document.getElementById("card");
		oCard.style.transition = "5s all ease-in-out";
		oCard.style.transform = "rotate("+setOdds()+"deg)"
		//  4  0度 	3	60度		2	120度	1	180度	6	240度	5	300度
		Timeout(probability_id);
		clearTimeout(timer2);
		
		var oNeedle = document.getElementById("needle");
		oNeedle.onclick = null;
	},100)
}
//计算角度
function setOdds()
{
	var oRound = document.getElementById("round");
	var oDivs = document.getElementsByName("award");
	
	var oNeedle = document.getElementById("needle");
	var oCard = document.getElementById("card");
	
	var array = new Array;
	
	for(var i=0;i<oDivs.length;i++)
	{
		array[i] = oDivs[i].odds / 100;
	}
	
	var Odds = Math.random();
	if(Odds < array[0])
	{
		document.title = "一等奖";
		probability_id = oDivs[0].index;
		return 180 + 9 * 360;
		
	}else if(Odds > array[0]  && Odds < (array[0] + array[1]))
	{
		document.title = "二等奖";
		probability_id = oDivs[1].index;
		return 120 + 9 * 360;
		
	}else if(Odds > (array[0] + array[1]) && Odds < (array[0] + array[1] + array[2]))
	{
		document.title = "三等奖";
		probability_id = oDivs[2].index;
		return 60 + 9 * 360;
		
	}else if(Odds > (array[0] + array[1] + array[2]) && Odds < (array[0] + array[1] + array[2] + array[3]))
	{
		document.title = "四等奖";
		probability_id = oDivs[3].index;
		return 0 + 9 * 360 ;
		
	}else if(Odds > (array[0] + array[1] + array[2] + array[3]) && Odds < (array[0] + array[1] + array[2] + array[4]))
	{
		document.title = "五等奖";
		probability_id = oDivs[4].index;
		return 300 + 9 * 360;
		
	}else 
	{
		document.title = "谢谢惠顾";
		probability_id = oDivs[5].index;
		//Odds > (array[0] + array[1] + array[2] + array[3] + array[4]) && Odds < (array[0] + array[1] + array[2] + array[4] + array[5])
		return 240 + 9 *360;
		
	}
}
//获取奖品信息
function setPicture()
{
	var oRound = document.getElementById("round");
	var oDivs = document.getElementsByName("award");
	
	
	for(var i=0;i<oDivs.length;i++)
	{
		oDivs[i].index = null;
	}

	<c:set var="i" value="0" />
	<c:forEach items="${DialList}" var="dial">
		var img = document.createElement("img");
		img.style.width = "100px";
		img.style.height = "100px";
		img.src = "${pageContext.request.contextPath}/${dial.prize_img}";
		var div = document.createElement("div");
		div.style.width = "100px";
		div.style.height = "20px";
		div.style["text-align"] = "center";
		div.innerHTML = "<font style='line-height:20px'>${dial.prize_name}</font>";
		
		oDivs[${i}].appendChild(img);
		oDivs[${i}].appendChild(div);
		oDivs[${i}].index = "${dial.prize_id}";
		oDivs[${i}].name = "${dial.prize_name}"
		oDivs[${i}].odds = "10";
		<c:set var="i"  value="${i+1}" />
	</c:forEach>
	
}

//创建一个获取不是行间样式的值得函数
function getStyle(obj,StyleName)
{
	//判断该obj是否有currentStyle属性
	if(obj.currentStyle)
	{
		//有就用currentStyle该函数返回属性值
		return  obj.currentStyle[StyleName];
	}else{
		//没有就用getComputedStyle该函数返回属性值
		return getComputedStyle(obj,false)[StyleName];
	}
}
//创建一个运动框架
function StartMove(obj,json,Method)
{
	//先停止该对象的定时器
	clearInterval(obj.timer);
	//然后再启动该对象的定时器
	obj.timer = setInterval(function ()
	{
		//假设所有属性的值都到了
		var Stop = true;
		//循环json中所有的属性
		for(var attr in json)
		{
			//定义一个变量
			var cut = 0;
			//判断attr是否为透明度opacity
			if(attr == "opacity")
			{
				//是的话就去接收传过来的属性名字attr的值为float
				//先把传过来的数装换成float类型   再四舍五入
				cut = Math.round(parseFloat(getStyle(obj,attr))*100);
			}else{
				//不是透明度的话就去接收传过来的属性名字attr的值为int类型
				cut = parseInt(getStyle(obj,attr));
			}
				
			//定义一个变量speed为运动的速度
			var speed = (json[attr] - cut)/10;
			//再让这个速度取整
			speed = speed>0?Math.ceil(speed):Math.floor(speed);
			//判断该对象要运动的属性值是否到了目标
			
			if(cut != json[attr])Stop = false;
			
				//判断属性名称是否是opacity透明度
				if(attr == "opacity")
				{
					//是的话就给透明度运动
					obj.style.filter = "alpha(opacity:"+(cut+speed)+")";
					obj.style.opacity = (cut+speed)/100;
				}
				else
				{
					//不是的话就给其他属性运动
					obj.style[attr]  = cut + speed +"px"
				}
		}
		//如果json里面的属性都到了目标后执行
		if(Stop)
		{
			clearInterval(obj.timer);
			if(Method)Method();
		}
	},30)
}
function uniformMotion(obj,iTarget,attr)
{
	clearInterval(obj.timer);
	obj.timer = setInterval(function ()
	{
		var cnt = parseInt(getStyle(obj,attr));
		var speed = -1;
		if(cnt == iTarget)
		{
			obj.style[attr] = 0+"px";
		}else{
			obj.style[attr] = cnt + speed + "px";
		}
		
	},30)
}
</script>
<title>会员首页</title>
</head>
<style>
	*{margin: 0px;padding: 0px;}
	.boby{width: 1920px;margin: auto;background-color:#f6f6f6;}
	.navigation{width: 100%;height: 35px;background-color: #e3e4e5;
		}	
	.navigation_div{float: right;margin-right: 100px;line-height: 30px;}
	.navigation_div a{text-decoration: none;margin: 20px;font-size: 15px;
		color:#999;}
	.navigation_div a:HOVER {color: red;}
	.navigation2{width: 70%;height: 85px;border: 1px solid red;margin: auto;}
	.navigation2_left{width: 420px;height: 50px;border: 1px solid red;
		margin-top: 15px;float: left;margin-left: 50px;}
	.navigation2_right{width: 570px;float: right;height: 50px;
		margin-right: 70px;margin-top: 15px;}
	.navigation2_right_div{width: 110px;height: 45px;float: left;margin:0px 15px;line-height: 45px;
		text-align: center;font-weight: 800;}
	.navigation2_right_div a{color: black;font-size: 20px;text-decoration: none;}
	.navigation2_right_div:HOVER {background-color: #e4393c;}
	.navigation2_right_div:HOVER>a{color: white;}
	.layers{width: 100%;height: 600px;border: 1px solid white;margin: auto;
		background-color: #444a5a;}
	.layers_body{width: 70%;height: 550px;border: 1px solid red;
		margin: auto;margin-top: 30px;}
	.layers_body_left{width: 29%;height: 100%;border: 1px solid green;
		margin-right: 10px;float: left;background-color: #fe6f4a;}
	.layers_body_right{width: 69.5%;height: 100%;border: 1px solid gray;
		float: left;background-color: white;}
	.touxiang_div{width: 150px;height: 150px;margin: auto;Border-radius:50%;
		border: 10px solid #fca08d;margin-top: 50px;text-align: center;}
	.touxiang{width: 90%;height: 90%; margin: 8px;Border-radius:50%;}
	.touxiang_div p{color: white;font-size: 20px;margin-top: 15px;}
	.touxiang_div2{width: 300px;height: 100px;margin: auto;margin-top: 60px;}
	.touxiang_div2_left{width: 49.5%;height: 100%;border-right: 1px solid #ccc;
		float: left;text-align: center;}
	.touxiang_div2_left p{font-size: 16px; color: white;}
	.touxiang_div2_left a{font-size: 50px;font-weight: 900px; color: white;
		text-decoration: none;}
	.touxiang_div2_right{width: 49.5%;height: 100%;float: left;
		text-align: center;}
	.touxiang_div2_right p{font-size: 16px; color: white;}
	.touxiang_div2_right a{font-size: 50px;font-weight: 900px; color: white;
		text-decoration: none;}
	.touxiang_div3{width: 100%;height: 80px;margin-top: 50px;}
	.huiyaun{width: 30px;height: 30px;margin: 0px 31px;}
	.touxiang_div3 span{color: white;font-size: 10px;margin: 0px 22px;}
	.wuse{width: 81%;height: 3px;background-color:#ee8c87;border: none;
		margin: auto;margin-top: 10px;}
	.youse{width: 10px;height: 3px;background-color:white;border: none;
		margin-left:38px;margin-top: -3px;}
	.privilege{width: 100%;height: 170px;background-color: #f7f7f7;}
	.privilege_body{width: 70%;height: 100%;margin: auto;}
</style>
<style>
#div1{
width: 0;
height: 0;
border-bottom: 250px solid rgb(36,194,255);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0px 0px 0px 0px;
position: absolute;
top:250px;
left:103px;
z-index:1003;
}
#div2{
width: 0;
height: 0;
border-bottom: 250px solid rgb(195,136,255);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0 0 0px 0px;
position: absolute;
top:250px;
left:103px;
transform: rotate(60deg);
transform-origin:145px 0px;
z-index:1003;
}
#div3{
width: 0;
height: 0;
border-bottom: 250px solid rgb(255,134,188);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0 0 0px 0px;
position: absolute;
top:250px;
left:103px;
transform: rotate(120deg);
transform-origin:145px 0px;
z-index:1003;
}
#div4{
width: 0;
height: 0;
border-bottom: 250px solid rgb(255,168,0);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0 0 0px 0px;
position: absolute;
top:250px;
left:103px;
transform: rotate(180deg);
transform-origin:145px 0px;
z-index:1003;
}
#div5{
width: 0;
height: 0;
border-bottom: 250px solid rgb(255,207,26);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0 0 0px 0px;
position: absolute;
top:250px;
left:103px;
transform: rotate(240deg);
transform-origin:145px 0px;
z-index:1003;
}
#div6{
width: 0;
height: 0;
border-bottom: 250px solid rgb(169,201,42);
border-left: 145px solid transparent;
border-right: 145px solid transparent;
border-radius:0 0 0px 0px;
position: absolute;
top:250px;
left:103px;
transform: rotate(300deg);
transform-origin:145px 0px;
z-index:1003;
}
#round{
width:498px;
height:498px;
overflow:hidden;
margin:50px;
position:relative;
transition:5s all ease-in-out;
transform-origin:250px 250px;
transform: rotate(0deg);
-moz-border-radius: 500px 500px 500px 500px;    
-webkit-border-radius: 500px 500px 500px 500px; 
}
#needle{
width:110px;
height:140px;
position: absolute;
left:250px;
top:130px;
z-index:1005;
background-size:contain;
background-size: cover;
background-image:url('/ShopSystem/B_mainjsp/image1/needle.png');
background-size:contain;
}
#award1{
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}
#award2{
transform: rotate(60deg);
transform-origin:50px -100px;
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}
#award3{
transform: rotate(120deg);
transform-origin:50px -100px;
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}
#award4{
transform: rotate(180deg);
transform-origin:50px -100px;
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}

#award5{
transform: rotate(240deg);
transform-origin:50px -100px;
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}

#award6{
transform: rotate(300deg);
transform-origin:50px -100px;
width:100px;
height:130px;
position: absolute;
top:350px;
left:200px;
border:1px solid #ccc;
z-index:1004;
}
#card{
width:600px;
height:600px;
position:absolute;
left:0px;
top:168px;
overflow:hidden;
background-size: cover;
transition:5s all ease-in-out;
transform-origin:50% 50%;
-moz-border-radius: 600px 600px 600px 600px;    
-webkit-border-radius: 600px 600px 600px 600px; 
background-image:url('/ShopSystem/B_mainjsp/image1/dial.png');
}
</style>
<body>
<div class="boby">
	<div class="navigation"> 
		<div class="navigation_div">
			<a href="">返回超市首页</a>
			<a href="">立即登入</a>|
			<a href="">我的订单</a>|
			<a href="">我的京东</a>|
			<a href="">京东会员</a>|
			<a href="">在线客服</a>
		</div>
	</div>
	
	<div class="navigation2">
		<div class="navigation2_left" style="border:1px solid black;"> 
			
		</div>
		<div class="navigation2_right">
			<div class="navigation2_right_div"><a href="">首页</a></div>
			<div class="navigation2_right_div"><a href="integral.jsp">积分兑换</a></div>
			<div class="navigation2_right_div"><a href="">会员成长值</a></div>
			<div class="navigation2_right_div"><a href="">特权汇</a></div>
		</div>
	</div>
	
	<div class="layers">
		<div class="layers_body">
			<div class="layers_body_left">
				<div class="touxiang_div">
					<img class="touxiang" src="../img/2.jpg">
					<p>知秋2290</p>
				</div>
				<div class="touxiang_div2">
					<div class="touxiang_div2_left">
						<p>成长值</p>
						<a href="">0</a>
					</div>
					<div class="touxiang_div2_right">
						<p>积分</p>
						<a href="">0</a>
					</div>
				</div>
				<div class="touxiang_div3">
					<img class="huiyaun" src="../img/8.jpg">
					<img class="huiyaun" src="../img/9.jpg">
					<img class="huiyaun" src="../img/10.jpg">
					<img class="huiyaun" src="../img/11.jpg">
					<span>铜牌会员</span>
					<span>银牌会员</span>
					<span>金牌会员</span>
					<span>砖牌会员</span>
					<hr id="vessel" class="wuse">
					<hr id="value" class="youse">
				</div>
			</div>
			<div class="layers_body_right">
				
			</div>
		</div>
	</div>
	
	<div class="privilege">
		<div class="privilege_body">
			<img style="width: 364px;height: 170px;" src="../img/12.jpg">
		</div>
	</div>
	<div style="width:100%;height:930px;border:1px solid red;position: relative;background-image:url('/ShopSystem/B_mainjsp/image1/zpbg.jpg');background-repeat: no-repeat;background-size: cover;">
		<!-- 大转盘 -->
		<div style="width:600px;height:900px;position: relative;left:200px;top:20px;background-image:url('/ShopSystem/B_mainjsp/image1/dialBg.png');background-size: cover;">
			<div id="needle"></div>
			<div id="card">
				<div id="round" >
					<div id="div1" name="dial"></div>
					<div id="award1" name="award">1</div>
					<div id="div2" name="dial"></div>
					<div id="award2" name="award">2</div>
					<div id="div3" name="dial"></div>
					<div id="award3" name="award">3</div>
					<div id="div4" name="dial"></div>
					<div id="award4" name="award">4</div>
					<div id="div5" name="dial"></div>
					<div id="award5" name="award">5</div>
					<div id="div6" name="dial"></div>
					<div id="award6" name="award">6</div>
				</div>
			</div>
		</div>
		<!-- 中奖名单 -->
		<div style="width:500px;height:800px;position: absolute;top:30px;right:150px;background-image:url('/ShopSystem/B_mainjsp/image1/odds.png');background-repeat: no-repeat;background-size: cover;">
			<div id="jframe" style="width:300px;height:150px;position: absolute;top:400px;left:140px;overflow: hidden;">
				<div id="article" style="width:100%;text-align: center;line-height:30px;position: absolute;">
					<c:forEach begin="0" end="55">
						<p>1231261616513</p>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 获奖物品 -->
		<div id="surprised" style="display:none;position: absolute;width:500px;height:400px;background:white;top:0px;z-index:2008;left:700px;top:250px;">
			<div id="close" style="width:30px;height:30px;background-image:url('/ShopSystem/B_mainjsp/image1/close.jpg');position: absolute;right:0px;top:0px;">
				
			</div>
		</div>
	</div>
	<div id="shade" style="display:none;position: absolute;width:101%;height:930px;background:black;top:893px;opacity:0.5;z-index:2007;">
		
	</div>
</div>

</body>
</html>