<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script type="text/javascript" charset="UTF-8" src="/comon/ETC/js/jquery.leanModal.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=5" type="text/css" />   
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="resource/ckeditor.js"></script>
<html>
<head>
<html>
<title> 업무관리</title>
</head>    
 <body>
<!-- ========================================================사이드바======================================================================= -->		

	<div id="page-container">
		<div id="sidebar">
			</div>
			<div id="subarea">	
				<div id="leftmenu-jp">
					<div class="leftmenu-top">
						<h2><a href="/JackPot/bmList.jp">업무관리 </a></h2>
					</div>
					
					<div id="leftmenuarea">
					<ul class="menulist" style="margin:0;padding:0;list-style:none;">
						<li >
							<a href="/JackPot/bmForm.jp">업무등록 </a><br>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
			
						
					
						<li >
							<a style="display:inline-block;height:20px;">To - Do</a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
							   		<li style="text-align:center;"><a href="/JackPot/mytodoList.jp">나의 할일 </a></li>
							   		<li><hr color=" lightgrey " size="1"></li>
							   	</ul>
						</li>
							  
							
						<li >
							<a style="display:inline-block;height:20px;">업무요청 </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmYCHList.jp">내가 한 업무 요청</a> </li>
								      <li><a href="/JackPot/SSBmYCHList.jp">수신  업무 요청</a></li>
								      <li><a href="/JackPot/ChZBGBmYCHList.jp">참조  업무 요청</a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a style="display:inline-block;height:20px;">업무보고  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmBGList.jp">내가 한 보고 </a> </li>
								      <li><a href="/JackPot/SSBGBmList.jp">수신  업무 보고 </a></li>
								      <li><a href="/JackPot/ChZBGBmList.jp">참조  업무 보고 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li >
							<a style="display:inline-block;height:20px;">업무일지  </a>
							   <ul style="-webkit-padding-start:0px;width:208px;">
								      <li><a href="/JackPot/myBmWriteList.jp">내가 작성한 업무 일지  </a> </li>
								      <li><a href="/JackPot/SSBmList.jp">수신  업무 일지  </a></li>
								      <li><a href="/JackPot/ChZBmList.jp">참조  업무 일지 </a></li>
								      <li><hr color=" lightgrey " size="1"></li>
								   </ul>
						</li>
						
						<li>
							<a >업무보관함   </a>
						</li>
						<li><hr color=" lightgrey " size="1"></li>
						
						<li>
							<a >업무보관함 관리    </a>
						</li>
					</ul>
				</div>
			</div>
			</div>
			</div>
