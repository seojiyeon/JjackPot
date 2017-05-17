<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
	<meta charset="utf-8">
	<title>JackPotware_전자결재</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="/JackPot/css/appro.css?ver=13" rel="stylesheet" type="text/css">
	<link href="/JackPot/css/common.css?ver=6" rel="stylesheet" type="text/css">
</head>
	<body>
		<div id="page-container">
			<div id="sidebar">
			 	<jsp:include page="/sidebar.jp"></jsp:include>
			</div>
			<div id="subarea">	
					<div class="leftmenu-top">
					<h2>전자결재</h2>
					</div>
					<div id="leftmenuarea">
						<table>
								<tr>
								<td style="font-size: 20px;text-align: left;">
									기안
								</td>
							</tr>
							<tr>
								<td style="width: 200px;text-align: left; font-size: 15px; padding-left : 30px; border-bottom: 1px solid #d1d1d1;">
									<a href="/JackPot/listApproForm.jp">기안문작성</a><br/>
									<a href="/JackPot/listApproMyRequest.jp">결재요청함</a><br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 20px;text-align: left;">
									결재<br/>
								</td>
							</tr>
							<tr>
								<td style="width: 200px;text-align: left; font-size: 15px; padding-left : 30px; border-bottom:  1px solid #d1d1d1;">
									<a href="/JackPot/listApproTodo.jp">결재대기함</a><br/>
									<a href="/JackPot/listApproComplete.jp">결재진행함</a><br/>
									<a href="/JackPot/listApproAll.jp">완료문서함</a><br/>
									<a href="/JackPot/listApproReturn.jp">반려문서함</a><br/>
									<a href="/JackPot/listApproRefer.jp">참조/열람문서함</a><br/>
								</td>
							</tr>
						</table>
					</div>
			<div id="main-container">
				<div id="main-contents">
					<div class="con-header" >
						<h2>결재대기함</h2>
					</div>
					<div class="content-wrap" style="margin-left: 10px;">	
						<div style="margin-top: 40px;">
						    <select name="pagePerRecord" title="페이지당 게시글 수">
						    	<option value="10" selected="selected">10</option>
						    	<option value="15">15</option>
						    	<option value="20">20</option>
						    	<option value="30">30</option>
						    	<option value="40">40</option>
						    	<option value="50">50</option>
						    </select>
					    </div>
					    
					    <div class="content-list" style="margin-top: 10px; border-top: 2px solid #c0c0c0; width: 764px;">
			    			<table class="table table-striped" style="border-bottom: 2px solid #c0c0c0;">
			    			<caption></caption>
								<colgroup>
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:40%">
								<col style="width:10%">
								<col style="width:20%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								</colgroup>
								<thead>
							<tr style="background: rgb(249, 249, 249);">
								<th scope="col">No</th>
								<th scope="col">서식함</th>
								<th scope="col">문서제목</th>
								<th scope="col">기안자</th>
								<th scope="col">기안부서</th>
								<th scope="col">기안일</th>
							</tr>
							</thead>
							<tbody>
							<tr>
							<c:forEach var="article" items="${articleList}" varStatus="status">
										<td align="center">${article.doc_num}</td>
										<td align="center">공통</td>
										<td align="center">
										<a style="cursor:pointer" href="/JackPot/viewApproDoc.jp?doc_num=${article.doc_num}&emp_num=${article.emp_num}">${article.doc_title}</a>
										</td>
										<td align="center">${article.emp_name}</td>
										<td align="center">${article.department}</td>
										<td align="center">${article.doc_date}</td>
									</tr>
								</c:forEach>
								</tbody>
			    			</table>
						</div>
    				</div>
    			</div>
			</div>
		</div>
		</div>
	</body>
</html>