<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<title>재고관리</title>
</head>

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

<script>
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
		var frmTag2 = "<input type=text name=big_name style=width:20px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<input type=text name=big_use style=width:20px; height:20px;> ";
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
		var frmTag2 = "<input type=text name=middle_name style=width:20px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<input type=text name=middle_use style=width:20px; height:20px;> ";
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
		var frmTag2 = "<input type=text name=small_name style=width:20px; height:20px;> ";
		oCell2.innerHTML = frmTag2;
		var frmTag3 = "<input type=text name=small_use style=width:20px; height:20px;> ";
		oCell3.innerHTML = frmTag3;
	}
	
	function deleteRow() {
		
	}
</script>

<body>
	<div id="WholeBox">
		<div class="searchBox">
			<table border="1">
				<tr>
					<td>사용여부
						<select name="use">
							<option value="use">사용</option>
							<option value="unuse">미사용</option>
							<option value="use_unuse">전체</option>
						</select>
					</td>
					<td>
						<input type="submit" value="검색" />
			</table>
		</div>
		<div class="bigCate">
		<form name="bigForm">
			<table border="1" id="itemBigCate">
				<tr>
					<td><h2>대분류 숫자</h2></td>
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="submit" value="저장" />
					</td>
				</tr> 	
			</table>
		</form>
		</div>
		<div class="middleCate">
		<form>
			<table border="1" id="itemMiddleCate">
				<tr>
					<td><h2>중분류 숫자</h2></td>
					<td colspan="2">
						<input type="button" value="행추가" onclick="insMiddleRow();"/>
						<input type="button" value="행삭제" onclick="" />
					</td>
				</tr>
				<tr>
					<td>코드</td>
					<td>명칭</td>
					<td>사용여부</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
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
		<div class="smallCate">
		<form>
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
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