<!-- ================================================================================================================================================= -->		
<div id="main-contents">
	<div class="con-header">
   	 <h2>나의 할 일</h2>
    	<div id="navId" class="breadcrumb-line"></div>
    	
    	<div class="content-wrap">
	    <div class="table-header">
	        <div class="listinfo">
	        <select id="pagePerRecord" name="pagePerRecord" title="[ui.lightpack.todo.common.searchCondition.pagePerRecord] 가 없습니다. 확인해주세요.">
	        	<option value="10">10</option>
	            <option value="15">15</option>
	            <option value="20">20</option>
	            <option value="30">30</option>
	            <option value="40">40</option>
	            <option value="50" selected="selected">50</option>
	        </select>
	        
	   		<div class="totalnum">전체 
	   		<span><!-- ${count}  나의할일로 등록된글 count  --></span>
	   		</div>     
	  		</div>
	  	
	  		<div class="table-search" style="right:250px;">
	  			<div class="input-unread">
	            	<label><i class="icon imp"></i> 중요</label>
	                <input type="checkbox" id="bm_state" title="중요" value="2">
	            </div>
	        </div>
	       
	            <input id="startDate" type="text" title="날짜시작" name="" class="input-datepicker w100" placeholder="From" value="" readonly="readonly">
	      			<button type="button" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
	                	<span>~</span>
	                <input id="endDate" type="text" title="날짜끝" name="" class="input-datepicker w100" placeholder="To" value="" readonly="readonly">    	
						<button type="button" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
		</div>
		<div class="table-search">
			<select name="searchColumn" title="검색타입">
	        	<option value="searchTitle">제목</option>
	        </select>
	        
	        <div class="input-search">
	        	<input name="searchWord" value="" type="text" class="w150 aTitle" title="검색어" placeholder="검색어">
	            	<button id="searchMessageListButton" class="btn btn-color5"><i class="fa fa-search"></i>
	                	<span>검색</span>
	               	</button>
	        </div>
	    </div>
	</div>
	
	<div class="content-list">
		<table class="table table-striped" id="tblList">
			<caption></caption>
            	<colgroup>
                    <col style="width: 40px;">
                    <col style="width: 40px;">
                    <col style="width: 50px;">
                    <col style="width: 140px;">
                    <col style="min-width: 200px;">
                    <col style="width: 100px;">
                    <col style="width: 120px;">
                    <col style="width: 100px;">
                </colgroup>
		        <thead>
		            <tr>
		                <th scope="col"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll"></th>
		                <th scope="col">번호</th>
		                <th scope="col">
		                    <a data-sortcolumn="PRIORITY" href="#">중요<i class="fa fa-caret-up">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		                <th scope="col">
		                    <a data-sortcolumn="FOLDER" href="#">업무 보관함<i class="fa fa-caret-up">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		                <th scope="col">
		                    <a data-sortcolumn="TITLE" href="#">제목<i class="fa fa-caret-up">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		                <th scope="col">
		                    <a data-sortcolumn="INSERTDATE" href="#">요청일<i class="fa fa-caret-up">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		                <th scope="col">
		                    <a data-sortcolumn="DUEDATE" href="#">마감일<i class="fa fa-caret-up">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		                <th scope="col">
		                    <a data-sortcolumn="TODOSTATUS" href="#">상태<i class="fa fa-caret-up active">
		                    	<span class="blind">오름차순</span></i></a>
		                </th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:if test="${count == 0 }">
		            </c:if>
		                
		                <c:if test="${count >0 }">
		                    <c:forEach var=" bdto" items="${bmdto}" >
		                    <tr class="important" style="background: rgb(249, 249, 249);">
                                <td><input name="chkid" type="checkbox" title="checkbox" value="${bm_num}" data-tk="${bm_num}" data-status="${bm_state}"></td>
		                        <td>  <!-- ${bm_num}글번호--> </td>
		                        <td>
		                            <a href="javascript:void(0);" onclick="addPriority(this, 'SPRO', 'TASK', '8797308', 'U144718');return false;">
		                                <i class="icon nonimp"></i>
		                                <span class="blind">  <!-- ${important}중요--> </span>
		                            </a>
		                        </td>
		                        <td>
		                             <!-- ${bns_box}업무보관함--> 
		                        </td>
		                        <td class="text-left">
		                            
		                                <div class="ellipsis" title="나의할일"><a href="javascript:void(0);" onclick="goURL('Y', '', '/groupware/todo/readTodoView.do', 'SPRO', 'TASK', '8797308', 'U144718')">  <!-- ${bm_title}제목--> </a></div>
		                            
		                            
		                        </td>
		                        <td>  <!-- ${bm_start}요청일--> </td>
		                        <td>
		                                
		                                   <!-- ${bm_end}마감일--> 
		                                
		                                
		                            
		                        </td>
		                        <td>
		                            
		                            
		                            
		                            
		                                <span class="todo-cate-box1 color2"><!-- ${dm_state}완료/ 미완료 -->  </span>
		                            
		                            
		                            
		                        </td>
		                    </tr>
		                    </c:forEach>
		                 </c:if>
		                
		            
		        </tbody>
		    </table>
	        
	        <div class="pagination-wrap"><ul class="pagination"><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i><span class="none">first</span></a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-left"></i><span class="none">previous</span></a></li><li class="active"><a href="javascript:void(0)">1</a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-right"></i><span class="none">next</span></a></li><li><a href="javascript:void(0)" class="disabled"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i><span class="none">last</span></a></li></ul></div><script>pageMoveAction = function(inputName, formId, movePageIndex) { jQuery('input[name=' + inputName + ']', formId).val(movePageIndex); jQuery('input[name=action]', formId).val('pagePerRecord');};</script>

	        <input name="pageIndex" type="hidden" value="1" title="현재 페이지">
	        
	        <div class="btn-wrap">
	            <button type="button" class="btn btn-color5 br" onclick="createTask();">업무 등록</button>
	            
	                <button type="button" class="btn btn-color5 br" onclick="createTaskFolderView();">보관함 지정</button>
	                <button type="button" class="btn btn-color5 br" onclick="autoComplete();">업무완료</button>
	                <button type="button" class="btn btn-color5 br" onclick="deleteTask();">삭제</button>
	            
	        </div>
		</div>





</div>
</div>



</html>