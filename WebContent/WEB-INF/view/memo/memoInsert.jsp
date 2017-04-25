<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/JackPot/js/jquery.form.min.js"></script>
<script src="/JackPot/js/jQuery.MultiFile.min.js"></script>

<link href="/JackPot/css/memo.css" rel="stylesheet" type="text/css">

<head>
<title>메모</title>
</head>

<script>
	function checkIt() {
		var memoIns = eval("document.forms.memoIns");
		
		if(!memoIns.memo_title.value) {
			alert("제목을 입력하시요.");
			return false;
		}
	}
	
	
	/* 파일 다중 업로드 */
	$(document).ready(function(){
    
    	//use jQuery MultiFile Plugin 
	    $('#multiform input[name=org_file]').MultiFile({
    	    max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        	accept: '',
	        maxfile: 1024, //각 파일 최대 업로드 크기
    	    maxsize: 3024,  //전체 파일 최대 업로드 크기
        	STRING: { //Multi-lingual support : 메시지 수정 가능
	            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
    	        duplicate : "$file 은 이미 선택된 파일입니다.", 
        	    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
	            selected:'$file 을 선택했습니다.', 
    	        toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
        	    toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
	            toobig: "$file 은 크기가 매우 큽니다. (max $size)"
    	    },
        	list:"#file-list" //파일목록을 출력할 요소 지정가능
	    });
	});
	

	/* 이미지 다중 업로드 */
	$(document).ready(function(){
	    
    	//use jQuery MultiFile Plugin 
	    $('#multiform input[name=org_img]').MultiFile({
    	    max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
        	accept: 'jpg|png|gif', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
	        maxfile: 1024, //각 파일 최대 업로드 크기
    	    maxsize: 3024,  //전체 파일 최대 업로드 크기
        	STRING: { //Multi-lingual support : 메시지 수정 가능
	            remove : "제거", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
    	        duplicate : "$file 은 이미 선택된 파일입니다.", 
        	    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
            	selected:'$file 을 선택했습니다.', 
	            toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
    	        toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
        	    toobig: "$file 은 크기가 매우 큽니다. (max $size)"
	        },
    	    list:"#img-list" //파일목록을 출력할 요소 지정가능
	    });	
	});

	
	/* 메뉴 슬라이드 업&다운 */
	$(document).ready(function() {
		$(".listFolder>a").click(function() {
			var subMenu = $(this).next("ul");
			
			if(subMenu.is(":visible")) {
				subMenu.slideUp();
			} else {
				subMenu.slideDown();
			}
		});
	});
</script>

<html>
<body>
<div id="page-container">
	<!-- 왼쪽 사이드바 -->
	<div id="sidebar"></div>
	<div id="subarea">
		<div id="leftMenu">
			<div class="leftMenuTop">
				<h2><a href="memoList.jp">메모</a></h2>
			</div>
			
			<div id="leftMenuArea">
				<ul class="menuList" style="margin:0;padding:0;list-style:none;">
					<li class="list" style="text-align:center">
						<button type="button" class="chMemoCate" id="notePopup" onclick="window.location='memoInsert.jp'">메모 등록</button>
					</li>
					<li class="list">
						<a href="memoList.jp">모든 메모 <font color="red">${count}</font></a>
					</li>
					<li class="list">
						<a href="memoImp.jp">중요 메모 <font color="red">${impCount}</font></a>
					</li>
					<li class="listFolder">
						<a style="display:inline-block;height:30px;">나의 폴더</a>
							<ul style="-webkit-padding-start:0px;width:200px; display:none;" >
								<c:if test="${memoCateCount == 0}">
									<li>등록된 폴더가 없습니다.</li>
								</c:if>
								<c:if test="${memoCateCount > 0}">
									<c:forEach var="memoCate" items="${memoCateList}">
										<li>
											<a href="memoViewList.jp?memo_cate=${memoCate.cate_num}">${memoCate.getCate_title()}</a>
										</li>
									</c:forEach>
								</c:if>
							</ul>
					</li>
					<li class="list">
						<a href="memoRemoveList.jp">휴지통 <font color="red">${removeCount}</font></a>
					</li>
					<li class="list">
						<a href="">폴더 관리</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>

<!-- 메모 본문 : 내용 작성 폼 -->
<div class="main-container" id="main-layer">
	<div class="content-wrap">
		<div class="content-head">
			<h2 style="margin:5px; width:300px;">메모 등록</h2>
		</div>
		
		<form name="memoIns" id="multiform" method="post" action="memoInsertPro.jp" enctype="multipart/form-data"  onSubmit="return checkIt();">
		<div class="table">
			<div class="listInfo">
				<select name="memo_cate">
					<c:if test="${memoCateCount == 0}">
						<option value="0">폴더 없음</option>
					</c:if>
					<c:if test="${memoCateCount > 0}">
						<c:forEach var="memoCate" items="${memoCateList}">
							<c:if test="${memoCate.cate_num == dto.getMemo_cate()}">
								<option value="${memoCate.cate_num}" selected>${memoCate.cate_title}</option>
							</c:if>
							<c:if test="${memoCate.cate_num != dto.getMemo_cate()}">
								<option value="${memoCate.cate_num}" >${memoCate.cate_title}</option>
							</c:if>									
						</c:forEach>
					</c:if>
				</select>
			</div>
			<div class="inputFileNImg">
				<input type="reset" value="새메모" />
				<input type="file" name="org_img" value="이미지 첨부" id="imgInp" />
				<input type="file" name="org_file" value="파일 첨부" id="fileInp" />
			</div>
		</div>
		
		<div class="content-write">
			<table>
				<tr>
					<td>
						<input type="checkbox" name="memo_state" value="2" >중요
						<input type="text" name="memo_title" placeholder="제목을 입력하세요." />
					</td>
				</tr>
				<tr>
					<td>
						<textarea name="memo_content" rows="20" cols="100"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<div id="img-list"></div> 
						<div id="file-list"></div>
					</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="저장" />
				<button type="button" onClick="window.location='memoList.jp'">취소</button>
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>
