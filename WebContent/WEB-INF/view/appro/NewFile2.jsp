<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회식신청서</title>
<link rel="stylesheet" href="/gw4/css/styleS.css">
<style type="text/css">
#border_table{
	border: 1px solid #32607F;
	margin: auto;
	line-height: auto;
	border-collapse: collapse;
}
	
#border_table tr, #border_table td{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
}

#border_table th{
	border: 1px solid #32607F;
	text-align:center;
	vertical-align:middle;
	padding: 1px;
	border-collapse: collapse;
	color: #ffffff;
	background-color:#3e779d;
}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script type="text/javascript" src="/gw4/calendar/calendar.js"></script>
<link rel="stylesheet" href="#" />
<script language="javaScript">
	function checkIt(){
		var dininginput = eval("document.dininginput");
		var str = dininginput.approval_title.value;
		var dining = str.charAt(str.length - 1);
		if(!dininginput.approval_title.value){
			alert("제목을 입력하세요");
			return false;
		}if(!dininginput.approval_day.value){
			alert("경재상신일자를 입력하세요");
			return false;
		}if(!dininginput.approval_days.value){
			alert("회식요청일자를 입력하세요");
			return false;
		}if(!dininginput.approval_member.value){
			alert("회식인원을 입력하세요");
			return false;
		}if(!dininginput.approval_content.value){
			alert("회식목적을 입력하세요");
			return false;
		}
	}
</script>
</head>
<body>
	<table id="border_table" border="1" width="60%" align="center">
		<form method="get" action="approvalDiningPro.do" name="dininginput" onSubmit="goSubmit()">
			<tr>
				<th>기안자</th>
				<th>결재자</th>
			</tr>
			<tr>
				<td>${employeeJoinVo.emp_name }</td>
				<td>
					<select name="emp_code">
						<c:forEach var="empList" items="${empList }">
							<option value="${empList.emp_code }">${empList.emp_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
			</tr>
			<tr>
				<td colspan="2"><input type="text" size="30"id="approval_title" name="approval_title"/></td>
			</tr>
			<tr>
				<td>결재상신일자<input type="text" id="approval_day" name="approval_day" onclick="fnPopUpCalendar(approval_day,approval_day,'yyyy - mm - dd')"></td>
				<td>회식요청일자<input type="text" id="approval_days" name="approval_days" onclick="fnPopUpCalendar(approval_days,approval_days,'yyyy - mm - dd')"></td>
			</tr>
			<tr>
				<td colspan="2">회식참여인원<input type="text"  id="approval_member" name="approval_member"/>명</td>
			</tr>
			<tr align="center">
				<th colspan="2">회식목적</th>
			</tr>
			<tr align="center">
				<td colspan="2" align="center">
					<textarea cols="40" rows="15" id="approval_content" name="approval_content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:right;border-right: hidden; border-left: hidden; border-bottom: hidden;">
					<input type="submit" class="button" name="confirm" value="결재상신" onclick="return checkIt()"/>
					<input type="button" class="button" value="취소" onclick="javascript:self.close()">
				</td>
			</tr>
		</table>
			
		</form>	
<script type="text/javascript">
function goSubmit() {
    window.opener.name = "parentPage"; // 부모창의 이름 설정
    document.dininginput.target = "parentPage"; // 타켓을 부모창으로 설정
    document.dininginput.action = "/gw4/approval/approvalDiningPro.do";
    document.dininginput.submit();
    self.close();
}
</script>
</body>
</html>