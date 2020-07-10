<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ch">
<script type="text/javascript">
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

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">		
							<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table id="sample-table-1" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>id</th>
														<th>课程名称</th>
														<th>课程编号</th>
														<th>老师</th>
														<th>学生</th>
														<th>学号</th>
														<th>第几份作业</th>
														<th>是否完成</th>
														<th>操作</th>
														<th>成绩</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${fileswlist}" var="swlist" >
													<tr>
														<th>${swlist.id}</th>
														<th>${swlist.coursename}</th>
														<th>${swlist.courseNumber}</th>
														<th>${swlist.teacher }</th>
														<th>${swlist.studentname }</th>
														<th>${swlist.studentid }</th>
														<th>${swlist.workid}</th>
														<c:if test="${swlist.status == 1}">
															<th>已完成</th>
															<th><a type="button" href="selectxq.do?studentid=${swlist.studentid}&courseNumber=${swlist.courseNumber}&workid=${swlist.workid}">查看详情</a></th>
															<th>${swlist.grade}</th>
														</c:if>
														<c:if test="${swlist.status == 0}">
															<th>未完成</th>
															<th>
																<form action="${pageContext.request.contextPath}/regist.do?&id=${swlist.id}&courseNumber=${swlist.courseNumber}" method="post" enctype="multipart/form-data">
																	<input type="file" name="file"/>
																	<input type="submit" value="提交"/>
																</form>
															</th>
															<th></th>
														</c:if>
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