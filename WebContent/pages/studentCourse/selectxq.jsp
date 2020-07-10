<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ch">
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
														<th>题目</th>
														<th>你的回答</th>
														<th>答案</th>
														<th>得分</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${selectxqlist}" var="selectxqlist" >
													<tr>
														<th>${selectxqlist.quesion}</th>
														<th>${selectxqlist.sanswer}</th>
														<th>${selectxqlist.getAnswer()}</th>
														<th>${selectxqlist.grade}</th>
													</tr>
													</c:forEach>
													<th><a href="fanhui.do">返回</a></th>
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