<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<link href="/JackPot/css/memo.css?ver=1" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />

<head>
<title>메모</title>

<style type="text/css">
/* 탭 메뉴 */
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
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 80%;
    background: #FFFFFF;
}
.tab_content {
	width: 80%;
	height: 80%;
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
</head>

<script>
	/* 탭 메뉴 */
	$(function () {

    	$(".tab_content").hide();
    	$(".tab_content:first").show();

	    $("ul.tabs li").click(function () {
    	    $("ul.tabs li").removeClass("active").css("color", "#333");
        	//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
	        $(this).addClass("active").css("color", "darkred");
    	    $(".tab_content").hide()
        	var activeTab = $(this).attr("rel");
	        $("#" + activeTab).fadeIn()
    	});
	});
	
	/* 동적으로 행 추가 */
	var oTbl;
	
	function insCate() {
		oTbl = document.getElementById("addTable");
		var oRow = oTbl.insertRow();
		oRow.onmouseover = function() {oTbl.clickedRowIndex = this.rowIndex};
		var oCell = oRow.insertCell();
		
		var frmTag = "<input type='text' name='cate_title' style='width:210px; height:20px;' />";
		frmTag += "&nbsp;<input type='button' value='삭제' onClick='removeRow()' style='cursor:hand' />";
		oCell.innerHTML = frmTag;
	}
	
	function removeRow() {
		oTbl.deleteRow(oTbl.clickedRowIndex);
	}
	
	function frmCheck() {
		var frm = document.cateInsert;
		
		for(var i=0; i<=frm.elements.length-1;i++) {
			if(frm.elements[i].name == "cate_title") {
				if(!frm.elements[i].value) {
					alert("폴더 이름을 입력 하시요.");
					frm.elements[i].focus();
					return false;
				}
			}
		}
	}

</script>

<html>
<body>
<jsp:include page="memo_sidebar.jsp" flush="false" />

<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width:300px;">폴더 관리</h2>
		</div>
		
		<div id="container">
			<ul class="tabs">
				<li class="active" rel="tab1">폴더 등록</li>
				<li rel="tab2">폴더 수정</li>
			</ul>
			<div class="tab_container">
				<div id="tab1" class="tab_content">
					<form method="post" action="memoCateInsert.jp" name="cateInsert" onSubmit="return frmCheck();">
						<table>
							<tr>
								<td>
									<table>
										<tr>
											<td>
												<button type="button" style="cursor:hand" onClick="insCate();">폴더 추가</button>
												<input type="submit" value="저장" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table id="addTable">
									</table>
								</td>
							</tr>										
						</table>
					</form>
				</div>
				<div id="tab2" class="tab_content">
					<form method="post" action="">
						<div class="tab-main">
							<div class="tab-left">
								<ul id="memoFolder">
									<c:if test="${memoCateCount == 0}">
										<li>등록된 폴더가 없습니다.</li>
									</c:if>
									<c:if test="${memoCateCount > 0}">
										<c:forEach var="memoCate" items="${memoCateList}">
											<li class="cateName">${memoCate.cate_title}</li>
										</c:forEach>
									</c:if>
								</ul>
							</div>
							<div class="tab-right">
								<ul style="list-diplay:none;">
									<li>
										<input type="text" name="cate_title" class="cateTitle"/>
									</li>
									<li>
										<input type="submit" value="수정" />
										<button type="button">삭제</button>
									</li>
								</ul>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>