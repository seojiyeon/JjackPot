<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<script type="text/javascript" src="js/jquery.min.js"></script>
	<meta charset="utf-8">
	<title>JackPotware_전자결재</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="/JackPot/css/appro.css?ver=1" rel="stylesheet" type="text/css">
	<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
	<link href="/JackPot/css/common.css?ver=1" rel="stylesheet" type="text/css">
	<link href="/JackPot/css/sub.css?ver=1" rel="stylesheet" type="text/css">
	
</head>

	<body>
		<div id="page-container">
			<div id="sidebar">
		
			</div>
			<div id="subarea">	
				<div id="leftmenu-jp">
					<div class="leftmenu-top">
					</div>
					<div id="leftmenuarea">
						<table>
							<tr>
								<td>
									기안
								</td>
							</tr>
							<tr>
								<td>
									<a href="/JackPot/listApproForm.jp">기안문작성</a><br/>
									결재요청함<br/>
									임시저장함<br/>
								<hr>	
								</td>
							</tr>
							<tr>
								<td>
									결재<br/>
								</td>
							</tr>
							<tr>
								<td>
									<a href="/JackPot/listApproTodo.jp">결재대기함</a><br/>
									결재진행함<br/>
									완료문서함<br/>
									반려문서함<br/>
									참조/열람문서함<br/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			<div id="main-container-jp">
				<div id="main-contents">
					<h2>결재대기함</h2>	
				    	<form name ="form">
							기안자 <input type="text"> 양식명 <input type="text"><br/>
							문서제목 <input type="text" width="40">
							배정일 <input type="text" title="시작일" id="StartDatepicker" name="searchStartDate" placeholder="시작일">
							 	 <input type="text" title="종료일" id="EndDatepicker" name="searchEndDate" placeholder="종료일">	
							<input type="button" value="검색">
						</form>
						<div>
						    <select name="pagePerRecord" title="페이지당 게시글 수">
						    	<option value="10" selected="selected">10</option>
						    	<option value="15">15</option>
						    	<option value="20">20</option>
						    	<option value="30">30</option>
						    	<option value="40">40</option>
						    	<option value="50">50</option>
						    </select>
					    </div>
					    
					    <div>
			    			<table >
								<colgroup>
								<col width="4%">
								<col width="8%">
								<col width="7%">
								<col width="*">
								<col width="10%">
								<col width="13%">
								<col width="13%">
								<col width="13%">
								</colgroup>
							<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">서식함</th>
								<th scope="col">유형</th>
								<th scope="col">문서제목</th>
								<th scope="col">기안자</th>
								<th scope="col">기안부서</th>
								<th scope="col">기안일</th>
								<th scope="col">배정일</th>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td colspan ="8" align="center">검색 결과가 존재하지 않습니다.</td>
							</tr>
							</tbody>
			    			</table>
						</div>
    				</div>
    			</div>
			</div>
		</div>
	</body>
</html>