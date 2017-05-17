<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>



<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" var="tdate"/>
<link href="/JackPot/css/appro.css?ver=9" rel="stylesheet" type="text/css">
<link href="/JackPot/css/basic.css?ver=2" rel="stylesheet" type="text/css">
<link href="/JackPot/css/theme.css?ver=3" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=4" rel="stylesheet" type="text/css">
<link href="/JackPot/css/quick.css?ver=5" rel="stylesheet" type="text/css">
<html>
<head>
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="ckeditor_appro/ckeditor.js"></script>
	<script src="/JackPot/js/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 	<script src="/JackPot/js/jquery.bpopup.min.js"></script>
 	<script src="//code.jquery.com/jquery.min.js"></script>
 	
<script type="text/javascript">
var idlist = new Array();
var idlistname = new Array();
var positionlist = new Array();
var positionlistck =new Array();
$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});
	
	$(".branchlist>a").click(function(){
	    var branchlist = $(this).next("ul");
	    if(branchlist.is(":visible")){
	       branchlist.slideUp();
	    }else{
	       branchlist.slideDown();
	    }
	});

	$(".namelist>li>a").click(function(){
	    var namelist = $(this);
	    var id = $(this).attr('id');
	    var name = $(this).text();
	    var name2 = name.substring(0,3);
	    var position = name.substring(4,6);
	    var selectedlist = $(".selected-list");
	    
	    var exist = false;
	   for(i = 0 ; i < idlist.length;i++){
	      if(idlist[i] == id){
	         exist = true;
	         break;
	      }
	   } 
	   if(! exist){
	      $(".selected-list").append("<li class="+id+"><a href=# onClick=selected_click("+id+")>"+name+"</a></li>");
	      idlist.push(id);
	      idlistname.push(name2);
	      positionlist.push(position);
	   }
	    namelist.css("background-color","turquoise");
	 });
});

	function approver_find(){
		$('.find_test').show();
		$('.find_form').show();
		var input = document.getElementById("approver_test").value;
		$.ajax({
			type:"post",
			url:"http://localhost:8080/JackPot/approverFind.jp",
			data: {ap:input},
			success: function(approver_info){
				$.each(approver_info,function(i,v){
					$('.find_result'+i).html("<th>"+v.emp_name +"</th><th> "+ v.position +"</th><th> "+ v.department+"</th>"+"<br/>");
					$('.find_result'+i).show();
				});
			},
			error:function(){
				alert("error");
			}
		});
	}
	
	
	
	 function selected_click(id){
	       var select = id.getAttribute('id');
	       $("."+select).remove();
	       $("#"+select).css("background-color","white");
	       for(i=0;i < idlist.length; i++){
	          if(idlist[i] == select){
	             idlist.splice(i,1);
	             idlistname.splice(i,1);
	             positionlist.splice(i,1);
	          }
	       }
	    }  

	function layer_open(el){
		document.all.approver_test.value = "";
		
		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		temp.find('a.cbtn').click(function(e){
			
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut(); //'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			
			e.preventDefault();
		});
		
		temp.find('.apbtn').click(function(e){
			var exist = false;
			console.log(idlist);
			console.log(positionlistck);
			for (i=0; i <idlist.length;i++){
				if(idlist[i] == positionlistck[i])
					exist = true;
					break;
			}
				if(! exist){
				$('#apprLine0BTr').append("<td height=60 id="+idlist[i]+">"+idlistname[i]+"</td>");
				$('#apprLine0TTr').append("<th style=width:80px; id="+idlist[i]+">"+positionlist[i]+"</th>");
				positionlistck.push(idlist[i]);
			} 
			if(bg){
				$('.layer').fadeOut();
			}else{
				
				temp.fadeOut();
			} 
			e.preventDefault();
		});
		
		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});
		$('.find_test').hide();
		$('.find_form').hide();
		
	}
    	
    	function add_apply(){   
    		      $('#approver_add').html("<input type=text id=participants readonly value="+idlistname+"></input><input type=hidden name=participants value="+idlist+"></input>")
    		}
	</script>	
	
		
</head>

<title>JackPot 전자결재_양식목록</title>

