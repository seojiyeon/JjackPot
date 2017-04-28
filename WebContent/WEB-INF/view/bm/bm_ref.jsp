<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=5" type="text/css" />   


<html>
<script type="text/javascript">
function setName(e)
{		 
	opener.document.userinput.inchar_name.value=e;
	self.close(); 
	}




</script>

<head>
<title>담당자 </title>
<div class="mask">
<body class="methods-page" data-page="methods">


  <!--  <div class="modal-content">
    	<div class="modal-header">
    		<h2 class="modal-title">
    			<i class="icon modal-title-user"></i>사용자 선택</h2>
   	 	<div class="modal-close"><a href="javascript:void(0)" data-dismiss="modal">
    		<i class="icon pop-close"></i><span>Close</span></a>
    	</div></div></div>-->
 
   		<div class="modal-body">
   		
			<div class="shuttleL">
				<div id="divOrgMainTab" class="box-header">
					<ul class="nav nav-tabs3 push" style="width: 130px">
						<li class="active">
							<a href="#organogramTabOrg" data-toggle="tab tooltip" title="">조직도</a></li>
			<!-- 			<li style="width: 700px">	
							<div class="inbox">
								<form name="incharPop" method="post" action="incharPop.jp" onSubmit="return checkIt()">
									<select title="검색조건" name="tablesch_01" id="searchColumn">
										<option value="">사용자명</option>
									</select>
									<div class="input-search dpI">												
										<input type="text" size="10" maxlength="12" name="emp_name"> 
										<input type="submit" value="검색" >
									</div>
								</form>
							</div>
						</li> -->
						<li style="width: 700px">
							<ul >	
							<c:forEach var="emp_d" items="${emp_d}" >
							<li>
							<i class="jstree-icon jstree-ocl" role="presentation"></i>
							<a class="jstree-anchor" href="#" tabindex="-1" id="treeItem_G102863_U144416_anchor">
							<i class="jstree-icon jstree-themeicon fa fa-leaf join jstree-themeicon-custom" role="presentation"></i>
							${emp_d.emp_name}(${emp_d.position }  ${emp_d.department})
							</a>
							<input type="button" value="선택" onClick="setName('${emp_d.emp_name}')" />
							</li>
							</c:forEach>
							</ul></ul>



</div></div>
<!-- 
	<c:if test="${count==0}">
	</c:if>

	<c:if test="${count!=0}">
	
		<div>
			<ul height="30"  > 
   				<li align="center"  width="50"  > <b>이름</b></li> 
     			<li align="center"  width="100" ><b>사원번호</b></li>
     			<li align="center"  width="50" ><b>부서</b></li>
     			<li align="center"  width="50" ></li>
     		</ul>
	
		<c:forEach var="emp_d" items="${emp_d}" >
   
    		<ul height="30"  > 
    			<li align="center"  width="50"  >${emp_d.emp_name} </li>
				<li align="center"  width="100" >${emp_d.emp_num} </li>
    			<li align="center"  width="50" >${emp_d.department} </li>
			    <li align="center"  width="50" ><input type="button" value="선택" onClick="setId('${emp_d.emp_name}')" /></li>
 			</ul>
  		</c:forEach>
		</div>
	</c:if>	 -->
</div>
</body>
</div>




    
</head>    
</html>