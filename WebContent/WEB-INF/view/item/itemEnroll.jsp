<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
#Bigbox{
position:relative;
display: inline-block;
border-style:none;
}

#box1{

width:400px;
border:1px;
border-style:solid;
position: absolute;
    left: 0;
    top: 0;
display: block;
}
#box2{
width:600px;
border:1px;
border-style:solid;
position: absolute;
    left: 410;
    top: 0;
display: block;
}
#box1 ul, li{
 border-style:solid;
  border:1px;
  list-style:none;
  
}
#box2 ul, li{
border-style:solid;
  border:1px;
  list-style:none;
}
</style>

<script>
	function openItemCate(itemEnroll) {
		url = "itemCate.jp"
		
		open(url, "itemCate", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
	}
</script>

<title>재고관리</title>
</head>

<body>
<h2>재고품목코드등록/관리</h2>

<form id="search" method="post">
	<table border="1">
		<tr>
			<td>품목구분</td>
			<td>
				<select name="item_division" id="search1">
					<option value="전체">전체</option>
					<option value="상품">상품</option>
					<option value="원자재">원자재</option>
					<option value="부자재">부자재</option>
				</select>
			</td>
			<td>분류</td>
			<td>
				<select name="big_cate" id="search2_1">
					<option value="0">대분류</option>
				</select>
				&nbsp;
				<select name="middle_cate" id="search2_2">
					<option value="0">중분류</option>
				</select>
				&nbsp;
				<select name="small_cate" id="search2_3">
					<option value="0">소분류</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>품명/품목코드</td>
			<td>
				<input type="text" name="pro_code" id="search3">
			</td>
			<td>사용여부</td>
			<td>
				<select name="use" id="search4">
					<option value="사용">사용</option>
					<option value="미사용">미사용</option>
					<option value="전체">전체</option>
				</select>
			</td>
			<td rowspan="2">
				<input type="submit" value="검색" />
			</td>
		</tr>
	</table>
</form>

<form action="itemEnrollPro.jp" method="post" name="itemEnroll">
<DIV id="Bigbox">
	<div id="box1">
		<table border="1">
			<tr>
				<td colspan="3"><h2>품목목록 ${itemCount}</h2></td>
			</tr>
			<tr>
				<td>품목코드</td>
				<td>품목명</td>
				<td>규격</td>
			</tr>
			<c:if test="${itemCount == 0}">
			<tr>
				<td colspan="3">
					데이터가 없습니다.
				</td>
			</tr>
			</c:if>
			<c:if test="${itemCount > 0}">
			<c:forEach var="itemList" items="${itemList}">
			<tr>
				<td>${itemList.getPro_code()}</td>
				<td>${itemList.getPro_name()}</td>
				<td>${itemList.getStand()}</td>
			</tr>			
			</c:forEach>
			</c:if>
		</table>
	</div>	
	
	<div id="box2">
		<table>
			<tr>
				<td><h2>품목정보</h2></td>
				<td colspan="3">
					<input type="button" value="일괄삭제" onclick="" />
			</tr>
			<tr>
				<td>품목코드</td>
				<td>
					<input type="text" name="pro_code" />
				</td>
				<td>판매단가</td>
				<td>
					<input type="text" name="sale_cost" />
				</td>
			</tr>
			<tr>
				<td>바코드</td>
				<td>
					<input type="text" name="barcode" />
				</td>
				<td>구매단가</td>
				<td>
					<input type="text" name="buy_cost" />
				</td>
			</tr>
			<tr>
				<td>품명</td>
				<td>
					<input type="text" name="pro_name" />
				</td>
				<td>소매단가</td>
				<td>
					<input type="text" name="retail_cost" />
				</td>
			</tr>
			<tr>
				<td>품목구분</td>
				<td>
					<select name="item_division">
						<option value="전체">전체</option>
						<option value="상품">상품</option>
						<option value="원자재">원자재</option>
						<option value="부자재">부자재</option>
					</select>
				</td>
				<td>과세유형</td>
				<td>
					<select name="tax">
						<option value="부가세별도">부가세별도</option>
						<option value="부가세포함">부가세포함</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>규격</td>
				<td>
					<input type="text" name="stand" />
				</td>
				<td>단위</td>
				<td>
					<input type="text" name="unit" />
				</td>
			</tr>
			<tr>
				<td>사용여부</td>
				<td colspan="3">
					<select name="use">
						<option value="사용">사용</option>
						<option value="미사용">미사용</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>구매품목코드</td>
				<td>
					<input type="text" name="buy_code" />
				</td>
				<td>구매품목명</td>
				<td>
					<input type="text" name="buy_name" />
				</td>
			</tr>
			<tr>
				<td>분류</td>
				<td colspan="3">
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
				<td>비고</td>
				<td colspan="3">
					<textarea rows="10" cols="70" name="note"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="품목분류관리" onclick="openItemCate(this.form)" />
				</td>
				<td colspan="3">
					<input type="reset" value="신규" />
					<input type="submit" value="저장" />
					<input type="button" value="수정" onclick="" />
					<input type="button" value="삭제" onclick="" />				
				</td>
			<tr>
		</table>	
	</div>
</DIV>


</form>
</body>