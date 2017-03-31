<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>KT bizmeka EZ_전자결재</title>

<!-- favicon -->
<link rel="shortcut icon" href="/images/common/favicon.ico">
<link rel="stylesheet" href="/css/plugins.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/basic.css">
<link rel="stylesheet" href="/css/theme01/theme.css">
<link type="text/css" rel="stylesheet" href="/css/dev.css">

<script type="text/javascript">var contextRoot = "";</script>
<script type="text/javascript" src="/js/langResource/ko.js"></script>

<!--[if lt IE 9]>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<!--[if gte IE 9]>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/jquery-2.1.4.min.js"></script>
<![endif]-->
<!--[if !IE]> -->
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/jquery-2.1.4.min.js"></script>
<!-- <![endif]-->

<script type="text/javascript">jQuery.migrateMute = true;</script>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/plugins.js"></script>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/jquery-ui-1.10.4/js/jquery-ui-1.10.4.min.js"></script> 
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/moment.min.js"></script>
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/commonExtend.js"></script>

<link rel="stylesheet" href="https://ezportal.bizmeka.com/js/malihu-custom-scrollbar-plugin-3.1.3/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="https://ezportal.bizmeka.com/js/malihu-custom-scrollbar-plugin-3.1.3/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript" src="https://ezportal.bizmeka.com/js/commonSProject.js"></script>
<script type="text/javascript" src="/js/commonProject.js"></script>
<script type="text/javascript" src="/JavaScriptServlet"></script>

		<script type="text/javascript" src="/js/units/groupware/approval/apprCommon.js"></script>
	<script type="text/javascript">
	(function($){
		$(function() {
			$("div.leftmenu-inner-scroll").mCustomScrollbar({
				axis : "y",
				theme: "minimal-dark",//3d
				scrollButtons:{enable:true},
				setHeight : "100%"
			});
		});
	})(jQuery);
	</script>
