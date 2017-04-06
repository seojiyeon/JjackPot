<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<title>재고관리</title>

<style type="text/css">
	#WholeBox { width : 600px; }
	.searchBox {
		width : 200px;
		border : 1px;
		border-style : solid;
		position : absolute;
			left: 0;
			top: 0;
		display: block;
	}
	.bigCate { 
		width : 400px;
		border : 1px;
		border-style : solid;
		position : absolute;
			left: 0;
			top: 60;
		display: block;
	}
	.middleCate {
		width : 400px;
		border : 1px;
		border-style : solid;
		position : absolute;
			left: 410;
			top: 60;
		display: block;
	}
	.smallCate {
		width : 400px;
		border : 1px;
		border-style : solid;
		position : absolute;
			left: 820;
			top: 60;
		display: block;
	}
</style>

</head>

<script>

	/* 행추가 버튼 클릭시 동적으로 행추가 */
	var oTable;
	
	function insBigRow() {
		oTable = document.getElementById("itemBigCate");
		var oRow = oTable.insertRow();
		oRow.onmouseover=function(){oTable.clickedRowIndex=this.rowIndex};
		var oCell1 = oRow.insertCell();
		var oCell2 = oRow.insertCell();
		var oCell3 = oRow.insertCell();
		
		var frmTag1 = "<input type=text name=big_cate style=width:100px; height:20px;> ";
		oCell1.innerHTML = frmTag1;
		var frmTag2 = "<input type=text name=big_name style=width:40px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<select name='big_use'>";
		frmTag3 += "<option value='사용'>사용</option>";
		frmTag3 += "<option value='미사용'>미사용</option>";
		frmTag3 += "</select>";
		oCell3.innerHTML = frmTag3;
	}
	
	function insMiddleRow() {
		oTable = document.getElementById("itemMiddleCate");
		var oRow = oTable.insertRow();
		oRow.onmouseover=function(){oTable.clickedRowIndex=this.rowIndex};
		var oCell1 = oRow.insertCell();
		var oCell2 = oRow.insertCell();
		var oCell3 = oRow.insertCell();
		
		var frmTag1 = "<input type=text name=middle_cate style=width:100px; height:20px;> ";
		oCell1.innerHTML = frmTag1;
		var frmTag2 = "<input type=text name=middle_name style=width:40px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<select name='middle_use'>";
		frmTag3 += "<option value='사용'>사용</option>";
		frmTag3 += "<option value='미사용'>미사용</option>";
		frmTag3 += "</select>";
		oCell3.innerHTML = frmTag3;
	}
	
	function insSmallRow() {
		oTable = document.getElementById("itemSmallCate");
		var oRow = oTable.insertRow();
		oRow.onmouseover=function(){oTable.clickedRowIndex=this.rowIndex};
		var oCell1 = oRow.insertCell();
		var oCell2 = oRow.insertCell();
		var oCell3 = oRow.insertCell();
		
		var frmTag1 = "<input type=text name=small_cate style=width:100px; height:20px;> ";
		oCell1.innerHTML = frmTag1;
		var frmTag2 = "<input type=text name=small_name style=width:40px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<select name='small_use'>";
		frmTag3 += "<option value='사용'>사용</option>";
		frmTag3 += "<option value='미사용'>미사용</option>";
		frmTag3 += "</select>";
		oCell3.innerHTML = frmTag3;
	}
	
	/* 저장버튼 클릭시 내용이 비어있는 경우에 발생하는 이벤트 */
	function bigFrmCheck() {
		var frm = document.bigForm;
		
		for(var i = 0; i <= frm.elements.length-1; i++) {
			if(frm.elements[i].name == "big_cate") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
			if(frm.elements[i].name == "big_name") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
		}
	}
	
	function middleFrmCheck() {
		var frm = document.middleForm;
		
		for(var i = 0; i <= frm.elements.length-1; i++) {
			if(frm.elements[i].name == "middle_cate") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
			if(frm.elements[i].name == "middle_name") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
		}
	}
	
	function smallFrmCheck() {
		var frm = document.smallForm;
		
		for(var i = 0; i <= frm.elements.length-1; i++) {
			if(frm.elements[i].name == "small_cate") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
			if(frm.elements[i].name == "small_name") {
				if(!frm.elements[i].value) {
					alert("값을 입력하세요.");
					frm.elements[i].foucus();
					return;
				}
			}
		}
	}
	
	/* 선택시 색상 변경 */
	var orgBgColor = '#ffffff';
	var orgTblColor = '#000000';
	
	function HighlightTR(target, backColor, textColor) {
		var tBody = target.parentNode;
		var trs = tBody.getElementsByTagName('tr');
	//	var check = document.forms.middleForm;
	//	var check1 = check.tr.middle;
		
		for(var i = 0; i < trs.length; i++) {
			if(trs[i] != target) {
				trs[i].style.backgroundColor = orgBgColor;
				trs[i].style.color = orgTblColor;
			} else {
				trs[i].style.backgroundColor = backColor;
				trs[i].style.color = textColor;
				
				if(target == 'tr.big') {
					tr.middle = "";
				}
			}
		}
	}
	
	/* 더블클릭시 input type="text" 나타남 */
	$(document).ready(function() {
		$(".modifyName").dblclick(function() {
			var con = this.innerHTML;
			this.innerHTML="<input type=text name='big_name' value="+con+">";
		});
		
		$(".modifyUse").dblclick(function() {
			var conUse = this.innerHTML;
			this.innerHTML ="<select name='big_use'>"
			 + "<option value='사용'>사용</option>"
			 + "<option value='미사용'>미사용</option>"
			 + "</select>";
		});
	});
	
