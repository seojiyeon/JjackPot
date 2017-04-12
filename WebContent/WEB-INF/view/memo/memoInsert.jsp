<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="js/jquery.form.min.js"></script>
<script src="js/jQuery.MultiFile.min.js"></script>

<head>
<title>메모</title>
</head>

<script>
	$(document).ready(function() {
		$('#memoIns input[name=sys_img]').MultiFile ({
			max: 5,
			accept: 'jpg|png|gif',
			maxfile: 1024,
			maxsize: 3024,
			
			STRING: {
				remove : "제거",
				duplicate : "$file 은 이미 선택된 파일입니다.",
				denied : "$ext 는(은) 업로드 할 수 없는 파일확장자입니다.",
				selected : "$file 을 선택했습니다.",
				toomuch : "업로드할 수 있는 최대 크기를 초과하였습니다. ($size)",
				toomany : "업로드할 수 있는 최대 갯수는 $max개 입니다.",
				toobig : "$file 은 크기가 매우 큽니다. (max $size)"
			},
			list : "#aimg-list"
		});
	});
</script>

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
		<div id="aimg-list" style="border:2px solid #c9c9c9;min-height:50px"></div>
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