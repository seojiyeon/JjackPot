<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
table {
    border-collapse: collapse;
    width: 100%;
}

.find th, td {
    text-align: left;
    padding: 8px;
     font-size : 12px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>

<html>
<head>
<meta charset="utf-8">
<title>자동완성</title>
<script type="text/javascript" src="js/jquery/lib/jquery.js"></script>
<script type='text/javascript' src='js/jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='js/jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='js/jquery/jquery.autocomplete.js'></script>
<link rel="stylesheet" type="text/css" href="js/jquery/jquery.autocomplete.css" />
</head>
<body>

	<script>
	var availableTags =		[

							'가나',
							'가나쵸콜렛',
							'갈갈이 삼형제',
							'북마크',
							'북까페',
							'엄마',
							'아빠',
							'북소리',
							'여러분',
							'소문',
							'소문난 식당',
							'나나나',
							'쇼',
							'쇼팽',
							'모나미',
							'한강',
							'강강수월래',
							'강촌',
							'제주도',
							'삼총사',
							'먹보',
							'먹소리',
							'수박',
							'수박 겉핥기'
						];
	</script>

	<form name="form1" method="post" action="result.php">
	  <input type="text" id="searchbox">
	  <input type="submit" id="sumit" value="검색">
	</form>

	<script>
	$(document).ready(function() {
	    $("#searchbox").autocomplete(availableTags,{ 
	        matchContains: true,
	        selectFirst: false
	    });
	});
	</script>

<script>
	

function setId(e)
{		 
	opener.document.userinput.msg_receive.value=e;
	self.close(); 
	}


</script>






<form name="msgFind" method="post" action="msgFind.jp" onSubmit="return checkIt()">
<table width="350" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       <b>사원 검색</b>
       
	  <input type="text" id="searchbox" name="id">
	  <input type="submit" id="submit" value="검색">
	       
       
       
    </td></tr></table>
</form>


<c:if test="${count==0}">
 
</c:if>

<c:if test="${count!=0}">

<div class="find">
<table> 
     <tr height="30"  > 
     <th align="center"  width="50"  > <b>이름</b></th> 
     <th align="center"  width="100" ><b>사원번호</b></th> 
     <th align="center"  width="50" ><b>부서</b></th>
     <th align="center"  width="50" ></th>
     </tr>
     
      <c:forEach var="article" items="${articleList}" >
   
    <tr>
    <td align="center">${article.emp_name} </td>
	<td align="center" width="50">${article.emp_num} </td>
    <td align="center"  width="100"> ${article.department} </td>
    <td><input type="button" value="선택" onClick="setId('${article.emp_name}')" /></td>
  </tr>
  </c:forEach>
     
          
     </table>
     
    </div>
     
     </c:if>




 
</body>
</html>


