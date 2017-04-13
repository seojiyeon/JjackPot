<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="/JackPot/js/jquery-3.1.1.min.js"></script>
<script src="/JackPot/js/jquery.bpopup.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/JackPot/css/jquery.treeview.css"/>
<link rel="stylesheet" href="/JackPot/css/screen.css"/>
<script src="/JackPot/js/jquery.js" type="text/javascript"></script>
<script src="/JackPot/js/jquery.cookie.js" type="text/javascript"></script>
<script src="/JackPot/js/jquery.treeview.js" type="text/javascript"></script>
  
<script type="text/javascript">

 
 $(document).ready(function() {
     $('#close').click(function() {
       $('#pop').hide();
     });
   });
 
 $(function() {
     $("#tree").treeview({
         collapsed: true,
         animated: "medium",
         control:"#sidetreecontrol",
         persist: "location"
     });
 })

 </script>
<style type="text/css">
 
.button_style {
 opacity: 5;
 display: none;
 position: relative;
 padding: 30px;
 background-color: #fff;
}
 
.layer_close {
 position: absolute;
 right: 3px;
 top: 1px;
 padding: 10px;
 cursor: pointer;
}
 #pop{
  width:300px; height:400px; background:#3d3d3d; color:#fff; 
  position:absolute; top:10px; left:100px; text-align:center; 
  border:2px solid #000;
  }

</style>
 
</head>
<body>

<input type="button" value="click" onclick="fn_layer_popup()"> 

	 <div id="pop">
	   <div style="height:370px;">
    		안녕하세요 레이어팝업.<br>
  		</div>
  		 <div>
    		<div id="close" style="width:100px; margin:auto;">close</div>
  		</div>
	</div>
	
			<div id="sidetree">
		    <div class="treeheader">
		          
		    </div>
		    <div id="sidetreecontrol">
		        <a href="?#">전체 닫기</a> | <a href="?#">전체 열기</a>
		    </div>
		    <ul id="tree">
		        <li>
		            <strong>첫번째 메뉴</strong>
		            <ul>
		                <li><a href="#">서브메뉴</a></li>
		            </ul>
		            </li>
		        <li>
		        <strong>두번째 메뉴</strong>
		        <ul>
		            <li><a href="#">첫번째 서브메뉴</a></li>
		        </ul>
		        <ul>
		            <li>
		                <a href="#">두번째 서브메뉴</a>
		                <ul>
		                    <li><a href="#">서브메뉴 속 첫번째 서브메뉴</a></li>
		                </ul>
		            </li>
		        </ul>
		        </li>
		    </ul>
		</div>

</body>
</html>