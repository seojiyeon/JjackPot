<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="/opendesk/approval/se2/js/HuskyEZCreator.js" charset="utf-8"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서작성</title>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link href="/opendesk/approval/jquery.minical.css" rel="stylesheet" type="text/css">
<link rel="StyleSheet" href="/opendesk/approval/approval.css" type="text/css" />
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js" ></script>

<script>
window.name="Form";
//날짜 계산
function reportEndCheck(){
	var aa = document.getElementById("textsize").value;
	var ee = aa.split("-");
	var bb = ee[0]+""+ee[1]+""+ee[2];
	
	var d = new Date();
	var MM = ((d.getMonth() + 1) < 10 ? '0' : '') + (d.getMonth() + 1);
	var dd = (d.getDate() < 10 ? '0' : '') + d.getDate();
	
    var s = d.getFullYear() + ''+ MM +'' +dd;
    
    if(bb < s){
    	alert("날짜를 제대로 선택해주세요");
       	return false;
    }
}
</script>

<body>

<form class="ap_Form" name="ap_Form" action="/opendesk/apPro.hou" method="post" enctype="multipart/form-data">
<div style="float:right;"><input type="button" value="상신하기" class="approvalbutton" onclick="submitContents(this)"/></div>
	<table class="approval_mainTableCss">
		<tr>
			<td width="400" id="setting">
				<input type="button" class="line_image" value="결재라인지정" onclick="window.open('ap_line.hou?no=${no}&temp_num=${temp_num}', '', 'left='+(screen.availWidth-600)/2+',top='+(screen.availHeight-550)/2+', width=600px,height=550px');" /> &nbsp; &nbsp;
				<br /><br />
				마감기간 : 
				<input type="date" id="textsize" name="reportEnd" onchange="reportEndCheck()" style="width:150px;"/>까지
				
			</td>
		</tr>
	</table>
	<br />
	
	<table class="approval_mainTableCss">
	<c:if test="${approver == null }">
		<tr>
			<td width="80" height="130">결재</td>
			<c:set var="ap_check" value="no" />
			<td> 결재 라인을 지정해주세요.</td>
		</tr>
	</c:if>
	<c:if test="${approver != null }">
		<c:set var="ap_check" value="ok" />
		<tr>
			<td rowspan="2" width="80" height="130">결재</td>
			
			<c:forEach var="approver" items="${approver }">
				<td width="90" height="30">
				${approver.dName }	<br />
				${approver.rankName } &nbsp; ${approver.sawonName }
				</td>
			</c:forEach>
		</tr>
		<tr>
			<c:set var="i" value="1" />
			<c:forEach var="approver" items="${approver }">
			<td>
			
			<input type="hidden" value="${approver.dName }" name="ap_dName${i }" />
			<input type="hidden" value="${approver.rankName }" name="ap_rankName${i }" />
			<input type="hidden" value="${approver.sawonName }" name="ap_sawonName${i }" />
			<input type="hidden" value="${approver.sawonRank }" name="ap_sawonRank${i }" />
			<input type="hidden" value="${approver.workPlace }+${approver.sawonCode }" name="ap_wPsC${i }" />
			
			<c:set var="i" value="${i+1 }" />
			</td>
			</c:forEach>
		</tr>
	</c:if>
	</table>
	<br />
	<table class="approval_mainTableCss">
		<tr>
			<td width="100">분류</td>
			<td width="280">${dto.categorize}
			<input type="hidden" value="${dto.categorize}" name="categorize" />
			</td>
			<td width="100">양식명</td>
			<td width="280">${dto.formName }</td>
			<input type="hidden" value="${dto.formName }" name="formName" />
		</tr>
		<tr>
			<td>문서번호</td>
			<td>
			
			</td>
			
			
			<td>상신자부서</td>
			<td>
			<input type="hidden" value="${workerdto.dName }" name="dName" />
			${workerdto.dName }
			</td>
		</tr>
		<tr>
			<td>상신일자</td>
			<td></td>
			
			
			<td>상신자</td>
			<td>
			<input type="hidden" value="${workerdto.sawonCode }" name="sawonCode" />
			<input type="hidden" value="${workerdto.sawonName }" name="sawonName" />
			<input type="hidden" value="${workerdto.workPlace }" name="workPlace" />
			${workerdto.sawonName }
			</td>
		</tr>
		<tr>
			<td>수신참조</td>
			<td colspan="3">
			<c:forEach var="re" items="${re }">
				[${re.dName } &nbsp; ${re.rankName } &nbsp; ${re.sawonName}]
				
				<input type="hidden" value="${re.workPlace}+${re.sawonCode }" name="re_codeTable" />
				<input type="hidden" value="[${re.dName } ${re.rankName } ${re.sawonName}]" name="re_sCwP" />
			</c:forEach>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><input type="text" name="docuSubject" id="docuSubject" class="docuSubject" value="${dto.formName }" /></td>
		</tr>
	</table>

