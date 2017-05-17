<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

 <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 
 <style>

.ajax{
position: absolute;
right: 0;
bottom: 0;
width: 400px;
height: 200px;
}

#ajaxReturn {
    background-color: #ffb3b3;
    width: 140;
    position: absolute;
    right: 0;
    bottom: 65;
    padding: 20;
    font-size: 14px;
    color: ghostwhite;
    text-align: center;
    margin-bottom: 5;
}

#ajaxRetur{
    background-color: #2d5461;
    width: 150px;
    position: absolute;
    right: 0;
    bottom: 0;
    padding: 15;
    font-size: 14px;
    color: ghostwhite;   
    text-align: center;   
    
 }
 
 </style>
 
 
  <script type="text/javascript">
    $(document).ready(function(){
    	window.setInterval('callMsg()', 2000); //n초마다한번씩 함수를 실행한다..!! 
    	window.setInterval('callAjax()', 10000); //n초마다한번씩 함수를 실행한다..!!
    });
    function callMsg(){
    	 $.ajax({
 	        type: "post",
 	        url : "index.jp",
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn").html(aaa).fadeIn(4000).fadeOut(4000);	//id가 ajaxReturn인 부분에 넣어라
        
    }
    function whenError(){
        return false;
    }
    
    
    $(document).ready(function(){
        $("#ajaxReturn").click(function(){
            open("/JackPot/msgmain.jp","쪽지보내기","width=1200, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
        });
        
    });
    
    
    /* -------------------------------- */
    
    
    
    function callAjax(){
	 $.ajax({
	        type: "post",
	        url : "alarm.jp",
	        success: test2,	// 페이지요청 성공시 실행 함수
	        error: whenError	//페이지요청 실패시 실행함수
  	});
}
function test2(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
    $("#ajaxRetur").html(aaa).fadeToggle(5000);	//id가 ajaxReturn인 부분에 넣어라
    
}
function whenError(){    

}

$(document).ready(function(){
    $("#ajaxRetur").click(function(){
    	$("#ajaxRetur").hide();
        open("/JackPot/msgmain.jp","쪽지보내기","width=1200, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    });    
});
    

    
  </script>

	 <div class="ajax">
	 <div id="ajaxRetur" style="display:none;">안읽은 쪽지</div> <!-- 요기에 -->
	 </div>

	 <div id="ajaxReturn" style="display:none;">새 쪽지</div>
	 