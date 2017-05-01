<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/JackPot/js/jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=7" type="text/css" />   

<style>
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
td, th {
    display: table-cell;
    vertical-align: middle;
    text-align: center
    
}


.con-header {
    position: relative;
    height: 65px;
    /* margin: 0 20px; */
    padding: 25px 0 0 0;
    border-bottom: 1px solid #d1d1d1;
    background: #fff;
}
/*  테이블   */
.content-list {
    border-top: 1px solid #d1d1d1;
    /* margin: 0 20px; */
    margin-top: -1px;
}


table {
    border-spacing: 0;
    width: 100%;
    max-width: 100%;
    table-layout: fixed;
    border-collapse: collapse;
    background-color: #fff;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

.content-list .table > thead > tr > th {
    padding: 5px 5px 6px;
    height: 38px;
    line-height: 18px;
    color: #111;
    text-align: center;
    font-weight: 600;
    vertical-align: middle;
    border-bottom: 1px solid #d1d1d1;
    background: #fff;
}

.content-list .table > tbody > tr > td {
    padding: 3px 5px;
    height: 34px;
    line-height: 18px;
    color: #333;
    text-align: center;
    vertical-align: middle;
}

.table-striped > tbody > tr:nth-child(odd) > td, .table-striped > tbody > tr:nth-child(odd) > th {
    background-color: #f9f9f9;
}
</style>


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
   			<h2>수신 업무 요청</h2>
   			</div>
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
                
                <div class="totalnum">전체 <span>${bmcount }</span></div>
            </div>
            <div class="table-search" style="right:250px;">
                <div class="input-unread">
                    <label><i class="icon imp"></i> 중요</label>
                    
                        <input type="checkbox" id="checkboxPriority" title="중요" value="1">
                    
                </div>
                <div class="input-unread w180">
                     <div class="ui-step-wrap">
                         <div class="ui-step-todo">
                             <div class="step-bar"></div>
                                 <label for="statusReject" style="left: 0%;"><input type="checkbox" name="bm_state" title="반려" id="statusReject" value="20" checked=""><span class="box"></span><span class="txt">반려</span></label><!-- 반려 -->
                                 <label for="statusDelay" style="left: 33.3%;"><input type="checkbox" name="bm_state" title="지연" id="statusDelay" value="11" checked=""><span class="box"></span><span class="txt">지연</span></label><!-- 지연 -->
                                 <label for="statusNotComplete" style="left: 66.6%;"><input type="checkbox" name="bm_state" title="미완료" id="statusNotComplete" value="12" checked=""><span class="box"></span><span class="txt">미완료</span></label><!-- 미완료 -->
                                 <label for="statusComplete" style="left: 100%;"><input type="checkbox" name="bm_state" title="완료" id="statusComplete" value="1" checked=""><span class="box"></span><span class="txt">완료</span></label><!-- 완료 -->
                         </div>
                    </div>
                </div>
                
                <input id="startDate" type="text" title="날짜시작" name="" class="input-datepicker w100" placeholder="From" value="" readonly="readonly">
                	<button type="button" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
                <span>~</span>
                <input id="endDate" type="text" title="날짜끝" name="" class="input-datepicker w100" placeholder="To" value="" readonly="readonly">
                	<button type="button" class="btn btn-color7 br tbl-inner">
                		<i class="icon calendar"></i>
                	</button>
            </div>
            <div class="table-search">
                
                    <select name="searchColumn" title="검색타입">
                        <option value="emp_name" selected="selected">요청자</option>
                        <option value="searchTitle">제목</option>
                    </select>
                
                <div class="input-search">
                    
                        <input name="searchWord" value="" type="text" class="w150 aTitle" title="검색어" placeholder="검색어">
                    
                    <button id="searchMessageListButton" class="btn btn-color5"><i class="fa fa-search"></i><span>검색</span></button>
                </div>
            </div>
        </div>
   		<div class="content-list">
            <table class="table table-striped" id="tblList">	
				<thead>
                    <tr>
                        <th style="width: 40px;"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll"></th>
                        <th style="width: 40px;">번호</th>
                        <th style="width: 50px;">
                            <a data-sortcolumn="PRIORITY" href="#">중요<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 120px;">
                            <a data-sortcolumn="FOLDER" href="#">업무 보관함<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="min-width: 200px;">
                            <a data-sortcolumn="TITLE" href="#">제목<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 100px;">
                            <a data-sortcolumn="REGISTERNAME" href="#">요청자<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 120px;">
                            <a data-sortcolumn="INSERTDATE" href="#">요청일<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 120px;">
                            <a data-sortcolumn="DUEDATE" href="#">마감일<i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 100px;">
                            상태
                        </th>
                    </tr>
                </thead>
		<tbody>
		
			<c:forEach var="bmdto"  items="${bmList}">
				<tr>
                        <th style="width: 40px;"><input id="checkAll" name="" onclick="selectAllTodo()" type="checkbox" value="" title="checkAll"></th>
                        <th style="width: 40px;">${bmdto.bm_num }</th>
                        <th style="width: 50px;">
                            ${bmdto.important2}
                        </th>
                        <th style="width: 120px;">
                       		${bmdto.box_name}
                        </th>
                        <th style="min-width: 200px;">
                        	<a href="myBmYCHContent.jp?emp_num=${bmdto.emp_num}&bm_num=${bmdto.bm_num}&pageNum=${pageNum}">
                            	${bmdto.bm_title}
                           	</a>
                        </th>
                        <th style="width: 100px;">
                            ${bmdto.bm_name}
                        </th>
                        <th style="width: 120px;">
                          ${bmdto.bm_start}
                        </th>
                        <th style="width: 120px;">
                            ${ bmdto.bm_end}
                        </th>
                        <th style="width: 100px;">
                            ${bmdto.bm_state2}
                        </th>
                    </tr>
				</c:forEach>
				</tbody>
	
			</table>
			
		<div class="page-wrap">
			<table>
				<c:if test="${bmcount > 0}">
				
				<c:if test="${startPage > 10}">
					<a href="bmList.jp?pageNum=${startPage-10}">[이전]</a>
				</c:if>
		
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<a href="bmList.jp?pageNum=${i}">${i}&nbsp;</a>
				</c:forEach>
		
				<c:if test="${endPage < pageCount}">
					<a href="bmList.jp?pageNum=${startPage+10}">[다음]</a>
				</c:if>
			
				</c:if>
			</table>
		</div>
	</div>
		
		
		
		<div class="ins-box">
		    <ul>
  		      <li><i class="fa fa-exclamation-circle"></i> 업무 상태를 클릭하시면 담당자 별 처리현황을 확인 할 수 있습니다.</li>
    		</ul>
		</div>
		</div>
</body>
</html>