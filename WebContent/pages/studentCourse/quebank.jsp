<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ch">
<body>
<script type="text/javascript">
	function a1(){
		//var anwer = $("#anwer").val();
		//var idd=$(obj).parent().parent().find('td');
		//var anwer= idd.eq(1).text;
		alert("1");
		var list = [];
		for(var i=1;i<=10;i++)
		{
			var n=JSON.stringify(i);
			list[i]=document.getElementById(n).value
		}
		alert(list[2]);
		$.ajax({
            url: "${pageContext.request.contextPath}/exahomework.do",
            traditional: true,
            dataType:"json",
            data:{list:list},
            success:function(data){
            	window.location.href ="studentCourse/swlist"
             },
            error : function() {
                window.location.href ="${pageContext.request.contextPath}/pages/studentCourse/swlist.jsp"
            }
        });
	}
</script>
<%@ include file="../common.jsp" %>
	<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>

					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="#">首页</a>
						</li>

						<li>
							<a href="#">作业</a>
						</li>
						<li class="active">作业列表</li>
					</ul><!-- .breadcrumb -->
				</div>
				<%
					int i=1;
				%>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">		
							<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table id="sample-table-1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>题目</th>
														<th>你的回答</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${quebanklist}" var="quebanklist" >
 													<%
														String n=String.valueOf(i);
 														request.setAttribute("n", n);
 														i++; 
 													%>
													<tr>
														<th>${quebanklist.quesion}</th>
														<th><input type="text" id="${n}" value=""></th>
													</tr>
													</c:forEach>
													<tr>
														<th><button value="提交" onclick="a1()">提交</button></th>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
						</div><!-- /.col -->
					</div><!-- /.row -->
				</div><!-- /.page-content -->
</div><!-- /.main-content -->
</body>
</html>