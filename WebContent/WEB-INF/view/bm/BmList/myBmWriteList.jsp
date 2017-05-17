<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=4" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=5" type="text/css" />   
<script src="resource/ckeditor.js"></script>
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


i.icon.imp{width:13px;height:13px;margin:0 0 2px 0;background-position:-83px -55px;}
i.icon.nonimp{width:13px;height:13px;margin:0 0 2px 0;background-position:-83px -41px;}
</style>

<script>


function changeImp_click(bm_num){
	
	var abc = "."+bm_num;  //주석
	$.ajax({
		type :"post",
		url :"MybmImportantChange.jp",
		data : {bm_num:bm_num},
		success : function(important){
       		$(abc).html("중요 ");
		}, 
		error : function(){
			alert("error");
		}
		});
}

</script>

<html>
<title> 내가 작성 한 업무일지리스트</title>

</head>    
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />
	<div id="main-contents">
		<div class="con-header">
   			<h2>내가 작성 한 업무일지리스트</h2>
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
               
            </div>
          <div class="table-search">
                
                    <select name="searchColumn" title="검색타입">
                        <option value="emp_name" selected="selected">수신자  </option>
                        <option value="searchTitle">제목</option>
                    </select>
                    </div>
                <div class="btn-wrap">
                    
                        <input name="searchWord" value="" type="text" class="w150 aTitle" title="검색어" placeholder="검색어">
                    
                     <button type="button" class="btn btn-color5 br" >검색</button>
              
            </div>
        </div>
   		<div class="content-list">
            <table class="table table-striped" id="tblList">	
				<thead >
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
                            <a data-sortcolumn="REGISTERNAME" href="#">수신자 <i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>
                        <th style="width: 120px;">
                            <a data-sortcolumn="INSERTDATE" href="#">등록일 <i class="fa fa-caret-up"><span class="blind">오름차순</span></i></a>
                        </th>

                    </tr>
                </thead>
		<tbody>
		
	
			<c:forEach var="bmdto"  items="${MyBmIjList}">
				<tr>
                        <th style="width: 40px;"><input id="checkAll" name="${bmdto.bm_num}" onclick="selectAllTodo()" type="checkbox" value="${bmdto.bm_num}" title="checkAll"></th>
                        <th style="width: 40px;">${bmdto.bm_num}</th>
                        <th style="width: 50px;" class="${bmdto.bm_num}">
                        	<span onclick="changeImp_click(${bmdto.bm_num})">
								<c:if test="${bmdto.important == 1}">
									<i class="icon nonimp"></i>
								</c:if>
								<c:if test="${bmdto.important == 2}">
									<i class="icon imp"></i>
								</c:if> 
							</span>
                        </th>
                        <th style="width: 120px;">
                       		${bmdto.box_name}
                        </th>
                        <th style="min-width: 200px;">
                       		<a href="myBmIjContent.jp?bm_num=${bmdto.bm_num}&pageNum=${pageNum}">
                            	${bmdto.bm_title}
                            </a>	
                        </th>
                        <th style="width: 100px;">
                            ${bmdto.bm_name}
                        </th>
                        <th style="width: 120px;">
                          ${sdf.format(bmdto.enrollment)}
                        </th>
                    </tr>
				</c:forEach>

				</tbody>
	
			</table>
			
				
			<div class="page-wrap">
				<table>
					<c:if test="${count > 0}">
			
						<c:if test="${startPage > 10}">
							<a href="myBmWriteList.jp?pageNum=${startPage-10}" >[이전]</a>
						</c:if>
			
						<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
							<a href="myBmWriteList.jp?pageNum=${i}" style="text-align: center; font-size: 13;">${i}&nbsp;</a>
						</c:forEach>
		
						<c:if test="${endPage < pageCount}">
							<a href="myBmWriteList.jp?pageNum=${startPage+10}">[다음]</a>
						</c:if>
					</c:if>
				</table>
			</div>
	        
	        <div class="btn-wrap">
				<button type="button" class="btn btn-color5 br" onclick="window.location='bmForm.jp'">업무 등록</button>
     		   	<button type="button" onClick="window.location='myBmModify.jp?num=${bm_num}'" class="btn2 btn-color7 br">수정 </button>
    			<button type="button" onClick="window.location='bm_Ij_delete.jp?bm_num=${bm_num}'"class="btn2 btn-color7 br">삭제 </button>
			</div>

		<div class="ins-box">
		    <ul>
  		      <li><i class="fa fa-exclamation-circle"></i> 업무 상태를 클릭하시면 담당자 별 처리현황을 확인 할 수 있습니다.</li>
    		</ul>
	    </div>




</div>
</div>



</html>