<br />

<textarea name="ir1" id="ir1" rows="20" cols="95">${dto.ir1 }</textarea>

	
<script type="text/javascript">
//스마트 에디터
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1",
    sSkinURI: "/opendesk/approval/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});
//스마트 에디터
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("ir1").value를 이용해서 처리한다
	 	//결재권자 지정
		if('${ap_check}' == "no"){
			alert("결재자를 지정해주세요.");
			return false;
		}
    	//마감일체크
    	var aa = document.getElementById("textsize").value;
    	if(aa == ""){
    		alert("날짜를 선택해주세요");
    		return false;
    	}
		var ee = aa.split("-");
		var bb = ee[0]+""+ee[1]+""+ee[2];
				
		var d = new Date();
		var MM = ((d.getMonth() + 1) < 10 ? '0' : '') + (d.getMonth() + 1);
		var dd = (d.getDate() < 10 ? '0' : '') + d.getDate();
				
	    var s = d.getFullYear() + ''+ MM +'' +dd;
	    			    
    try {
    	
    	if(bb >= s){
    		 elClickedObj.form.submit();
	    }else{
	    	alert("날짜를 제대로 선택해주세요");
	    	return false;
	    }
       	 
    } catch( e ) {}
    }

</script>

<br />
<br />

<table>
<tr> 
    <td>파일</td>
    <td><input type="file" name="ap_upload" multiple /></td>
</tr>
</table>

<br />
<br />

<input type="hidden" name="point_check" value="${dto.point_check }" />
</form>

<form method="post" action="temp_save.hou" name="temp_save">
<div>
		<input type="button" class="tempSave_image" value="임시저장" onclick="temp_sub(this)" />
		<input type="button" class="close_image" value="닫기" onclick="self.close();" />
</div>
			<c:set var="i" value="1" />
			<c:forEach var="approver" items="${approver }">
			
			<input type="hidden" value="${approver.dName }" name="ap_dName${i }" />
			<input type="hidden" value="${approver.rankName }" name="ap_rankName${i }" />
			<input type="hidden" value="${approver.sawonName }" name="ap_sawonName${i }" />
			<input type="hidden" value="${approver.workPlace }+${approver.sawonCode }" name="ap_wPsC${i }" />
			
			<c:set var="i" value="${i+1 }" />
			
			</c:forEach>
	
		<input type="hidden" name="point_check" value="${dto.point_check }" />
		<input type="hidden" value="" class="temp_End" name="temp_End" />
		<input type="hidden" value="${dto.categorize}" name="categorize" />
		<input type="hidden" value="${dto.formName }" name="formName" />
		<input type="hidden" value="${workerdto.dName }" name="dName" />
		<input type="hidden" value="${workerdto.sawonCode }" name="sawonCode" />
		<input type="hidden" value="${workerdto.sawonName }" name="sawonName" />
		<input type="hidden" value="${workerdto.workPlace }" name="workPlace" />
		<c:forEach var="re" items="${re }">
			<input type="hidden" value="${re.workPlace}+${re.sawonCode }" name="re_codeTable" />
			<input type="hidden" value="[${re.dName } ${re.rankName } ${re.sawonName}]" name="re_sCwP" />
		</c:forEach>
		
		<input type="hidden" value="" class="temp_subject" name="temp_subject" />
		<input type="hidden" value="" class="temp_ir1" name="temp_ir1" />
		<input type="hidden" value="${temp_num}" name="temp_num" class="temp_num" />
		
		
		<script>
		function temp_sub(elClickedObj) {
			    // 에디터의 내용이 textarea에 적용된다.
			    
			    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

			    // 에디터의 내용에 대한 값 검증은 이곳에서

			    // document.getElementById("ir1").value를 이용해서 처리한다.
			    try {
			    	//임시저장때 필요한 값들을 hidden에 저장하는 부분.
			    	var reportEnd = document.getElementById("textsize").value;
					var subject = document.getElementById("docuSubject").value;
					var temp_ir = document.getElementById("ir1").value;
					
					$(function(){
						$('.temp_End').val(reportEnd);
					});
					$(function(){
						$('.temp_subject').val(subject);
					});
			    	$(function(){
						$('.temp_ir1').val(temp_ir);
					});
			    	
			    	
			        elClickedObj.form.submit();

			    } catch( e ) {}
			    }
			

		</script>
		
		
</form>

</body>
</html>