<body>
<div id="page-container">
	<div id="sidebar-a">
	<span style="color:white">
	(사이드바)
	</span>
	</div>
	<div id="subarea">	
		<div id="leftmenu">
		전자결재
		(중간사이드)
			<table>
							<tr>
								<td style="font-size: 20px;text-align: left;">
									기안
								</td>
							</tr>
							<tr>
								<td style="width: 200px;text-align: left; font-size: 15px; padding-left : 30px; border-bottom: 1px solid #d1d1d1;">
									<a href="/JackPot/listApproForm.jp">기안문작성</a><br/>
									<a href="/JackPot/listApproMyRequest.jp">결재요청함</a><br/>
									<br/>
								</td>
							</tr>
							<tr>
								<td style="font-size: 20px;text-align: left;">
									결재<br/>
								</td>
							</tr>
							<tr>
								<td style="width: 200px;text-align: left; font-size: 15px; padding-left : 30px; border-bottom:  1px solid #d1d1d1;">
									<a href="/JackPot/listApproTodo.jp">결재대기함</a><br/>
									<a href="/JackPot/listApproComplete.jp">결재진행함</a><br/>
									<a href="/JackPot/listApproAll.jp">완료문서함</a><br/>
									<a href="/JackPot/listApproReturn.jp">반려문서함</a><br/>
									<a href="/JackPot/listApproRefer.jp">참조/열람문서함</a><br/>
								</td>
							</tr>
			</table>
		</div>
	</div>
	<div id="main-container">
		<div id="main-contents">
			<div class="con-header">
				<h2>
					기안문 작성
				</h2>
				<div id="navText" class="breadcrumb-line"></div>
			</div>
	
    <div class="content-wrap approval responsive">
    <div class="content-write">
    <form id="apprDocForm" name="apprDocForm" method="post" action="/JackPot/listApproDocPro.jp" enctype="multipart/form-data" onsubmit="return checkContents()">
		<h2>대외발신공문</h2>
				
		<div id="formButtonDiv" class="btn-wrap pt10">
    	<a href="#" onclick="layer_open('layer1');return false;"><button id="addApprLineButton" type="button" class="btn btn-color5 br">결재선</button></a>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    	</div>
			<div class="appline-wrap">
				<div class="fright" id="apprLine0Tr" style="display: block;">
					<div class="fleft">	
						<table class="appline-lst">
							<caption></caption>
							<tbody>
								<tr id="apprLine0TTr">
									<th rowspan="2">
										
											발<br class="last">신<br class="last">부<br class="last">서	
										
											         
									</th>	
								<th class="apprLine">기 안</th>
								</tr>
								<tr id="apprLine0BTr">									
								<td height="60">${emp_name}</td>
								</tr>
																	
							</tbody>
							
						</table>
						
					</div>
											
				</div>
				<br/>

				<div class="clearfix">
					<div class="fright" id="apprLine1Tr" style="display: none; width: 0px;">
						<table class="appline-lst">
							<caption></caption>
							<tbody>	
								</tbody><tbody>	
								<tr id="apprLine1TTr">	
									<th rowspan="2">					
									합<br><br>의
									</th>
								</tr>
								<tr id="apprLine1BTr">									
								</tr>
							
							</tbody>
						</table>						
					</div>						
				</div>
			</div>
								
				<div class="form-block bdr-t">

					<table class="table separate">
						<caption></caption>
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>						
						<tbody>							
							<tr>
								<th>문서번호</th>
								<td>자동채번</td>
								<th>기안일자</th>
								<td>${tdate}</td>
							</tr>
							<tr>
								<th>기안자</th>
								<td>${emp_name}&nbsp;${position_name}</td>
								<th>기안부서</th>
								<td>${department_name}</td>
								<td>
								<input type="hidden" name="emp_name" 		value="${emp_name}">
								<input type="hidden" name="position" 		value="${emp_position}">
								<input type="hidden" name="department" 		value="${emp_department}">
								<input type="hidden" name="temp_num" 		value="${temp_num}">
								<input type="hidden" name="emp_num" 		value="${emp_num}">
								<input type="hidden" name="branch" 			value="${edto.branch}">
								<input type="hidden" name="doc_date" 		value="${tdate}">
								</td>
							</tr>
							
							<tr>
								<th>참조자</th>
								<td colspan="3">
					    			<input id="doc_title" type="text" title="참조자" name="doc_title" class="inputbox w100p" maxlength="65" placeholder="검색버튼을 클릭하세요">
								</td>
							</tr>
							<tr>
								<th><span class="text-point-b">*</span>문서제목</th>
								<td colspan="3">
					    			<input id="doc_title" type="text" title="문서제목" name="doc_title" class="inputbox w100p" maxlength="65" placeholder="문서제목을 입력하세요. ">
								</td>
							</tr>
							<tr>
								<th>수신</th>
								<td></td>
								<th>참조</th>
								<td></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td></td>
								<th>FAX</th>
								<td></td>
							</tr>
							<tr>
							<th>주소</th>
							<td colspan="3"></td>
							</tr>
														
						</tbody>
					</table>
					<!--ckeditor 부분 -->
					<div>
						<textarea class="ckeditor" cols="1" id="editor" name="doc_content" rows="15"></textarea>
						<script>
							CKEDITOR.replace(
									'editor',
									{
										toolbar:'Basic',
										skin:'moonocolor'
									}
								);
							
						</script>
					</div>
				</div>
					<div id="formButtonDiv" class="btn-wrap pt10">
	    <button id="addApprLineButton" 				type="button" class="btn btn-color5 br">결재선</button>
	    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
	    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
	    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
	    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
    </div>
     </form>
				</div>
		</div>
	</div>
