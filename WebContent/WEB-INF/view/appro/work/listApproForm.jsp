<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/JackPot/css/appro.css?ver=13" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=2" rel="stylesheet" type="text/css">
<html>
    <head>    
    <script type="text/javascript">
    	function page_move(style_num){
    		if(style_num == 2){
    			location.href = "listApproDoc.jp";
    		}else if(style_num == 1){
    			location.href = "#";
    		}
    	}
    		
    </script>    
    
    </head>    
<body>
	<div id="page-container">
		<div id="sidebar">
			<jsp:include page="/sidebar.jp"></jsp:include>
		</div>
		<div id="subarea">
				<div class="leftmenu-top h2">
					<h2><a href="/JackPot/listApproForm.jp">전자결재</a></h2>
				</div>
				<div id="leftmenearea">
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
			</div>
		
		<div id="main-container" style="position:fixed;top:0;left:270;width:100%;">
			<div id="main-contents">
			<div class="con-header">
				<h2>양식목록</h2>
			</div>
			<div class="content-wrap">
				<div class="pl10">
					<form id="" name="" method="post" action="">
						<div id="formListDiv">
							<div class="table-header p10 mt-10" style="width: 954px;">
								<div class="listinfo">
									<select name="">
										<option value="10" selected="selected">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
									<div class="totalnum">
										전체
										<span>${doc_count}</span>
									</div>
								</div>
							</div>
	<div class="content-list">
		<table class="table table-striped" style="border-bottom: 2px solid #c0c0c0;border-top:2px solid #c0c0c0;">  
		<caption></caption> 
		<colgroup>
		<col style="width: 50px;">
		<col style="width: 100px;">
		<col style="width: 100px;">
		<col style="width: 400px;">
		<col style="width: 200px;">
		<col style="width: 90px;">
		<col style="width: 75px;">
		<col style="width: 75px;">
		</colgroup>
			<thead>
				<tr style="background: rgb(249, 249, 249);">
					<th scope="col">
						NO
					</th>
					<th scope="col">
						시스템
					</th>
					<th scope="col">
						서식함
					</th>
					<th scope="col">
						양식명
					</th>
					<th scope="col">
						담당부서
					</th>
					<th scope="col">
					    담당자
					</th>
				</tr>
			</thead>
			
				<tbody>
				<tr class="boardItemLine">
					<c:forEach var="article" items="${list}" varStatus="status" >
						<td align = "center">
							${article.style_num}
						</td>
						<td align = "center">
							${article.style_type}
						</td>
						<td align = "center">
						${article.group_string}
						</td>
						<td align = "center">
						<c:if test="${article.style_num == 1 }"> <!-- 출장신청서 -->
							<a style="cursor:pointer" href="/JackPot/listApproDoc.jp?style_num=${article.style_num}&style_type=${article.style_type}&style_group=${article.group_string}">${article.style_name}</a>
						</c:if>
						<c:if test="${article.style_num == 2 }"> <!-- 기안용지 -->
							<a style="cursor:pointer" href="/JackPot/listApproDoc.jp?style_num=${article.style_num}&style_type=${article.style_type}&style_group=${article.group_string}">${article.style_name}</a>
						</c:if>
						<c:if test="${article.style_num == 3 }"> <!-- 협조문 -->
							<a style="cursor:pointer" href="/JackPot/listApproCoop.jp?style_num=${article.style_num}&style_type=${article.style_type}&style_group=${article.group_string}">${article.style_name}</a>
						</c:if>
						<c:if test="${article.style_num == 4 }"> <!-- 대외발신공문 -->
							<a style="cursor:pointer" href="/JackPot/listApproOfficial.jp?style_num=${article.style_num}&style_type=${article.style_type}&style_group=${article.group_string}">${article.style_name}</a>
						</c:if>
						</td>
						<td align = "center">
							
						</td>
						<td align = "center">
							
						</td>
				</tr>
					</c:forEach>
				</tbody>
		</table>
	</div>	
		
							
							
							<div class="content-list approval">
								<input type="hidden" value="기안문작성" onclick="window.location='listApproDoc.jp'"/>
							</div>
						</div>
					</form>
				</div>
			
			</div>
			
		
		</div>
	</div>     
	</div>    
</body>
</html>