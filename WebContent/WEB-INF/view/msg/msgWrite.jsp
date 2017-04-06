<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script> 



<title>쪽지 쓰깅</title>

<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td, tr {
    padding: 8px;
    text-align: left;
    border-top: 1px solid #ddd;
}

.input2 {
	width:200px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
    $(".input2").focus(function(){
        $(this).css("background-color", "#e6b800");
    });
    $(".input2").blur(function(){
        $(this).css("background-color", "#ffffff");
    });
});
</script>

</head>


<form action="msgWritePro.jp" method="post">

<table>
<tr>
<td>
<label><input type="radio" name="cate" value="일반" checked="checked" />일반</label>
<label><input type="radio" name="cate" value="공지" />공지</label>
<label><input type="radio" name="cate" value="중요" />중요</label>
<label><input type="radio" name="cate" value="배포" />배포</label>
</td>
</tr> 
<tr>
<td>
제목 <input class="input2" type="text" name="title" placeholder="제목을 입력하세요." />
</td>
</tr>
<tr>
<td>
받는사람 <input class="input2"  type="text" name="receiver" placeholder="받을실분의 성함을 입력하세요." />
</td>
</tr>
<tr>
<td>
<textarea style="width:450px; height:200px">
</textarea>
</td>
</tr>
</table>
<center>
<input type="submit" value="보내기" />
<input type="button" value="취소" />
</center>

</form>
