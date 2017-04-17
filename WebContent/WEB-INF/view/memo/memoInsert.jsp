<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/JackPot/js/jquery.form.min.js"></script>
<script src="/JackPot/js/jQuery.MultiFile.min.js"></script>

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
</script>

<body>
<div class="header">
<h2>메모 등록</h2>
<div id="navText" class="line"></div>
</div>

<form name="memoIns" id="multiform" method="post" action="memoInsertPro.jp" enctype="multipart/form-data"  onSubmit="return checkIt();">
<table>
	<tr>
		<td>
			<select name="memo_cate">
				<c:forEach var="memoCate" items="${memoCateList}">
					<option value="${memoCate.getCate_num()}">${memoCate.getCate_title()}</option>
				</c:forEach>
			</select>
		</td>
		<td>
			<input type="reset" value="새메모" />
 			<input type="file" name="org_img" value="이미지 첨부" id="imgInp" class="multi with-preview" multiple />  
		 	<input type="file" name="org_file" value="파일 첨부" id="fileInp" />
		 </td>  
	</tr>
</table>
<br/>
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
	<tr>
		<td>
			<input type="submit" value="저장" />
			<input type="button" value="취소" onClick="window.location='memoList.jp'" />
		</td>
	</tr>
</table>
</form>
</body>