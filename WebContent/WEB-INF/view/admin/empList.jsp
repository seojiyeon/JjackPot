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

tr:hover{background-color: #ffe6ff}


.form-group th{
	background-color: #e6e6e6;
    color: black;
}

.header, .footer {
    background-color: grey;
    color: white;
    padding: 15px;
    width: 1000px;
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
    width: 100%;
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



</style>

<br />






<script type="text/javascript">
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



$(document).ready(function(){
    $("#emp1").click(function(){
        $("#emp_name").val("Dolly Duck");
    });
    
    $("#emp2").click(function(){
        $("#emp_name").val("");
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
<body>
<center><b>사원 목록(전체 사원:${count})</b>  
<input type="button" value="Excel로 저장" onClick="window.location='#'">
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
<%-- <c:if test="${count > 0}"> --%>
<table border="0" width="1000" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"  > 
     <th align="center"  width="100"  > <b>사원번호</b></th> 
      <th align="center"  width="100" ><b>성명</b></th> 
      <th align="center"  width="50" ><b>직책</b></th>
      <th align="center"  width="100" ><b>부서</b></th>
      <th align="center"  width="150" ><b>입사일자</b></th>
      <th align="center"  width="150" ><b>주소</b></th> 
      <th align="center"  width="80" ><b>핸드폰</b></th>
      <th align="center"  width="50" ><b>이메일</b></th>
    </tr>

<div id="pink">
 <c:forEach var="article" items="${articleList}" varStatus="st">
   <tr height="30" id="emp${st.count}">
    <td align="center"  width="50" >
	  ${article.emp_num}
	</td>
    <td  width="130"> ${article.emp_name} </td>	
	<td width="100" align="center"> ${article.rank}	</td>
	<td align="center">${article.department} </td>
	<td align="center">${article.hiredate}</td>	
    <td align="center"  width="100"> ${article.address} </td>
    <td align="center"  width="150">${article.phone}</td>
    <td align="center"  width="50"> ${article.mail} </td>
  </tr>
  </c:forEach>
</div>
</table>
</div>





<%-- </c:if> --%>




<div class="main">


	<form id="hrBasiMatrMngForm" action="#">

		<input type="hidden" id='hrBasiMatrMngForm_pEmplNo' name="pEmplNo" /> <input type="hidden" id="hrBasiMatrMngForm_emplNo" name="emplNo" />

		<div class="subtitle">
			<h3>
				상세정보
			</h3>
			<!-- 상제정보 -->
		</div>
		
	
		
		
		
	
		<div class="tab-content">
			<div id="tabs-1" class="tab-pane active">
				<div class="content-write mb10">
				
				
			<div id="container">	

			<ul class="tabs" >
			<li class="active" checked="checked" rel="tab1">인적사항</li>
			<li rel="tab2">가족사항</li>
			<li rel="tab3">학력정보</li>
		    <li rel="tab4">어학정보</li>
			<li rel="tab5">자격증</li>
			<li rel="tab6">경력정보</li>
			<li rel="tab7">발령정보</li>
			<li rel="tab8">교육정보</li>
			<li rel="tab9">상벌정보</li>
			<li rel="tab10">병역정보</li>
			<li rel="tab11">기타정보</li>
			</ul>
				
		<div class="tab_container">
        <div id="tab1" class="tab_content" style="display:block;">
				
					<table class="table border-top separate">
						<colgroup>
							<col width="165" />
							<col width="100" />
							<col width="300" />
							<col width="100" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="6">
									<div class="photo-regi">
										<div class="photo">
										
											<img src="<c:url value="/images/choo.PNG"/>" id="hrBasiMatrMngForm_potoFileName" name="potoFileName" style="width: 100%; height: 100%">
										</div>
									</div>
								</td>
								<th scope="row"><label for="hrBasiMatrMngForm_emplMgntNo">사원번호</label></th>
								<td style="min-width: 290px;"><input type="text" class="w100" id="emp_num" value="" name="emp_num" maxlength="20" />
									
								<th scope="row"><label for="hrBasiMatrMngForm_emplNm">성명</label></th>
								<td style="min-width: 290px;"><input type="text" class="w100" id="emp_name" value="" name="emp_name" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_emplEngNm">영문성명</label></th>
								<!-- 영문성명 -->
								<td><input class="w100" type="text" id="hrBasiMatrMngForm_emplEngNm" name="emplEngNm" maxlength="50" /></td>
								<th scope="row"><label for="hrBasiMatrMngForm_emplHanNm">한자성명</label></th>
								<!-- 한자성명 -->
								<td><input type="text" class="w100" id="hrBasiMatrMngForm_emplHanNm" name="emplHanNm" maxlength="50" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_resRegNo">주민등록번호</label></th>
								<!-- 주민등록번호 -->
								<td><input type="text" class="w120" id="hrBasiMatrMngForm_resRegNo" name="resRegNo" readonly="readonly" />
									<button type="button" id="hrBasiMatrMngForm_resRegNoBtn" class="btn btn-color7 br">
										확인/수정
									</button>
								</td>
								<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_gndrGbn">성별</label></th>
								<!-- 성별 -->
								<td><span class="radio-check"> <input type="radio" id="hrBasiMatrMngForm_gndrGbn_m" name="gndrGbn" value="M"> <label for="hrBasiMatrMngForm_gndrGbn_m">남</label>
									<!-- 남 --> <input type="radio" id="hrBasiMatrMngForm_gndrGbn_f" name="gndrGbn" value="F"> <label for="hrBasiMatrMngForm_gndrGbn_f">여</label>
									<!-- 여 -->
								</span></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_birthYmd">생년월일</label></th>
								<!-- 생년월일 -->
								<td><input type="text" class="w100" id="hrBasiMatrMngForm_birthYmd" name="birthYmd" /></td>

								<th scope="row"><label for="hrBasiMatrMngForm_solarLunar">양력
										음력</label></th>
								<!-- 양력음력 -->
								<td><span class="radio-check"> <input type="radio" id="hrBasiMatrMngForm_solarLunar_1" name="solarLunar" value="1"> <label
										for="hrBasiMatrMngForm_solarLunar_1">양력</label>
									<!-- 양력 --> <input type="radio" id="hrBasiMatrMngForm_solarLunar_2" name="solarLunar" value="2"> <label for="hrBasiMatrMngForm_solarLunar_2">음력</label>
									<!-- 음력 -->
								</span></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_marriageYn">결혼유무</label></th>
								<!-- 결혼유무 -->
								<td><span class="radio-check"> <input type="radio" id="hrBasiMatrMngForm_marriageYn_1" name="marriageYn" value="1"> <label
										for="hrBasiMatrMngForm_marriageYn_1">기혼</label>
									<!-- 기혼 --> <input type="radio" id="hrBasiMatrMngForm_marriageYn_2" name="marriageYn" value="2" checked="checked"> <label for="hrBasiMatrMngForm_marriageYn_2">미혼</label>
									<!-- 미혼 -->
								</span></td>
								<th scope="row"><label for="hrBasiMatrMngForm_marriageDt">결혼기념일</label></th>
								<!-- 결혼기념일 -->
								<td><input type="text" class="w100" id="hrBasiMatrMngForm_marriageDt" name="marriageDt" /></td>
							</tr>
<br />
						</tbody>
					</table>
				
				<div class="content-write mb10">
					<table class="table border-top separate">
						<colgroup>
							<col width="120">
							<col width="150">
							<col width="120">
							<col width="270">
							<col width="100">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_officeTelNo">회사전화</label></th>
								<!-- 회사전화 -->
								<td><input type="text" class="w100" id="hrBasiMatrMngForm_officeTelNo" name="officeTelNo" /></td>
								<th scope="row"><label for="hrBasiMatrMngForm_homeTelNo">자택전화</label></th>
								<!-- 자택전화 -->
								<td><input type="text" class="w130" id="hrBasiMatrMngForm_homeTelNo" name="homeTelNo" /></td>
								<th scope="row"><label for="hrBasiMatrMngForm_mobileTelNo">핸드폰</label></th>
								<!-- 핸드폰 -->
								
								<td><input type="text" class="w130" id="hrBasiMatrMngForm_mobileTelNo" name="mobileTelNo" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_emailId">회사이메일</label></th>
								<td colspan="5"><input type="text" class="w763" id="hrBasiMatrMngForm_emailId" name="emailId" /></td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_emailId2">외부이메일</label></th>
								<td colspan="5"><input type="text" class="w763" id="hrBasiMatrMngForm_emailId2" name="emailId2" /></td>
							</tr>
							<tr>
								<th scope="row" rowspan="2"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_addr">자택주소</label></th>
								<!-- 주소 -->
								<td colspan="5"><input type="text" class="disabled w70" id="hrBasiMatrMngForm_zipNo" name="zipNo" readonly="readonly" /> <!-- <input type="button" id="hrBasiMatrMngForm_btnAddr" name="btnAddr" value='[조회] 가 없습니다. 확인해주세요.' /> -->
									<button type="button" id="hrBasiMatrMngForm_btnAddr" class="btn btn-color5 br tbl-inner">
										<i class="fa fa-search"></i>
									</button> <input type="text" class="disabled w663" id="hrBasiMatrMngForm_addr" name="addr" readonly="readonly" /></td>
							</tr>
							<tr>
								<td colspan="5"><input type="text" id="hrBasiMatrMngForm_ddr2" name="addr2" class="w763" maxlength="100" /></td>
							</tr>
								
						</tbody>
					</table>
				</div>
				

				<div class="content-write mb10">
					<table class="table border-top separate">
						<colgroup>
							<col width="120" />
							<col width="150" />
							<col width="120" />
							<col width="270" />
							<col width="100" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_enplcCd">사업장</label></th>
								<!-- 사업장 -->
								<td><select class="w120" id="hrBasiMatrMngForm_enplcCd" name="enplcCd">
										
											<option value="G001">루크</option>
										
								</select></td>
								<th scope="row"><label for="hrBasiMatrMngForm_deptNm">부서</label></th>
								<!-- 부서 -->
								<td><input type="text" class="w120" id="hrBasiMatrMngForm_deptNm" name="deptNm" readonly="readonly" /></td>
								<th scope="row"><label>영문부서</label></th>
								<!-- 영문부서 -->
								<td id="engSuggest"><input type="text" class="w170 disabled" readonly id="hrBasiMatrMngForm_deptEngNm" name="deptEngNm"  placeholder="예시) M.I.S Team"/>
								</td>
							</tr>
							<tr>
								<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_paseBaseMeth">급여계약기준</label></th>
								<!-- 급여지급기준 -->
								<td><select class="w120" id="hrBasiMatrMngForm_paseBaseMeth" name="paseBaseMeth">
										
											<option value="01">연봉제</option>
										
											<option value="02">직급호봉제</option>
										
											<option value="03">계약직</option>
										
											<option value="04">임원</option>
										
								</select></td>
								<th scope="row"><label for="hrBasiMatrMngForm_jobTitleName">직급</label></th>
								<!-- 직급 -->
								<td><input type="text" class="w120" id="hrBasiMatrMngForm_jobTitleName" name="jobTitleName" disabled="disabled" /></td>
							<th scope="row"><label >영문직급</label></th>
								<!-- 영문직급 -->
								<td id="engSuggest"><input type="text" class="w170 disabled" readonly id="hrBasiMatrMngForm_jobGradeEngNm" name="jobGradeEngNm" placeholder="예시) Clerk / Manager"/></td>
								</select></td>
							</tr>
							<tr>
								<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_hdfcGbn">재직구분</label></th>
								<!-- 재직구분 -->
								<td>
									<select class="w120" id="hrBasiMatrMngForm_hdfcGbn" name="hdfcGbn">
										
											<option value="1">재직</option>
										
											<option value="2">휴직</option>
										
											<option value="9">퇴직</option>
										
									</select>
								</td>

								<th scope="row"><label for="hrBasiMatrMngForm_responNm">직책</label></th>
								<!-- 직책명 -->
								<td><input type="text" class="w120" id="hrBasiMatrMngForm_responNm" name="responNm" readonly="readonly" /></td>

								<th scope="row"><label for="hrBasiMatrMngForm_payGrade">호봉</label></th>
								<!-- 호봉 -->
								<td>
									<select class="w120" id="hrBasiMatrMngForm_payGrade" name="payGrade">
									
										<option value="1">1</option>
									
										<option value="2">2</option>
									
										<option value="3">3</option>
									
										<option value="4">4</option>
									
										<option value="5">5</option>
									
										<option value="6">6</option>
									
										<option value="7">7</option>
									
										<option value="8">8</option>
									
										<option value="9">9</option>
									
										<option value="10">10</option>
									
										<option value="11">11</option>
									
										<option value="12">12</option>
									
										<option value="13">13</option>
									
										<option value="14">14</option>
									
										<option value="15">15</option>
									
										<option value="16">16</option>
									
										<option value="17">17</option>
									
										<option value="18">18</option>
									
										<option value="19">19</option>
									
										<option value="20">20</option>
									
										<option value="21">21</option>
									
										<option value="22">22</option>
									
										<option value="23">23</option>
									
										<option value="24">24</option>
									
										<option value="25">25</option>
									
										<option value="26">26</option>
									
										<option value="27">27</option>
									
										<option value="28">28</option>
									
										<option value="29">29</option>
									
										<option value="30">30</option>
									
										<option value="31">31</option>
									
										<option value="32">32</option>
									
										<option value="33">33</option>
									
										<option value="34">34</option>
									
										<option value="35">35</option>
									
										<option value="36">36</option>
									
										<option value="37">37</option>
									
										<option value="38">38</option>
									
										<option value="39">39</option>
									
										<option value="40">40</option>
									
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="hrBasiMatrMngForm_probYn">수습여부/적용율</label></th>
								<!-- 수습여부/적용률 -->
								<td><input type="checkbox" id="hrBasiMatrMngForm_probYn" name="probYn" > <input type="text" class="w93 ml10" id="hrBasiMatrMngForm_probAdptRate"
									name="probAdptRate" /> <input type="hidden" name="payAdptRate" /></td>
								<th scope="row"><label for="hrBasiMatrMngForm_probStartDt">수습기간</label></th>
								<!-- 수습기간 -->
								<td><input type="text" class="datepicker" name="s1"/>
									 - <input type="text" class="datepicker" name="s2" />
								</td>
								<th scope="row" rowspan="2"><label for="hrBasiMatrMngForm_rmk">비고</label></th>
								<td rowspan="2"><textarea id="hrBasiMatrMngForm_rmk" name="rmk" rows="3" cols="23" style="resize: none;"></textarea></td>
							</tr>
							<tr>
								<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="hrBasiMatrMngForm_entryDt">입사일자</label></th>
								<!-- 입사일자 -->
								<td><input type="text" class="datepicker" name="s3" /></td>
								
								<th scope="row"><label for="hrBasiMatrMngForm_retireDt">퇴직일자</label></th>
								<!-- 퇴직일자 -->
								<td><input type="text" class="datepicker" name="s4" />
								</td>
							</tr>
							
							
						</tbody>
					</table>
				</div>
				<br />

				<div class="btn-wrap fright w30p">
					
						<button type="button" id="hrBasiMatrMngForm_uploadSample" class="btn btn-color7 br mb5">
							업로드 양식
						</button>
						<button type="button" id="hrBasiMatrMngForm_excelupload" class="btn btn-color13 br mb5">
							엑셀 업로드
						</button>
						<button type="button" id="hrBasiMatrMngForm_retire_reg" class="btn btn-color13 br mb5">
							퇴사자 등록
						</button>
						<!-- 삭제 -->
					
					
						<button type="button" id="hrBasiMatrMngFormDelete" class="btn btn-color7 br mb5">
							삭제
						</button>
						<!-- 삭제 -->
					
					
						<button type="button" id="hrBasiMatrMngFormUpdate" class="btn btn-color5 br mb5">
							저장
						</button>
						<!-- 저장 -->
					
				</div>

				

			</div>
			</div>
			<!-- //id="tabs-1" -->
			
			</div>
			
			
			
			<div id="tab2" class="tab_content" style="display:none;">
				<!-- 가족정보관리 -->
				<div class="subtitle">
		
					<table id="fmlyInfoMng_table" class="table separate fleft mt5">
						<colgroup>
							<col width="200" />
							<col width="100" />
							<col width="250" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="fmlyInfoMngGrid_allcount">전체 공제대상 가족수(본인포함)</label></th>
								<td><input type="text" class="w50 text-right" id="fmlyInfoMngGrid_allcount" readonly="readonly" /></td>
								<th scope="row"><label for="fmlyInfoMngGrid_twentydown">전체 공제대상 가족 중 20세이하 자녀수</th>
								<td><input type="text" class="w50 text-right" id="fmlyInfoMngGrid_twentydown" readonly="readonly" /></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<div class="fright">
						<button type="button" id="fmlyInfoMng_resRegNoBtn" class="btn btn-color7 br">
							주민등록번호 확인
						</button>
						
							<button type="button" id="fmlyInfoMng_resRegNoAddBtn" class="btn btn-color7 br">
								행추가
							</button>
						
						
							<button type="button" onclick="spro.fmlyInfoMngInstance.removeFmlyInfoMng();" class="btn btn-color7 br">
								행삭제
							</button>
						
					</div>
				</div>
				<div class="content-list bdr-t">
					<div id="fmlyInfoMngGrid" style="width: 100%; height: 169px;"></div>
					<!-- //게시물 목록 -->
					<!-- 게시물 하단 버튼 -->
					<div class="btn-wrap">
						
							<button type="button" onclick="spro.fmlyInfoMngInstance.saveFmlyInfoMng();" class="btn btn-color5 br">
								저장
							</button>
						
					</div>
				</div>
			</div>
			</div>
			
			
			
	</div>
</div>
</div>
		





</body>
</html>