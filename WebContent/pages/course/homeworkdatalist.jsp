<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ch">
<body>
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
							<a href="#">下载资料</a>
						</li>
						<li class="active">作业</li>
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
														<th>下载</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${datalist}" var="datalist" >
													<tr>
														<th>${datalist.url}<a href="${pageContext.request.contextPath}/download.do?fileName=${datalist.url}">下载</a></th>
													</tr>
													</c:forEach>
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