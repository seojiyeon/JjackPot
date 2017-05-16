<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />

<head>
<title>메모</title>
</head>

<script>
	// 메모 휴지통으로 이동
	function selectDelete() {
		document.multiForm.action="memoDeletePro.jp?memoGroup=${memoGroup}";
		document.multiForm.submit();
	}
	
	
	// 휴지통에 있는 메모 삭제
	function selectRemove() {
		document.multiForm.action="memoRemovePro.jp?memoGroup=${memoGroup}";
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
			<c:if test="${memoGroup == 1}">
				<h2 style="margin:5px; width: 300px;">모든 메모</h2>
			</c:if>
			<c:if test="${memoGroup == 2}">
				<h2 style="margin:5px; width: 300px;">중요 메모</h2>
			</c:if>
			<c:if test="${memoGroup == 0 }">
				<h2 style="margin:5px; width: 300px;">휴지통</h2>
			</c:if>
			<c:if test="${memoGroup == 3}">
				<h2 style="margin:5px; width: 300px;">${memoCateName}</h2>
			</c:if>
		</div>
		<div class="table-header">
			<div class="listInfo" style="position: absolute; top: 80px;">
				<select name="pageSize" style="width: 50px; position: absolute;">
					<option value="10" selected>10</option>
					<option value="20">20</option>
					<option value="30">30</option>
					<option value="40">40</option>
					<option value="50">50</option>
				</select>
				
				<div class="totalNum" style="width: 100px; position: absolute; left: 80px;">
					<font color="#BDBDBD">전체</font> 
					
					<c:if test="${memoGroup == 1}">
						<span><font color="red">${count}</font></span>
					</c:if>
					<c:if test="${memoGroup == 2}">
						<span><font color="red">${impCount}</font></span>
					</c:if>
					<c:if test="${memoGroup == 0}">
						<span><font color="red">${removeCount}</font></span>
					</c:if>
					<c:if test="${memoGroup == 3}">
						<span><font color="red">${viewCount}</font></span>
					</c:if>
				</div>
			</div>
			<form action="memoList.jp?memoGroup=${memoGroup}" method="post" name="searchForm" style="position: absolute; width: 400px; text-align: right; left: 1000px;">
			<div class="table-search">
				<select name="tableSch" title="검색타입">
					<option value="memo_title">제목</option>
				</select>
				<input type="text" title="검색어" name="searchWord" />
				<input type="submit" value="검색" />
			</div>
			</form>
		</div>
		
		<form name="multiForm" method="post">
		<div class="content-write" style="width:100%; position:absolute; top:120px;">
			<!-- 전체 메모 -->
			<c:if test="${memoGroup == 1}">
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
								<input type="checkbox" value="${memoCont.memo_num}" name="memo_num" class="memoNum"/>
								<span onclick="window.location='memoStateChange.jp?memoGroup=${memoGroup}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memo_state=${memoCont.memo_state}'">
									<c:if test="${memoCont.memo_state == 1}">
										<i class="icon nonimp"></i>
									</c:if>
									<c:if test="${memoCont.memo_state == 2}">
										<i class="icon imp"></i>
									</c:if>
								</span>
								<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}">${memoCont.getMemo_title()}</a></font>
							</td>
						</tr>
						<tr>
							<td>
								<div class="memoNote">
									${memoCont.getMemo_content()}
								</div>
							</td>
						</tr>
						<tr>	
							<td> ${memoCont.getCate_title()} | 등록:${sdf.format(memoCont.getMemo_enroll())} | 수정:${sdf.format(memoCont.getMemo_modi())}</td>
						</tr>
						</c:forEach>
					</c:if>
				</table>
			</c:if>
			
			<!-- 중요메모 -->
			<c:if test="${memoGroup == 2}">
				<table>
					<c:if test="${impCount == 0}">
						<tr>
							<td>등록된 메모가 없습니다.</td>
						</tr>
					</c:if>
				
					<c:if test="${impCount > 0}">
					<c:forEach var="memoCont" items="${memoCont}"> 
						<tr>
							<td>
								<input type="checkbox" value="${memoCont.memo_num}" name="memo_num" />
								<span onclick="window.location='memoStateChange.jp?memoGroup=${memoGroup}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memo_state=${memoCont.memo_state}'">
									<c:if test="${memoCont.memo_state == 1}">
										<i class="icon nonimp"></i>
									</c:if>
									<c:if test="${memoCont.memo_state == 2}">
										<i class="icon imp"></i>
									</c:if>
								</span>
								<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}">${memoCont.memo_title}</a></font>
							</td>
						</tr>
						<tr>
							<td>
								<div class="memoNote">
									${memoCont.memo_content}
								</div>
							</td>
						</tr>
						<tr>	
							<td> ${memoCont.getCate_title()} | 등록:${sdf.format(memoCont.getMemo_enroll())} | 수정:${sdf.format(memoCont.getMemo_modi())}</td>
						</tr>
						</c:forEach>
					</c:if>
				</table>
			</c:if>
			
			<!-- 휴지통 -->
			<c:if test="${memoGroup == 0}">
				<table>
					<c:if test="${removeCount == 0}">
						<tr>
							<td>휴지통이 비어있습니다.</td>
						</tr>
					</c:if>
			
					<c:if test="${removeCount > 0}">
					<c:forEach var="memoCont" items="${memoCont}"> 
						<tr>
							<td>
								<input type="checkbox" value="${memoCont.memo_num}" name="memo_num" />
								<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}">${memoCont.getMemo_title()}</a></font>
							</td>
						</tr>
						<tr>
							<td>
								<div class="memoNote">
									${memoCont.getMemo_content()}
								</div>
							</td>
						</tr>
						<tr>	
							<td> ${memoCont.getCate_title()} | 등록:${sdf.format(memoCont.getMemo_enroll())} | 수정:${sdf.format(memoCont.getMemo_modi())}</td>
						</tr>
					</c:forEach>
					</c:if>
				</table>
			</c:if>
			
			<!-- 카테고리별 메모 -->
			<c:if test="${memoGroup == 3}">
				<table>
					<c:if test="${viewCount == 0}">
						<tr>
							<td>등록된 메모가 없습니다.</td>
						</tr>
					</c:if>
			
					<c:if test="${viewCount > 0}">
					<c:forEach var="memoCont" items="${memoCont}"> 
						<tr>
							<td>
								<input type="checkbox" value="${memoCont.memo_num}" name="memo_num" />
								<span onclick="window.location='memoStateChange.jp?memoGroup=${memoGroup}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memo_state=${memoCont.memo_state}'">
									<c:if test="${memoCont.memo_state == 1}">
										<i class="icon nonimp"></i>
									</c:if>
									<c:if test="${memoCont.memo_state == 2}">
										<i class="icon imp"></i>
									</c:if>
								</span>			
								<font size="3"><a href="memoContent.jp?emp_num=${memoCont.emp_num}&memo_num=${memoCont.memo_num}&pageNum=${pageNum}&memoGroup=${memoGroup}">${memoCont.getMemo_title()}</a></font>
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
			</c:if>
		</div>
		</form>
	</div>
	
	<div class="page-wrap" style="position: absolute; top: 800px;">
		<!-- 전체 메모 페이지 -->
		<c:if test="${memoGroup == 1}">
			<table>
				<c:if test="${count > 0}">
				
				<c:if test="${startPage > 10}">
					<a href="memoList.jp?pageNum=${startPage-10}&memoGroup=${memoGroup}">[이전]</a>
				</c:if>
		
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="memoList.jp?pageNum=${i}&memoGroup=${memoGroup}">${i}&nbsp;</a>
				</c:forEach>
		
				<c:if test="${endPage < pageCount}">
					<a href="memoList.jp?pageNum=${startPage+10}&memoGroup=${memoGroup}">[다음]</a>
				</c:if>
			
				</c:if>
			</table>
		</c:if>
		
		<!-- 중요 메모 페이지 -->
		<c:if test="${memoGroup == 2}">
			<table>
				<c:if test="${impCount > 0}">
			
				<c:if test="${startPage > 10}">
					<a href="memoList.jp?pageNum=${startPage-10}&memoGroup=${memoGroup}">[이전]</a>
				</c:if>
		
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="memoList.jp?pageNum=${i}&memoGroup=${memoGroup}">${i}&nbsp;</a>
				</c:forEach>
		
				<c:if test="${endPage < pageCount}">
					<a href="memoList.jp?pageNum=${startPage+10}&memoGroup=${memoGroup}">[다음]</a>
				</c:if>
			
				</c:if>
			</table>
		</c:if>
		
		<!-- 휴지통 페이지 -->
		<c:if test="${memoGroup == 0}">
			<table>
				<c:if test="${removeCount > 0}">
				
				<c:if test="${startPage > 10}">
					<a href="memoList.jp?pageNum=${startPage-10}&memoGroup=${memoGroup}">[이전]</a>
				</c:if>
			
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="memoList.jp?pageNum=${i}&memoGroup=${memoGroup}">${i}&nbsp;</a>
				</c:forEach>
			
				<c:if test="${endPage < pageCount}">
					<a href="memoList.jp?pageNum=${startPage+10}&memoGroup=${memoGroup}">[다음]</a>
				</c:if>
			
				</c:if>
			</table>
		</c:if>
		
		<!-- 카테고리별 페이지 -->
		<c:if test="${memoGroup == 3}">
			<table>
				<c:if test="${viewCount > 0}">
				
				<c:if test="${startPage > 10}">
					<a href="memoList.jp?pageNum=${startPage-10}&memoGroup=${memoGroup}">[이전]</a>
				</c:if>
		
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="memoList.jp?pageNum=${i}&memoGroup=${memoGroup}">${i}&nbsp;</a>
				</c:forEach>
		
				<c:if test="${endPage < pageCount}">
					<a href="memoList.jp?pageNum=${startPage+10}&memoGroup=${memoGroup}">[다음]</a>
				</c:if>
			
				</c:if>
		</table>
		</c:if>
	</div>
	
	<div class="main-bottom" style="position: absolute; top: 820px; text-align: right; width: 80%;">
		<c:if test="${memoGroup > 0}">
			<button type="button" class="btnEnroll" onclick="window.location='memoInsert.jp?memoGroup=${memoGroup}'">등록</button>
			<button type="button" class="btnMove">이동</button>
			<button type="button" class="btnDelete" onclick="selectDelete()">삭제</button>
		</c:if>
		
		<c:if test="${memoGroup == 0}">
			<button type="button" class="btnRecover">복구</button>
			<button type="button" class="btnRemove" onclick="selectRemove()">삭제</button>
		</c:if>
	</div>
</div>
</body>
</html>