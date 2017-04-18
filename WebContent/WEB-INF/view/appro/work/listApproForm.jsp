<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/JackPot/css/appro.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/basic.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>


<html>

<head>
<title>JackPot 전자결재</title>
</head>
<body>
	<div id="page-container-jp">
		<div id="sidebar">
			<span style="color:white">(사이드바)</span>
		</div>
		<div id="subarea">	
		<div id="leftmenu-jp">전자결재(중간사이드)
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
			<!-- 메인부분에 들어가는 내용 -->
				<h2>양식목록</h2>
				<hr>
				<div id="content-jp">
					<div>
		<table width="600" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>No</strong></td>
			<td width="60"><strong>시스템</strong></td>
        	<td width="60"><strong>서식함</strong></td>
        	<td width="70"><strong>즐겨찾기</strong></td>
			<td width="100"><strong>양식명</strong></td>
			<td width="80"><strong>담당부서</strong></td>
			<td width="80"><strong>담당자</strong></td>
      	      </tr>
      	      
	</table>
				<input type="button" value="기안문작성" onclick="window.location='listApproDoc.jp'">					
					
					
					
					</div>
				</div>
				
			<!-- 메인부분에 들어가는 내용 -->	
			</div> 		
		</div>
	</div>
</body>
</html>