<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/JackPot/css/calendarForm.css?ver=1" rel="stylesheet" type="text/css">

<html>
<body>
<script language="JavaScript">
    
    function checkIt() {
        var userinput = eval("document.userinput");
        if(!userinput.sdate.value) {
            alert("시작일을 선택하세요");
            return false;
        }
        if(!userinput.contents.value) {
            alert("내용을 입력하세요");
            return false;
        }
        if(!!userinput.edate.value){
        	if(!userinput.etime.value){
        		alert("종료시간을 선택하세요")
        		return false;
          }
        	if(userinput.sdate.value>userinput.edate.value){
        		alert("종료일이 시작일보다 작을 수 없습니다.")
        		return false;
      	  }
        }
    }
</script>
    
<div class="calendarform">
    <form action="calendarPro.jp" name="userinput" method="post" enctype="multipart/form-data" onSubmit="return checkIt()">
    <ul><li><select name="title">
    	<optgroup label="업무일정">
    	<option value="회사일정">회사일정</option>
    	<option value="지점일정">지점일정</option>
    	<option value="부서일정">부서일정</option>
    	<option value="개인업무">개인업무</option>
    	</optgroup>
    	<optgroup label="개인일정">
    	<option value="출장">출장</option>
    	<option value="연차">연차</option>
    	<option value="월차">월차</option>
    	</optgroup>
    </select>
    </li></ul>
    <ul><li><input type="text" placeholder="제목" name="subject"></li></ul>
    <ul><li><input type="text" placeholder="장소" name="place"></li></ul>
    <ul><li>파일첨부<br/><input type="file" name="file"></li></ul>
    <ul>
    	<li>시작일<br/><input type="date" name="sdate" /><br/>
    	<input type="time" name="stime" step="1800" value="00:00"/></li>
    </ul>
    <ul>
    	<li>종료일<br/><input type="date" name="edate" /><br/>
    	<input type="time" name="etime" step="1800" /></li>
    </ul>
	<ul><li>참여자<br/><input type="text" name="name"/></li></ul>
    <ul><li>내용<br/><textarea name="contents"></textarea></li></ul>
    <ul><li><input type="submit" value="전송"></li><li><input type="reset" value="취소"></li></ul>
    <input type="hidden" name="writer" value=""/>
    </form>
</div>
</body>
</html>