</script>

<body>
	<div id="WholeBox">
		<div class="searchBox">
			<table border="1">
				<tr>
					<td>사용여부
						<select name="use">
							<option value="사용">사용</option>
							<option value="미사용">미사용</option>
							<option value="전체">전체</option>
						</select>
					</td>
					<td>
						<input type="submit" value="검색" />
			</table>
		</div>
		<div class="bigCate">
		<form method="post" action="bigCatePro.jp" name="bigForm" onSubmit="return bigFrmCheck()">
			<table border="1" id="itemBigCate">
				<tr>
					<td><h2>대분류 ${bigCateCount}</h2></td>
					<td colspan="2">
						<input type="button" value="행추가" onclick="insBigRow();" />
						<input type="button" value="행삭제" onclick="deleteRow();" />
					</td>
				</tr>
				<tr>
					<td>코드</td>
					<td>명칭</td>
					<td>사용여부</td>
				</tr>
				
				<c:forEach var="bigCate" items="${bigCateList}">
				<tr onClick="HighlightTR(this, '#FFA7A7','#BB2929');" class="big" style="display: ;">
					<td>
						${bigCate.getBig_cate()}
					</td>
					<td class="modifyName">
						${bigCate.getBig_name()}
					</td>
					<td class="modifyUse">
						${bigCate.getBig_use()}
					</td>
				</tr>		
				</c:forEach>
				
			</table>
			<table>
				<tr>
					<td colspan="3">
						<input type="submit" value="저장" />
					</td>
				</tr> 	
			</table>
		</form>
		</div>
		<div class="middleCate">
		<form method="post" action="middleCatePro.jp" name="middleForm" onSubmit="middleFrmCheck()">
			<table border="1" id="itemMiddleCate">
				<tr>
					<td><h2>중분류 ${middleCateCount}</h2></td>
					<td colspan="2">
						<input type="button" value="행추가" onclick="insMiddleRow();"/>
						<input type="button" value="행삭제" onclick="frmCheck();" />
					</td>
				</tr>
				<tr>
					<td>코드</td>
					<td>명칭</td>
					<td>사용여부</td>
				</tr>
				
				<c:forEach var="middleCate" items="${middleCateList}">
				<tr onClick="HighlightTR(this, '#FFA7A7','#BB2929');" class="middle" style="display: ;">
					<td>
						${middleCate.getMiddle_cate()}
					</td>
					<td>
						${middleCate.getMiddle_name()}
					</td>
					<td>
						${middleCate.getMiddle_use()}
					</td>		
				</tr>
				</c:forEach>
			</table>
			<table>
				<tr>
					<td colspan="3">
						<input type="submit" value="저장" />
					</td>
				</tr> 	
			</table>
		</form>
		</div>
		<div class="smallCate">
		<form method="post" action="smallCatePro.jp" name="smallForm" onSubmit="smallFrmCheck()">
			<table border="1" id="itemSmallCate">
				<tr>
					<td><h2>소분류 숫자</h2></td>
					<td colspan="2">
						<input type="button" value="행추가" onclick="insSmallRow();" />
						<input type="button" value="행삭제" onclick="" />
					</td>
				</tr>
				<tr>
					<td>코드</td>
					<td>명칭</td>
					<td>사용여부</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="3">
						<input type="submit" value="저장" />
					</td>
				</tr> 	
			</table>
		</form>
		</div>
	</div>
</body>