<style>.cke{visibility:hidden;}</style>
<style id="poshytip-css-tip-twitter" type="text/css">
div.tip-twitter{visibility:hidden;position:absolute;top:0;left:0;}
div.tip-twitter table.tip-table, 
div.tip-twitter table.tip-table td{margin:0;font-family:inherit;font-size:inherit;font-weight:inherit;font-style:inherit;font-variant:inherit;vertical-align:middle;}
div.tip-twitter td.tip-bg-image span{display:block;font:1px/1px sans-serif;height:10px;width:10px;overflow:hidden;}
div.tip-twitter td.tip-right{background-position:100% 0;}
div.tip-twitter td.tip-bottom{background-position:100% 100%;}
div.tip-twitter td.tip-left{background-position:0 100%;}
div.tip-twitter div.tip-inner{background-position:-10px -10px;}
div.tip-twitter div.tip-arrow{visibility:hidden;position:absolute;overflow:hidden;font:1px/1px sans-serif;}</style>
<style type="text/css" id="vakata-stylesheet">#vakata-dragged 
{ display:block; margin:0 0 0 0; padding:4px 4px 4px 24px; position:absolute; top:-2000px; line-height:16px; z-index:10000; } 
#vakata-contextmenu { display:block; visibility:hidden; left:0; top:-200px; position:absolute; margin:0; padding:0; min-width:180px; background:#ebebeb; border:1px solid silver; z-index:10000; *width:180px; } 
#vakata-contextmenu ul { min-width:180px; *width:180px; } 
#vakata-contextmenu ul, #vakata-contextmenu li { margin:0; padding:0; list-style-type:none; display:block; } 
#vakata-contextmenu li { line-height:20px; min-height:20px; position:relative; padding:0px; } 
#vakata-contextmenu li a { padding:1px 6px; line-height:17px; display:block; text-decoration:none; margin:1px 1px 0 1px; } 
#vakata-contextmenu li ins { float:left; width:16px; height:16px; text-decoration:none; margin-right:2px; } #vakata-contextmenu li a:hover, 
#vakata-contextmenu li.vakata-hover > a { background:gray; color:white; } #vakata-contextmenu li ul { display:none; position:absolute; top:-2px; left:100%; background:#ebebeb; border:1px solid gray; } 
#vakata-contextmenu .right { right:100%; left:auto; } #vakata-contextmenu .bottom { bottom:-1px; top:auto; } 
#vakata-contextmenu li.vakata-separator { min-height:0; height:1px; line-height:1px; font-size:1px; overflow:hidden; margin:0 2px; background:silver; /* border-top:1px solid #fefefe; */ padding:0; } </style>
<style type="text/css" id="jstree-stylesheet">.jstree ul, .jstree li { display:block; margin:0 0 0 0; padding:0 0 0 0; list-style-type:none; } 
.jstree li { display:block; min-height:18px; line-height:18px; white-space:nowrap; margin-left:18px; min-width:18px; } 
.jstree-rtl li { margin-left:0; margin-right:18px; } .jstree > ul > li { margin-left:0px; } 
.jstree-rtl > ul > li { margin-right:0px; } .jstree ins { display:inline-block; text-decoration:none; width:18px; height:18px; margin:0 0 0 0; padding:0; } 
.jstree a { display:inline-block; line-height:16px; height:16px; color:black; white-space:nowrap; text-decoration:none; padding:1px 2px; margin:0; } 
.jstree a:focus { outline: none; } .jstree a > ins { height:16px; width:16px; } .jstree a > .jstree-icon { margin-right:3px; }
.jstree-rtl a > .jstree-icon { margin-left:3px; margin-right:0; } li.jstree-open > ul { display:block; } li.jstree-closed > ul { display:none; } 
#vakata-dragged ins { display:block; text-decoration:none; width:16px; height:16px; margin:0 0 0 0; padding:0; position:absolute; top:4px; left:4px;  -moz-border-radius:4px; border-radius:4px; -webkit-border-radius:4px; } 
#vakata-dragged .jstree-ok { background:green; } #vakata-dragged .jstree-invalid { background:red; } 
#jstree-marker { padding:0; margin:0; font-size:12px; overflow:hidden; height:12px; width:8px; position:absolute; top:-30px; z-index:10001; background-repeat:no-repeat; 
display:none; background-color:transparent; text-shadow:1px 1px 1px white; color:black; line-height:10px; } 
#jstree-marker-line { padding:0; margin:0; line-height:0%; font-size:1px; overflow:hidden; height:1px; width:100px; 
position:absolute; top:-30px; z-index:10000; background-repeat:no-repeat; display:none; background-color:#456c43;  cursor:pointer; border:1px solid 
#eeeeee; border-left:0; -moz-box-shadow: 0px 0px 2px #666; -webkit-box-shadow: 0px 0px 2px #666; box-shadow: 0px 0px 2px #666;  -moz-border-radius:1px; border-radius:1px; -webkit-border-radius:1px; }
.jstree .jstree-real-checkbox { display:none; } .jstree-themeroller .ui-icon { overflow:visible; } .jstree-themeroller a { padding:0 2px; } 
.jstree-themeroller .jstree-no-icon { display:none; }.jstree .jstree-wholerow-real { position:relative; z-index:1; } .jstree .jstree-wholerow-real li { cursor:pointer; } 
.jstree .jstree-wholerow-real a { border-left-color:transparent !important; border-right-color:transparent !important; } .jstree .jstree-wholerow { position:relative; z-index:0; height:0; } 
.jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { width:100%; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li, .jstree 
.jstree-wholerow a { margin:0 !important; padding:0 !important; } .jstree .jstree-wholerow, .jstree .jstree-wholerow ul, .jstree .jstree-wholerow li { background:transparent !important; }
.jstree .jstree-wholerow ins, .jstree .jstree-wholerow span, .jstree .jstree-wholerow input { display:none !important; }.jstree .jstree-wholerow a, 
.jstree .jstree-wholerow a:hover { text-indent:-9999px; !important; width:100%; padding:0 !important; border-right-width:0px !important; border-left-width:0px !important; } 
.jstree .jstree-wholerow-span { position:absolute; left:0; margin:0px; padding:0; height:18px; border-width:0; padding:0; z-index:0; }</style></head>


    <!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<!-- script구문 내부에 해당 메소드를 입력합니다. -->    
    <script type="text/javascript">
	    $(function() {
		        $( "#StartDatepicker").datepicker({
		        	dateFormat:'yy/mm/dd', //날짜표현양식 설정
	        	    showButtonPanel: true,//버튼보이기설정
	        	    changeMonth: true, //달 변경 설정
	                changeYear: true,// 년 변경 설정
	                nextText: '다음 달',
	                prevText: '이전 달',
	                currentText:'오늘 날짜',
	                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],//각 요일 표시 설정
	                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']//각 달 월 표시 설정
		        });
		        $( "#EndDatepicker").datepicker({
			        dateFormat:'yy/mm/dd',
	        	    showButtonPanel: true,
	        	    changeMonth: true, 
	                changeYear: true,
	                nextText: '다음 달',
	                prevText: '이전 달',
	                currentText:'오늘 날짜',
	                dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		        });
		});
	    
	        
	</script>
    <div>
    	<div>	
    		<h2>결재대기함</h2>	
    	</div>
    	<div>
    	<form name ="form">
			기안자 <input type="text"> 양식명 <input type="text"><br/>
			문서제목 <input type="text" width="40">
			배정일 <input type="text" title="시작일" id="StartDatepicker" name="searchStartDate" placeholder="시작일">
			 	 <input type="text" title="종료일" id="EndDatepicker" name="searchEndDate" placeholder="종료일">	
			<input type="button" value="검색">
			</form>  	
    	</div>
    </div>
    
    <div>
    <select name="pagePerRecord" title="페이지당 게시글 수">
    	<option value="10" selected="selected">10</option>
    	<option value="15">15</option>
    	<option value="20">20</option>
    	<option value="30">30</option>
    	<option value="40">40</option>
    	<option value="50">50</option>
    </select>
    
    </div>
    
    <div>
    	<div>
    	<table >
			<colgroup>
				<col width="4%">
				<col width="8%">
				<col width="7%">
				<col width="*">
				<col width="10%">
				<col width="13%">
				<col width="13%">
				<col width="13%">
				</colgroup>
			<thead>
				<tr>
					<th scope="col">No</th>
					<th scope="col">서식함</th>
					<th scope="col">유형</th>
					<th scope="col">문서제목</th>
					<th scope="col">기안자</th>
					<th scope="col">기안부서</th>
					<th scope="col">기안일</th>
					<th scope="col">배정일</th>
				</tr>
			</thead>
			<tbody>
			<tr>
			<td colspan ="8" align="center">검색 결과가 존재하지 않습니다.</td>
			</tr>
			</tbody>
    	</table>
    	</div>
    </div>