<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<html>
<body>
<jsp:include page="memo_sidebar.jsp" flush="false" />

<!-- 선택한 카테고리 메모 리스트  : 본문 -->
<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">${memoCateName}</h2>
		</div>
	
	<div class="table-header">
			<div class="listInfo">
				<select name="pageSize">
					<option value="10" selected="selected">10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				
				<div class="totalNum">
					<font color="#BDBDBD">전체</font> <span><font color="red">${viewCount}</font></span>
				</div>
				
				<select class="mr10" name="sortWord">
					<option value="REGIST_DATE:DESC" selected="selected">등록일(최신순)</option>
					<option value="REGIST_DATE:ASC">등록일(최신순)</option>
					<option value="TITLE:ASC">등록일(오름)</option>
					<option value="TITLE:DESC">등록일(내림)</option>
				</select>
			</div>
			<div class="table-search">
				<select name="tableSch" title="검색타입">
					<option value="1">제목</option>
				</select>
				<input type="text" title="검색어" name="searchWord" />
				<button type="button">검색</button> 
			</div>
		</div>
		
		<div class="content-write" style="width:100%;">
			<table>
				<c:if test="${viewCount == 0}">
					<tr>
						<td>등록된 메모가 없습니다.</td>
					</tr>
				</c:if>
			
				<c:if test="${viewCount > 0}">
				<c:forEach var="memoViewList" items="${memoViewList}"> 
					<tr>
						<td>
							<input type="checkbox" name="checkParams" />
							중요여부 체크
							<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}">${memoViewList.getMemo_title()}</a></font>
						</td>
					</tr>
					<tr>
						<td>
							<div class="memoNote">
								<pre>${memoViewList.getMemo_content()}</pre>
							</div>
						</td>
					</tr>
					<tr>	
						<td> ${memoViewList.getCate_title()} | 등록:${sdf.format(memoViewList.getMemo_enroll())} | 수정:${sdf.format(memoViewList.getMemo_modi())}</td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		</div>
	</div>
	
	<div class="page-wrap">
		<table>
			<c:if test="${viewCount > 0}">
			
			<c:if test="${startPage > 10}">
				<a href="memoViewList.jp?pageNum=${startPage-10}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="memoViewList.jp?pageNum=${i}">${i}&nbsp;</a>
			</c:forEach>
		
			<c:if test="${endPage < pageCount}">
				<a href="memoViewList.jp?pageNum=${startPage+10}">[다음]</a>
			</c:if>
			
			</c:if>
		</table>
	</div>
	
	<div class="main-bottom">
		<button type="button" class="btnEnroll" onclick="window.location='memoInsert.jp'">등록</button>
		<button type="button" class="btnMove">이동</button>
		<button type="button" class="btnDelete" onclick="window.location=''">삭제</button>
	</div>
</div>
</body>
</html>