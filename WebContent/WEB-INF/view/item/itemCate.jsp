<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/item.css?ver=2" type="text/css" />    

<head>
<title>재고 관리</title>
</head>

<html>
<body>
<!-- 왼쪽 사이드바 -->
<div id="page-container">
	<div id="sidebar"></div>
	<div id="subarea">
		<div id="leftMenu">
			<div class="leftmenu-top">
				<h2><a href="itemEnroll.jp">재고 관리</a></h2>
			</div>
		</div>
		
		<div id="leftMenuArea">
			<ul>
				<li>
					<a href="itemEnroll.jp">재고품목코드등록/관리</a>
				</li>
				<li>
					<a href="itemCate.jp">품목분류관리</a>
			</ul>
		</div>
	</div>
</div>

<!-- 본문 -->
<div class="main-container">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">품목분류관리</h2>
		</div>
		
		<div class="search-wrap">
			<form name="searchForm" method="post">
			<div class="search-content" style="position: absolute; width: 300px; top: 90px; left: 90px;">
				<table>
					<tr>
						<th>사용여부</th>
						<td>
							<select name="use">
								<option value="사용">사용</option>
								<option value="미사용">미사용</option>
								<option value="전체">전체</option>
							</select>
					</tr>
				</table>
				</div>
				<div class="search-btn" style="position: absolute; width: 200px; left: 350px; top: 90px;">
					<input type="submit" value="검색" />
				</div>
			</form>
		</div>
		
		<!-- 대분류 -->
		<div class="big-cate">
			<form name="big-category">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>대분류&nbsp;<font color="red">숫자</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button">행추가</button>
							<button type="button">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th>코드</th>
						<th>명칭</th>
						<th>사용여부</th>
					</tr>
					<tr>
				</table>
				<div class="btn-wrap">
					<button type="submit">저장</button>
				</div>
			</form>
		</div>
		
		<!-- 중분류 -->
		<div class="middle-cate">
			<form name="middle-category">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>중분류&nbsp;<font color="red">숫자</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button">행추가</button>
							<button type="button">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th>코드</th>
						<th>명칭</th>
						<th>사용여부</th>
					</tr>
					<tr>
				</table>
				<div class="btn-wrap">
					<button type="submit">저장</button>
				</div>
			</form>
		</div>
		
		<!-- 소분류 -->
		<div class="small-cate">
			<form name="small-category">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>소분류&nbsp;<font color="red">숫자</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button">행추가</button>
							<button type="button">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th>코드</th>
						<th>명칭</th>
						<th>사용여부</th>
					</tr>
					<tr>
				</table>
				<div class="btn-wrap">
					<button type="submit">저장</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>