<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<script>
	function selectDelete() {
		document.multiForm.action="memoDeletePro.jp";
		document.multiForm.submit();
	}
</script>

<html>
<body>
<jsp:include page="memo_sidebar.jsp" flush="false" />
	
<!-- 메모 전체 리스트 : 본문 -->
<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">모든 메모</h2>
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
					<font color="#BDBDBD">전체</font> <span><font color="red">${count}</font></span>
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
		
		<form name="multiForm">
		<div class="content-write" style="width:100%;">
			<table>
				<c:if test="${count == 0}">
					<tr>
						<td>등록된 메모가 없습니다.</td>
					</tr>
				</c:if>
			
				<c:if test="${count > 0}">
				<c:forEach var="memoCont" items="${memoCont}"> 
					<tr>
						<td>
							<input type="checkbox" value="${memoCont.memo_num}" name="memo_num" />
							<img alt="중요" src="/JackPot/images/memo/notImp.png" />
							<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}">${memoCont.getMemo_title()}</a></font>
						</td>
					</tr>
					<tr>
						<td>
							<div class="memoNote">
								<pre>${memoCont.getMemo_content()}</pre>
							</div>
						</td>
					</tr>
					<tr>	
						<td> ${memoCont.getCate_title()} | 등록:${sdf.format(memoCont.getMemo_enroll())} | 수정:${sdf.format(memoCont.getMemo_modi())}</td>
					</tr>
					</c:forEach>
					</c:if>
			</table>
		</div>
		</form>
	</div>
	
	<div class="page-wrap">
		<table>
			<c:if test="${count > 0}">
			
			<c:if test="${startPage > 10}">
				<a href="memoList.jp?pageNum=${startPage-10}">[이전]</a>
			</c:if>
		
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<a href="memoList.jp?pageNum=${i}">${i}&nbsp;</a>
			</c:forEach>
		
			<c:if test="${endPage < pageCount}">
				<a href="memoList.jp?pageNum=${startPage+10}">[다음]</a>
			</c:if>
			
			</c:if>
		</table>
	</div>
	
	<div class="main-bottom">
		<button type="button" class="btnEnroll" onclick="window.location='memoInsert.jp'">등록</button>
		<button type="button" class="btnMove" onclick="window.location=''">이동</button>
		<button type="button" class="btnDelete" onclick="selectDelete()">삭제</button>
	</div>
</div>
</body>
</html>