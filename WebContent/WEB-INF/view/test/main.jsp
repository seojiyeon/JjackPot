<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	window.setInterval('callAjax()', 1000); //3초마다한번씩 함수를 실행한다..!! 

    });
    function callAjax(){
    	 $.ajax({
 	        type: "post",
 	        url : "index.jsp",
 	        success: test,	// 페이지요청 성공시 실행 함수
 	        error: whenError	//페이지요청 실패시 실행함수
      	});
    }
    function test(aaa){	// 요청성공한 페이지정보가 aaa 변수로 콜백된다. 
        $("#ajaxReturn2").html(aaa);	//id가 ajaxReturn인 부분에 넣어라
    }
    function whenError(){
        alert("Error");
    }
  </script>

	 <div id="ajaxReturn">ajaxReturnOutput</div> <!-- 요기에 -->
	 <div id="ajaxReturn2">눌러</div> <!-- 요기에 -->


