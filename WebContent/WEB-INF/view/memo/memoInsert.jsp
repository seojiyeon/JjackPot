<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<title>메모</title>
</head>

<body>
<div class="header">
<h2>메모 등록</h2>
<div id="navText" class="line"></div>
</div>

<form name="memoIns" method="post" action="memoInsertPro.jp" enctype="multipart/form-data" >
<table>
	<tr>
		<td>
			<select name="memo_cate">
				<c:forEach var="memoCate" items="${memoCateList}">
					<option value="${memoCate.getCate_num()}">${memoCate.getCate_title()}</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<input type="reset" value="새메모" />
 			<input type="file" name="sys_img" value="이미지 첨부" />  
			<input type="file" name="sys_file" value="파일 첨부" />
	</tr>
</table>
<br/>
<table>
	<tr>
		<td>
			<input type="checkbox" name="memo_state" value="2" >중요
			<input type="text" name="memo_title" placeholder="제목을 입력하세요." />
		</td>
	</tr>
	<tr>
		<td>
			<textarea name="memo_content" rows="20" cols="100"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="저장" />
			<input type="button" value="취소" onClick="window.location='memoList.jp'" />
		</td>
	</tr>
</table>
</form>
</body>