</div>
</div>
	<div id="layer1" class="pop-layer">
		<div class="modal-header">
			<form name="approver_form" method="post">
					<h2 class="modal-title">결재선지정</h2>
			</form>
		</div>
		
			<div class="tab_container">
				<ul class="tabs">
	   				<li><a href="#tab1">조직도</a></li>
	   				
	    			<li><a href="#tab2">검색</a></li>
				</ul>
    			<div id="tab1" class="tab_content">
	        		<!--Content-->
	        		<div id="participants-Form">
      <div class="participants-Form-container">
         <div class="participants-Form-contents">
            <div class="participants-Form-con-contents">
               <ul>
               <li>
                  <ul>
                     <li class="branchlist"><a href="#" class="강남">강남지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '강남'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>   
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="종로">종로지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '종로'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="동작">동작지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '동작'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="수지">수지지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '수지'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="용인">용인지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '용인'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="인천서구">인천서구지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '인천서구'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
               </li>
               </ul>
            </div>
            <div class="participants-Form-con-selected">
               <ul class="selected-list">
               </ul>
            </div>
         </div>
           <div class="participants-Form-btn">
            <ul>
               <li><a href="#" onclick="add_apply();">결재선 추가</a></li>
            </ul>
         </div>
         <div id="approver_add" style="margin-left: 10px">
	        <input type="text" readonly  style="width: 440px;">
	     </div>
       
      </div>
   </div>
	        
	    		</div>
		   		<div id="tab2" class="tab_content">
		       		<!--Content-->
		       		<form id="approver_info" class="approver_info">
			       		<input type="text" id="approver_test" name="approver_test" onkeypress="if(event.keyCode==13){approver_find();event.returnValue=false}"/>
						<input type="button" value="검색" onclick="approver_find();"/>
					</form>
					
					<table id="find_test" class="find_test">
					<thead>
						<tr><th scope="col">이름</th><th scope="col">직급</th><th scope="col">부서</th></tr>
					</thead>
					</table>
					
					<table id="find_form" class="find_form">
						<tr class="find_result0" style="color: blue;">
						</tr>
						<tr class="find_result1" style="color: blue;">
						</tr>
						<tr class="find_result2" style="color: blue;">
						</tr>
						<tr class="find_result3" style="color: blue;">
						</tr>
						<tr class="find_result4" style="color: blue;">
						</tr>
					</table>
				
		    	</div>
			</div>
			<div class="btn-r">
				<input type="button" class = "apbtn" value="적용">
				<a href="#" class="cbtn">닫기</a>
			</div>
		</div>
		
			<hr>
			<input type="hidden" value="${temp_num}" name="temp_num" class="temp_num" />
</body>
</html>

<c:forEach var="a" items="${emp }">
${a.emp_no}
</c:forEach>
