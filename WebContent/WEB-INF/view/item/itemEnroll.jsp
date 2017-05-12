<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/JackPot/css/common.css" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/item.css" type="text/css" />

<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>

<head>
<title>재고 관리</title>
</head>

<style>
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
	width: 100%;
	height: 100%;
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
	
	function checkIt() {
		var itemForm = eval("document.forms.itemForm");
		
		if(!itemForm.pro_code.value) { //품목코드
			alert("내용을 입력 해주시기 바랍니다.");
			itemForm.pro_code.focus();
			return false;
		} else if(!itemForm.sale_cost.value) { //판매단가
			alert("내용을 입력 해주시기 바랍니다.");
			itemForm.sale_cost.focus();
			return false;
		} else if(!itemForm.buy_cost.value) { //구매단가
			alert("내용을 입력 해주시기 바랍니다.");
			itemForm.buy_cost.focus();
			return false;
		} else if(!itemForm.pro_name.value) { //품명
			alert("내용을 입력 해주시기 바랍니다.");
			itemForm.pro_name.focus();
			return false;
		}
	}
</script>

<html>
<body>
<!-- 왼쪽 사이드바 -->
<div id="page-container">
	<div id="sidebar"></div>
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
			<h2 style="margin:5px; width: 300px;">재고품목코드등록/관리</h2>
		</div>
		
		<div id="container">
			<ul class="tabs">
				<li class="active" rel="tab1">재고 등록</li>
				<li rel="tab2">재고 관리</li>
			</ul>
		</div>
		
		<div class="tab_container">
			<!-- 첫번째 탭 -->
			<div id="tab1" class="tab_content">
				<form method="post" name="itemForm" action="itemEnrollPro.jp" onSubmit="return checkIt();">
				<div class="sub-content">
					<table class="item-table">
						<tr>
							<th><font color="red">*</font>품목코드</th>
							<td>
								<input type="text" name="pro_code" />
							</td>
							<th><font color="red">*</font>판매단가</th>
							<td>
								<input type="text" name="sale_cost" />
							</td>
						</tr>
						<tr>
							<th>바코드</th>
							<td>
								<input type="text" name="barcode" />
							</td>
							<th><font color="red">*</font>구매단가</th>
							<td>
								<input type="text" name="buy_cost" />
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>품명</th>
							<td>
								<input type="text" name="pro_name" />
							</td>
							<th>소매단가</th>
							<td>
								<input type="text" name="retail_cost" />
							</td>
						</tr>
						<tr>
							<th>품목구분</th>
							<td>
								<select name="item_division">
									<option value="제품">제품</option>
									<option value="상품">상품</option>
									<option value="원자재">원자재</option>
									<option value="부자재">부자재</option>
								</select>
							</td>
							<th>과세유형</th>
							<td>
								<select name="tax">
									<option value="부가세별도">부가세별도</option>
									<option value="부가세포함">부가세포함</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>규격</th>
							<td>
								<input type="text" name="stand" />
							</td>
							<th>단위</th>
							<td>
								<input type="text" name="unit" />
							</td>
						</tr>
						<tr>
							<th>사용여부</th>
							<td colspan="3">
								<select name="use">
									<option value="사용">사용</option>
									<option value="미사용">미사용</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>구매품목코드</th>
							<td>
								<input type="text" name="buy_code" />
							</td>
							<th>구매품목명</th>
							<td>
								<input type="text" name="buy_name" />
							</td>
						</tr>
						<tr>
							<th>분류</th>
							<td colspan="3">
								<select name="big_cate">
									<option value="0">대분류</option>
								</select>
								<select name="middle_cate">
									<option value="0">중분류</option>
								</select>
								<select name="small_cate">
									<option value="0">소분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3">
								<textarea rows="20" cols="20" name="note" style="width:500px; height:100px;"></textarea>
							</td>						
					</table>
					<div class="btn-wrap">
						<input type="reset" value="신규" />
						<input type="submit" value="저장" />
					</div>
				</div>
				</form>
			</div>
			
			<!--  두번째 탭 -->
			<div id="tab2" class="tab_content">
			
			<div class="search-wrap">
				<form name="searchForm" method="post" action="itemEnroll.jp">
				<div class="form-group">
					<table class="search-table">
						<tr>
							<th>품목구분</th>
							<td>
								<select name="item_division">
									<option value="전체">전체</option>
									<option value="상품">상품</option>
									<option value="원자재">원자재</option>
									<option value="부자재">부자재</option>
								</select>
							</td>
							<th>분류</th>
							<td>
								<select name="big_cate">
									<option value="0">대분류</option>
								</select>
								&nbsp;
								<select name="middle_cate">
									<option value="0">중분류</option>
								</select>
								&nbsp;
								<select name="small_cate">
									<option value="0">소분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>품명/품목코드</th>
							<td>
								<input type="text" name="pro_code" />
							</td>
							<th>사용여부</th>
							<td>
								<select name="use">
									<option value="사용">사용</option>
									<option value="미사용">미사용</option>
									<option value="전체">전체</option>
								</select>
							</td>
						</tr>				
					</table>
					<div class="search-btn">
						<input type="submit" value="검색" />
					</div>
				</div>
			</form>
			</div>
			
			<div class="left-layout">
				<div class="sub-title">
					<table>
						<tr>
							<th>품목목록 <font color="red">숫자</font></th>
						</tr>
					</table>
				</div>
				<div class="sub-head">
					<table>
						<tr>
							<th>&nbsp;&nbsp;&nbsp;</th>
							<th>품목코드</th>
							<th>품목명</th>
							<th>규격</th>
						</tr>
					</table>
					<div class="sub-content">
					</div>
				</div>
			</div>
		
			<div class="rigth-layout">
				<div class="sub-title">
					<table>
						<tr>
							<th style="width:300px; text-align:left;">품목정보</th>
							<td align="right">
								<button type="button">일괄삭제</button>
								<button type="button">엑셀업로드</button>
								<button type="button">엑셀다운로드</button>
							</td>
						</tr>
					</table>
				</div>
				
				<form method="post" name="itemForm" action="">
				<div class="sub-content">
					<table class="item-table">
						<tr>
							<th><font color="red">*</font>품목코드</th>
							<td>
								<input type="text" name="pro_code" />
							</td>
							<th><font color="red">*</font>판매단가</th>
							<td>
								<input type="text" name="sale_cost" />
							</td>
						</tr>
						<tr>
							<th>바코드</th>
							<td>
								<input type="text" name="barcode" />
							</td>
							<th><font color="red">*</font>구매단가</th>
							<td>	
								<input type="text" name="buy_cost" />
							</td>
						</tr>
						<tr>
							<th><font color="red">*</font>품명</th>
							<td>
								<input type="text" name="pro_name" />
							</td>
							<th>소매단가</th>
							<td>
								<input type="text" name="retail_cost" />
							</td>
						</tr>
						<tr>
							<th>품목구분</th>
							<td>
								<select name="item_division">
									<option value="제품">제품</option>
									<option value="상품">상품</option>
									<option value="원자재">원자재</option>
									<option value="부자재">부자재</option>
								</select>
							</td>
							<th>과세유형</th>
							<td>
								<select name="tax">
									<option value="부가세별도">부가세별도</option>
									<option value="부가세포함">부가세포함</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>규격</th>
							<td>
								<input type="text" name="stand" />
							</td>
							<th>단위</th>
							<td>
								<input type="text" name="unit" />
							</td>
						</tr>
						<tr>
							<th>사용여부</th>
							<td colspan="3">
								<input type="text" name="use" />
							</td>
						</tr>
						<tr>
							<th>구매품목코드</th>
							<td>
								<input type="text" name="buy_code" />
							</td>
							<th>구매품목명</th>
							<td>
								<input type="text" name="buy_name" />
							</td>
						</tr>
						<tr>	
							<th>분류</th>
							<td colspan="3">
								<select name="big_cate">
									<option value="0">대분류</option>
								</select>
								<select name="middle_cate">
									<option value="0">중분류</option>
								</select>
								<select name="small_cate">
									<option value="0">소분류</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>비고</th>
							<td colspan="3">
								<textarea rows="20" cols="20" name="note" style="width:500px; height:100px;"></textarea>
							</td>						
					</table>
					<div class="btn-wrap">
						<input type="submit" value="수정" />
						<button type="button">삭제</button>
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