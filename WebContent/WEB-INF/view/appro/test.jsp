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
				
			</div>
		</div>
		
		<div id="main-container" style="position:fixed;top:-15px;left:270;width:100%; vertical-align: middle;height: 70;">
			<div class="con-header" style="height: 90px;">
				<h2>기안문작성</h2>
			</div>
			<div class="content-wrap approval responsive">
				<div class="content-write">
					<div id="formButtonDiv" class="btn-wrap pt10">
						<a href="#" onclick="layer_open('layer1');return false;"><button id="addApprLineButton" type="button" class="btn btn-color5 br">결재선</button></a>
					    <button id="createApprDocButton" 			type="submit" class="btn btn-color5 br">결재요청</button>
					    <button id="addApprRefInfoButton" 			type="button" class="btn btn-color5 br">기결재첨부</button>
					    <button id="createApprDocTemporayButton" 	type="button" class="btn btn-color5 br">임시저장</button>
					    <button id="listApprDocButton" 				type="button" class="btn btn-color5 br">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>         
        
</body>
</html>