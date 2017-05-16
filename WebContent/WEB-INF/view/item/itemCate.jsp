<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/item.css?ver=3" type="text/css" />    

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<head>
<title>재고 관리</title>
</head>

<script>
	/* 동적으로 행추가*/
	/* 대분류 */
	var oTable;
	
	function insBigRow() {
		oTable = document.getElementById("itemBigCate");
		var oRow = oTable.insertRow();
		oRow.onmouseover = function() {oTable.clickedRowIndex=this.rowInex};
		var oCell2 = oRow.insertCell();
		var oCell3 = oRow.insertCell();
		var oCell4 = oRow.insertCell();
		
		var frmTag2 = "<input type='text' name='big_name' style='width:100px; height:20px;' />";
		var frmTag3 = "<select name='big_use'>";
		frmTag3 += "<option value='사용'>사용</option>";
		frmTag3 += "<option value='미사용'>미사용</option>";
		frmTag3 += "</select>";
		var frmTag4 = "<input type='hidden' name='check' value='1' />"
		
		oCell2.innerHTML = frmTag2;
		oCell3.innerHTML = frmTag3;
		oCell4.innerHTML = frmTag4;
	}
	/* 중분류 */
	function insMiddleRow() {
		oTable = document.getElementById("itemMiddleCate");
		var oRow = oTable.insertRow();
		oRow.onmouseover = function() {oTable.clickedRowIndex=this.rowInex};
		var oCell2 = oRow.insertCell();
		var oCell3 = oRow.insertCell();
		var oCell4 = oRow.insertCell();
		
		var frmTag2 = "<input type='text' name='middle_name' style='width:100px; height:20px;' />";
		var frmTag3 = "<select name='middle_use'>";
		frmTag3 += "<option value='사용'>사용</option>";
		frmTag3 += "<option value='미사용'>미사용</option>";
		frmTag3 += "</select>";
		var frmTag4 = "<input type='hidden' name='check' value='1' />"
		
		oCell2.innerHTML = frmTag2;
		oCell3.innerHTML = frmTag3;
		oCell4.innerHTML = frmTag4;
	}
	
	/* 내용 비어있는지 확인 */
	/* 대분류 */
	function bigFrmCheck() {
		var frm = document.bigForm;
		
		for(var i = 0; i <= frm.elements.length-1; i++) {
			if(frm.elements[i].name == "big_name") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
		}
	}
	/* 중분류 */
	function middleFrmCheck() {
		var frm = document.middleForm;
		
		for(var i = 0; i <= frm.elements.length-1; i++) {
			if(frm.elements[i].name == "middle_name") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
		}
	}
	
	/* 더블클릭시 input type="text" */
	/* 대분류 */

	
	function testchange(big_num,index){
		var con = index.innerHTML;
		index.innerHTML="<input type=text name='big_name-"+big_num+"' value="+con+" style='width:100px; height:20px;'>";
	} 
	
	function bigUseChange(big_num, index) {
		var conUse = index.innerHTML;
		index.innerHTML ="<select name='big_use-"+big_num+"'>"
		 + "<option value='사용'>사용</option>"
		 + "<option value='미사용'>미사용</option>"
		 + "</select>";
	}
	
	
	/* 선택한 카테고리 삭제 */
	function selectRemove() {
		document.bigCategory.action="bigCateRemove.jp";
		document.bigCategory.submit();
	}
</script>

<html>
<body>
<!-- 왼쪽 사이드바 -->
<div id="page-container">
	<div id="sidebar"><jsp:include page="/sidebar.jp"></jsp:include></div>
	<div id="subarea">
		<div id="leftMenu">
			<div class="leftmenu-top">
				<h2><a href="itemEnroll.jp">재고 관리</a></h2>
			</div>
		</div>
		
		<div id="leftMenuArea">
			<ul>
				<li>
					<a href="itemEnroll.jp">재고품목코드등록/관리</a>
				</li>
				<li>
					<a href="itemCate.jp">품목분류관리</a>
			</ul>
		</div>
	</div>
</div>

<!-- 본문 -->
<div class="main-container">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width: 300px;">품목분류관리</h2>
		</div>
		
		<div class="search-wrap">
			<form name="searchForm" method="get" action="itemCate.jp">
			<div class="search-content" style="position: absolute; width: 300px; top: 90px; left: 90px;">
				<table>
					<tr>
						<th>사용여부</th>
						<td>
							<select name="use">
								<option value="사용">사용</option>
								<option value="미사용">미사용</option>
								<option value="">전체</option>
							</select>
						</td>
					</tr>
				</table>
				
				</div>
				<div class="search-btn" style="position: absolute; width: 200px; left: 350px; top: 90px;">
					<input type="submit" value="검색" />
				</div>
			</form>
		</div>
		
		<!-- 대분류 -->
		<div class="big-cate">
			<form name="bigCategory" method="post" action="bigCatePro.jp" onSubmit="return bigFrmCheck();">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>대분류&nbsp;<font color="red">${bigCateCount}</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button" onclick="insBigRow();">행추가</button>
							<button type="button" onclick="selectRemove();">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th style="width:30px;">&nbsp;</th>
						<th align="left">명칭</th>
						<th align="left">사용여부</th>
					</tr>
					<tr>
						<td colspan="3">
							<table id="itemBigCate">
							</table>
						</td>
					</tr>
					
					<c:forEach var="bigCate" items="${bigCateList}">
					<tr id="big-cate">
						<td>
							<input type="checkbox" name="big_num" value="${bigCate.big_num}" />
						</td>
						<td class="modifyName" style="width:100px; height:20px;" ondblclick="testchange(${bigCate.big_num},this);">${bigCate.big_name}</td>
						<td class="modifyUse" ondblclick="bigUseChange(${bigCate.big_num}, this);">${bigCate.big_use}</td>
					</tr>
					</c:forEach>
				</table>
				<div class="btn-wrap" style="width:300px;">
					<button type="submit">저장</button>
				</div>
			</form>
		</div>
		
		<%-- <!-- 중분류 -->
		<div class="middle-cate">
			<form name="middle-category" method="post" action="" onSubmit="return middleFrmCheck();">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>중분류&nbsp;<font color="red">숫자</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button" onclick="insMiddleRow();">행추가</button>
							<button type="button">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th>코드</th>
						<th>명칭</th>
						<th>사용여부</th>
					</tr>
					<tr>
						<td colspan="3">
							<table id="itemMiddleCate">
							</table>
						</td>
					</tr>
					
					<c:forEach var="middleCate" items="${middleCateList}">
					<tr>
						<td class="middleModiCode" style="width:40px; height:20px;"></td>
						<td class="middleModiName" style="width:100px; height:20px;"></td>
						<td class="middleModiUse"></td>
					</tr>
					</c:forEach>
				</table>
				<div class="btn-wrap" style="width:300px;">
					<button type="submit">저장</button>
				</div>
			</form>
		</div>
		
		<!-- 소분류 -->
		<div class="small-cate">
			<form name="small-category">
				<div class="subtitle">
					<ul style="list-display:none;">
						<li>
							<h3>소분류&nbsp;<font color="red">숫자</font></h3>
						</li>
						<li style="text-align:right;">
							<button type="button">행추가</button>
							<button type="button">행삭제</button>
						</li>
					</ul>
				</div>
				<table>
					<tr>
						<th>코드</th>
						<th>명칭</th>
						<th>사용여부</th>
					</tr>
					<tr>
				</table>
				<div class="btn-wrap" style="width:300px;">
					<button type="submit">저장</button>
				</div>
			</form>
		</div> --%>
	</div>
</div>
</body>
</html>