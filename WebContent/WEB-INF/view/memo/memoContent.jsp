<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>메모</title>
</head>

<body>

<div id="header">
<h2>모든 메모</h2>
<div id="navText" class="line"></div>
</div>

<div>
<form action="" method="post">
	<table border="1">
		<tr>
			<td>
				<input type="checkbox" name="memo_state" >중요여부체크
				&nbsp;
				${dto.getMemo_title()}
			</td>
			<td>
				${dto.getCate_title()} | 등록:${dto.getMemo_enroll()}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				${dto.getMemo_content()}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정" />
				<input type="button" value="이동" />
				<input type="button" value="삭제" onclick="window.location=''" />
				<input type="button" value="목록" onclick="window.location='memoList.jp?pageNum=${pageNum}'" />
			</td>
		</tr>
	</table>
</form>
</div>
</body>