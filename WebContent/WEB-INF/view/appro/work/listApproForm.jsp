<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/JackPot/css/appro.css?ver=1" rel="stylesheet" type="text/css">
<link href="/JackPot/css/common.css?ver=3" rel="stylesheet" type="text/css">
<html>
    <head>        
    
    </head>    
<body>
	<div id="page-container">
		<div id="sidebar-a">
		
		</div>
		<div id="subarea">
			<div id="leftmenu">
				<div class="leftmenu-top h2">
					<h2><a href="/JackPot/listApproForm.jp">전자결재</a></h2>
				</div>
				<div id="leftmenearea">
					기안<br/>
					<hr>
					기안문작성<br/>
					결재요청함<br/>
					임시저장함<br/>
					<hr>
					결재대기함<br/>
					결재진행함<br/>
					완료문서함<br/>
					반려문서함<br/>
					참조/열람문서함<br/>
				</div>
			</div>
		</div>
		
		<div id="main-container" style="position:fixed;top:0;left:270;width:100%;">
			<div class="con-header">
				<h2>양식목록</h2>
			</div>
			<div class="content-wrap">
				<div class="pl10">
					<form id="" name="" method="post" action="">
						<div id="formListDiv">
							<div class="table-header p10 mt-10">
								<div class="listinfo">
									<select name="">
										<option value="10" selected="selected">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="30">30</option>
										<option value="40">40</option>
										<option value="50">50</option>
									</select>
									<div class="totalnum">
										전체
										<span>5</span>
									</div>
								</div>
							</div>
							
							<div class="content-list approval">
								<input type="button" value="기안문작성" onclick="window.location='listApproDoc.jp'"/>
							</div>
						</div>
					</form>
				</div>
			
			</div>
			
		
		</div>
	</div>         
        
</body>
</html>