<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="Zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Title</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--连接的样式表格和href的连接一致-->
<link rel="stylesheet" href="css/bootstrap-index2.css">
<link rel="stylesheet" href="css/bootstrap-admin.css" />
<style type="text/css">
#menu li {
	list-style: none;
	float: left; /* 往左浮动 */
	margin: 0px 50px;
}
</style>
<script type="text/javascript">
	function insertinfor(obj){
		var idd=$(obj).parent().parent().find('td');
		var cidd=idd.eq(0).text();
		var uid=idd.eq(1).text();
		var sname=idd.eq(2).text();
		var spicture=$("#pic").attr("src");
		var sprice=idd.eq(4).text();
		var ssum=idd.eq(5).text();
		alert("1111");
		var time=idd.eq(6).text();
		$.ajax({
			"url" : "shopinsert",//要提交的URL路径
			"type" : "GET", //发送请求的方式
			"data" : "&cidd="+encodeURIComponent(cidd)+"&uid="+encodeURIComponent(uid)+"&sname="+encodeURIComponent(sname)+"&spicture="+encodeURIComponent(spicture)+"&sprice="+encodeURIComponent(sprice)+"&ssum="+encodeURIComponent(ssum)+"&time="+encodeURIComponent(time), //要发送到服务器的数据
			"dataType" : "text", //指定返回的数据格式
			"success": function(){
				alert("购买成功");
			}
		})
	}
	function deleteinfor(obj){
		var id=$(obj).parent().parent().find('td');
		var cid=id.eq(0).text();
		alert(cid);
		$.ajax({
			"url" : "shopcar", //要提交的URL路径
			"type" : "GET", //发送请求的方式
			"data" : "cid="+cid, //要发送到服务器的数据
			"dataType" : "text", //指定返回的数据格式
			"error" : function() { //请求失败后要执行的代码
				alert("用户名验证时出现错误，请稍后再试或与管理员联系！");
			}
		})
	}
</script>
</head>
<body>

	<nav class="narbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class=" navbar-header">
				<button type="button " class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index2.html">宠物商店</a>
			</div>
			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="#home">宠物首页</a></li>
					<li><a href="select.jsp">联系我们</a></li>
				</ul>
				<form class="navbar-form navbar-left" role="search"
					action="SumSelect.jsp">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="搜索购物车商品"
							name="Bname">
						<button type="submit" class="btn btn-default">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</div>
				</form>
			</div>
		</div>
	</nav>
	<div style="height: 100px"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<th style="text-align: center; color: white">订单号</th>
							<th style="text-align: center; color: white">用户名</th>
							<th style="text-align: center; color: white">商品名称</th>
							<th style="text-align: center; color: white">商品图片</th>
							<th style="text-align: center; color: white">价格</th>
							<th style="text-align: center; color: white">数量</th>
							<th style="text-align: center; color: white">时间</th>
							<th style="text-align: center; color: white">确认购买</th>
							<th style="text-align: center; color: white">删除</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lst}" var="shopcar">
						<c:set var="cid" scope="request" value="${shop.getCarid()}" />
							<form>
								<tr>
									<td style="text-align: center; color: white">${shopcar.getCarid()}</td>
									<td style="text-align: center; color: white">${shopcar.getUid()}</td>
									<td style="text-align: center; color: white">${shopcar.getSname()}</td>
									<td style="text-align: center;"><img src="${shopcar.getSpicture()}" id="pic" style="height:100px; width: 100px"></td>
									<td style="text-align: center; color: white">${shopcar.getSprice()*shopcar.getSsum()}</td>
									<td style="text-align: center; color: white">${shopcar.getSsum()}</td>
									<td style="text-align: center; color: white">${shopcar.getTime()}</td>
									<td style="text-align: center; color: white"><a href="shopingcar.jsp" role="button" onclick="insertinfor(this);">购买</a></td>
									<td style="text-align: center; color: white"><a href="shopingcar.jsp" role="button" onclick="deleteinfor(this);">删除</a></td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="result"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/jquery.singlePageNav.min.js"></script>
	<script src="js/wow.min.js"></script>
</body>
</html>