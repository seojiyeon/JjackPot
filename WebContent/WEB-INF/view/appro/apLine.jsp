<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link href="/JackPot/css/appro.css?ver=2" rel="stylesheet" type="text/css">
	
<script type="text/javascript">
	var idx = 0;
	
	function allowDrop(ev) {
	    ev.preventDefault();
	}
	
	function drag(ev) {
	    ev.dataTransfer.setData("text", ev.target.id);
	}
	
	function dragleave(ev){
		idx = idx-1;
		
		return idx;
	}
	
	function dragenter(ev){
		return idx++;
	}

	function dropAp(ev){
		
		if(idx < 6){
			ev.preventDefault();
			var data = ev.dataTransfer.getData("text");
			ev.target.appendChild(document.getElementById(data));
			var aa = document.createElement("input");
			aa.type="hidden";
			aa.name = "ap1";
			aa.value = data;
			ev.target.appendChild(aa);
		}else{
			alert("5명까지만 선택가능합니다.");
		}
	}
	
	function dropList(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
		
	}
	
	function drop(ev) {
		ev.preventDefault();
		var data = ev.dataTransfer.getData("text");
		ev.target.appendChild(document.getElementById(data));
		var aa = document.createElement("input");
		aa.type="hidden";
		aa.id = "recep1";
		aa.name = "recep1";
		aa.value = data;
		ev.target.appendChild(aa);
	}

	function sub(){
		document.myform.submit();
		self.close();
		preventDefault();
	}

</script>	
<body>

<form name="ap_form">
	<div id="ap_list" name="ap_list">
	</div>
</form>


<form name="myform" method="post" action="ap_linePro.hou" target="Form">
	<input type="hidden" name="no" value="${no }">

	<div id="apList" style="font-size:13pt;font-weight:bold;">결재자</div>
	<div id="ap" ondrop="dropAp(event)" ondragover="allowDrop(event)" 
	ondragenter="dragenter(event)" ondragleave="dragleave(event)" name="ap">
		
	</div>
	
	<div id="recepList" style="font-size:13pt;font-weight:bold;">수신참조</div>
	<div id="recep" ondrop="drop(event)" ondragover="allowDrop(event)" name="recep">

	</div>

	<input type="hidden" value="${temp_num}" name="temp_num" class="temp_num" />
	
	<div class="button_warp">
	<input type="button" class="register_image" value="등록" id="button" onclick="sub()" />
	<input type="button" class="close_image" value="닫기" onclick="self.close()" id="button" />
	</div>
</form>


</body>
</html>