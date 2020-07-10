<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bota.bean.reply"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ch">
<%
	int j = 1;
%>
<script type="text/javascript">
	function a2() {
		alert("0");
		var comment = $("#comment").val();
		$
				.ajax({
					url : "${pageContext.request.contextPath}/tjcomment.do",
					traditional : true,
					dataType : "json",
					data : {
						comment : comment
					},
					success : function(data) {
						if(data==false){
							alert("您的评论带有敏感词汇，禁止使用");
							//window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
						}
						else{
							alert(data);
							window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
						}
					},
					error : function() {
						alert("评论失败！");
					}
				});
	}
	function a3(obj) {
		var mm = JSON.stringify(obj);
		alert(mm);
		var ul = document.getElementById(mm).getElementsByTagName("li");
		var userNumber = ul[1].getAttribute("value");
		var comment_id = ul[0].getAttribute("value");
		var commentt = ul[2].getAttribute("value");
		// 		commentt=encodeURI(commentt);
		var reply = document.getElementById(comment_id).value;
		alert(comment_id + userNumber + commentt + reply);
		$.ajax({
			url : "${pageContext.request.contextPath}/tjreply.do",
			traditional : true,
			dataType : "json",
			data : {
				comment_id : comment_id,
				comment : commentt,
				userNumber : userNumber,
				commentt : commentt,
				reply : reply
			},
			success : function(data) {
				if(data==false){
					alert("您的回复带有敏感词汇，禁止使用");
					//window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
				}
				else{
					alert(data);
					window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
				}
			},
			error : function() {
				alert("评论失败！");
			}
		});
	}
	function a4(obj){
		alert("删除")
		var mm = JSON.stringify(obj);
		var ul = document.getElementById(mm).getElementsByTagName("li");
		var comment_id = ul[0].getAttribute("value");
		alert(comment_id)
		$.ajax({
			url : "${pageContext.request.contextPath}/deletecomment.do",
			traditional : true,
			dataType : "json",
			data : {
				comment_id : comment_id,
			},
			success : function(data) {
				if(data==false){
					alert("您的回复带有敏感词汇，禁止使用");
					//window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
				}
				else{
					alert(data);
					window.location.href = "${pageContext.request.contextPath}/pages/course/comment.jsp"
				}
			},
			error : function() {
				alert("删除失败！");
			}
		});
	}
</script>
<%@ include file="../common.jsp"%>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>

			<li><a href="#">作业</a></li>
			<li class="active">作业列表</li>
		</ul>
		<!-- .breadcrumb -->
	</div>
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive">
							<div id="sample-table-1">
								<c:forEach items="${commentlist }" var="commentlist">
									<%
										String m = String.valueOf(j);
										String mm = String.valueOf(j);
										request.setAttribute("m", m);
										request.setAttribute("mm", mm);
										j++;
									%>
									<ul id="${m}" style="list-style-type: none">
										<li id="comment_id" value="${commentlist.id}"
											style="list-style-type: none;">评论id:<span>${commentlist.id} ${m}</span></li>
										<li id="userNumber" value="${commentlist.userNumber}"
											style="list-style-type: none;"><a>用户：</a><span>${commentlist.userNumber}</span></li>
										<li id="commentt" value="${commentlist.content}"
											style="list-style-type: none;">评论内容: <span>${commentlist.content}</span></li>
										<li id="createtime" value="${commentlist.createtime}"
											style="list-style-type: none;">评论时间: <span>${commentlist.createtime}</span></li>
										<li style="list-style-type: none;"><input type="text" id="${commentlist.id}"/><a type="button" onclick="a3(${m})">回复</a></li>
										<c:if test="${sessionScope.studentId==commentlist.userNumber}">
											<li>
												<a type="button" onclick="a4(${m})">删除</a>
											</li>
										</c:if>
									</ul>
									<p>以下是该评论的回复</p>
									<c:forEach items="${replylist }" var="replylist">
										<c:if test="${commentlist.id == replylist.comment_id}">
											<ul id="replyul" style="list-style-type: none">
												<li id="replyuserNumber"
													value="${replylist.replyuserNumber}"
													style="list-style-type: none;"><a>用户：</a><span>${replylist.replyuserNumber}</span></li>
												<li id="reply" value="${replylist.reply}"
													style="list-style-type: none;">回复内容: <span>${replylist.reply}</span></li>
												<li id="replycreatetime" value="${replylist.createtime}"
													style="list-style-type: none;">评论时间: <span>${replylist.createtime}</span></li>
											</ul>
										</c:if>
									</c:forEach>
									<hr style="height: 5px;" color="black" width="100%" />
								</c:forEach>
							</div>
							<h4>发表评论</h4>
							<input type="text" id="comment">
							<button value="提交评论" onclick="a2()">提交评论</button>
						</div>
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.page-content -->
</div>
<!-- /.main-content -->
</body>
</html>