<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="jquery-3.1.1.min.js" ></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>
table {
    border-collapse: collapse;
    width: 1000;
}

th {
    background-color: #4CAF50;
    color: white;
}



.main th{
background-color: #e6e6e6;
    color: black;
}

.main2 {
background-color: #e6e6e6;
width : 1000px;
}

.employee th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size : 12px;
}

.employee {
    width: 1000px;
    height: 250px;
    border: 1px solid black;
    overflow: scroll;
}

 th, td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
    font-size : 12px;
}



.form-group th{
	background-color: #e6e6e6;
    color: black;
}

.header, .footer {
    background-color: grey;
    color: white;
    padding: 14px;
    width: 974;
    margin-bottom: 3;
}

.ins-box{
 font-size : 12px;
}

.text-point-b {padding-right:3px; color:#f05050 !important; font-weight:bold; vertical-align:middle;}

.w100 { width:100px !important; }
.w120 { width:120px !important; }
.w130 { width:130px !important; }
.w763 { width:763px !important; }


/*============================================================
tab
=============================================================*/

ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 1004px;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    
    border-top: none;
    clear: both;
    float: left;
    width: 248px;
    background: #FFFFFF;
}
.tab_content {
    float: left;
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
;
 #container {
    width: 249px;
    margin: 0 auto;
}

.highlighted {
    color: #261F1D;
    background-color: #E5C37E;
}



</style>



<script type="text/javascript" defer>

/* $(document).ready(function(){
    $("#emp1").click(function(){
        $("#emp_name").val("Dolly Duck");
    });
    
    $("#emp2").click(function(){
       callMsg();
    });
  
}); */






$(document).ready(function(){
	  $("tr").click(function() {
	    $(this).closest("tr").siblings().removeClass("highlighted");
	    $(this).toggleClass("highlighted");
	  })
	});





$(document).on('click','#emp', function(){
	
	var MyRows = $('table#htmlTable').find('tbody').find('tr');
	
	var trNum = $(this).closest('tr').prevAll().length;
	
	var id = $(MyRows[trNum]).find('td:eq(0)').html();
	/* 
	var MyRows = $('table#htmlTable').find('tbody').find('tr');
	for (var i = 0; i < MyRows.length; i++) {
	var id = $(MyRows[i]).find('td:eq(0)').html();
	}	 */
     
		   callMsg(id);
		   
});







function callMsg(id){
	 $.ajax({
	        type: "post",
	        url : "empmem.jp?id="+id,
	        dataType : "html",
	        success: test,	
	        error: whenError	
  	});
}

function test(aaa){	
    $(".main").html(aaa);	
    
}
function whenError(){
    
}



var selectedIndex= Number("") || 0;
var $tabMenuItem = $("ul.nav-tabs6 li");
var $tabContents = $(".tab-pane");

$( function() {
    $( ".datepicker" ).datepicker({
      showOn: "button",
      dateFormat: "yy-mm-dd",
      buttonImage: "images/calendar.gif",
      buttonImageOnly: true,
      buttonText: "Select date"
    });
  } );


$(document).ready(function(){
    $("input").focus(function(){
        $(this).css("background-color", "#e6b800");
    });
    $("input").blur(function(){
        $(this).css("background-color", "#ffffff");
    });
});


$(function () {
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
    });
});






$(function(){
	$("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide()
	$("ul.tab li a").click(function(){
		$("ul.tab li a").removeClass("selected");
		$(this).addClass("selected");
		$("ul.panel li").hide();
		$($(this).attr("href")).show();
		return false;
	});
});



</script>




<html>
<head>
<title>인사정보</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<input type="button" value="메인으로" onClick="window.location='main.jp'">

<div class="con-header">
	<h2>
		인사정보등록
	</h2><input type = 'hidden' id = 'flag'>
</div>
<div class="content-wrap">
	<div class="search-wrap" width="1000">
		<form id="hrBasiMatrMngGridSearchForm">
			<div class="form-group">
				<div class="main2">
				<table>
					<colgroup>
						<col width="70" />
			
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><label for="hrBasiMatrMngGridSearchForm_enplcCd"><span class="text-point-b" title='필수입력항목'>*</span>
								사업장</label></th>
							<!-- 사업장 -->
							<td><select class="w150" id="hrBasiMatrMngGridSearchForm_enplcCd" name="enplcCd">
									
										<option value="G001" selected>루크</option>
									
							</select></td>

							<th scope="row"><label for="hrBasiMatrMngGridSearchForm_searchColumn">검색어</label></th>
							<!-- 검색어 -->
							<td><select id="hrBasiMatrMngGridSearchForm_searchColumn" class="w100" name="searchColumn">
									<option value="1">성명</option>
									<option value="2">사원번호</option>
									<option value="3">부서</option>
							</select> <input type="text" class="w100" id="hrBasiMatrMngGridSearchForm_searchWord" name="searchWord" title="검색어" /></td>
						
							<td>	
								<div class="search_btn">
					<button type="submit" class="btn btn-color5" >
						<i class="fa fa-search"></i>
						검색
					</button>
				</div>
				</td>
						
						</tr>
					</tbody>
				
					
				</table>
			
			</div>
		</form>
	</div>
</div>






<div class="header">

<center><b>사원 목록(전체 사원:${count})</b></center>  
</div>


<c:if test="${count == 0}">
<table width="700" border ="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      등록된 회원이 없습니다.
    </td>
  </tr>
</table>
</c:if>


<div class="employee">

<table id="htmlTable" border="0" width="1000" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"  > 
     <th align="center"  width="100" > <b>사원번호</b></th> 
      <th align="center"  width="100" ><b>성명</b></th> 
      <th align="center"  width="50" ><b>직책</b></th>
      <th align="center"  width="100" ><b>부서</b></th>
      <th align="center"  width="150" ><b>입사일자</b></th>
      <th align="center"  width="150" ><b>주소</b></th> 
      <th align="center"  width="80" ><b>핸드폰</b></th>
      <th align="center"  width="50" ><b>이메일</b></th>
    </tr>


 <c:forEach var="article" items="${articleList}" varStatus="st">
   <tr height="30" id="emp">
    <td align="center"  width="50" >
	  ${article.emp_num}
	</td>
    <a href="#bar"><td  width="130" id="bar"> ${article.emp_name} </td></a>	
	<td width="100" align="center"> ${article.rank}	</td>
	<td align="center">${article.department} </td>
	<td align="center">${article.hiredate}</td>	
    <td align="center"  width="100"> ${article.address} </td>
    <td align="center"  width="150">${article.phone}</td>
    <td align="center"  width="50"> ${article.mail} </td>
  </tr>
  </c:forEach>

</table>
</div>





<div class="main" data-role="page">

</div>
		





</body>
</html>