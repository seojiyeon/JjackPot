<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
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
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=8" type="text/css" />   
<script src="resource/ckeditor.js"></script>
<html>
<head>







<!-- 
   function wrapWindowByMask(){
      //화면의 높이와 너비를 구한다.
      var maskHeight = $(document).height();  
      var maskWidth = $(window).width();  

      //마스크의 높이와 너비를 화면의 높이와 너비로 설정한다.
      $('.mask').css({'width':maskWidth,'height':maskHeight});  

      //애니메이션 효과
      $('.mask').fadeTo("slow",0.5);   
      
      // 레이어 팝업을 가운데로 띄운다.
      var left = ($(window).scrollLeft() + ($(window).width() - $('.window').width())/2);
      var top = ($(window).scrollTop() + ($(window).height() - $('.window').height())/2);
      
      // css 스타일 변경
      $('.window').css({'left':left, 'top':top, 'position':'absolute'});

      // 레이어 팝업 띄운다.
      $('.window').show();
   }

   $(document).ready(function(){
      //검은 마스크 배경과 레이어 팝업 띄운다.
      $('.chMemoCate').click(function(e){
         e.preventDefault();
         wrapWindowByMask();
      });

      //닫기 버튼을 눌렀을 때
      $('.window .close').click(function (e) {  
          //링크 기본동작은 작동하지 않도록 한다.
          e.preventDefault();  
          $('.mask, .window').hide();  
      });       

      //검은 마스크을 눌렀을 때
      $('.mask').click(function () {  
          $(this).hide();  
          $('.window').hide();  
      });      
   });
 -->
 <script type="text/javascript">
$(document).ready(function(){
		$("#bmupdatebutton").click(function(){
				var bm_state;
				var result = confirm('업무완료 처리하시겠습니까?');
					if(bm_state != 2){
						window.location="/JackPot/mytodo_state_update.jp?bm_num=${bm_num}";
					}else if(bm_state == 2){
						
					}
				});
			});



</script>


<title> 내가한 업무 요청 조회 </title>
</head>    
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />
<div id="main-contents">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="con-header">
    <h2>나의 할 일 조회</h2>
    </div>
<form id="mytodocont">
<div class="form-block">
                <table class="table">
                    <caption></caption>
                    <tbody>
                        <tr>
                            <th scope="row">제목</th>
                            <td>
                                <div>
                                	${bmdto.bm_title }
                                </div>
                            </td>
                            <th scope="row">상태</th>
                            <td>
                                <div>
									<c:if test="${bmdto.bm_state == 1}"> <!-- 미완료  -->
			    						    <span class="todo-cate-box1 color2">${bmdto.bm_state2 }</span>
			    					</c:if>
			    					<c:if test="${bmdto.bm_state == 2}"><!-- 완료  -->
			    	  					  <span class="todo-cate-box1 color3"style=" background: coral;">${bmdto.bm_state2 }</span>
			    	 				</c:if>
			    	 				<c:if test="${bmdto.bm_state == 3}"><!-- 지연  -->
			    	   					<span class="todo-cate-box1 color4">${bmdto.bm_state2 }</span>
			    	 				</c:if>
			    					<c:if test="${bmdto.bm_state == 0}"><!-- 반려  -->
			    	    				<span class="todo-cate-box1 color1">${bmdto.bm_state2 }</span>
			    	 				</c:if>
								</div>
					    </td>                            
                            
                        </tr>
	                  
						<tr>
							<th scope="row">업무기한 </th>
                            <td colspan="3">
                                <div>
                                	${bmdto.bm_start } ~ ${bmdto.bm_end }
                                </div>
                   	 	</tr>
                   	 	
                   	 	<tr>
							<th scope="row">업무등록일  </th>
							
							<c:if test="${bmdto.enrollment == null }">
 							<td>
                                <div>
                                  
                                </div>            
                            </td>                   
 							</c:if>
 							
 							<c:if test="${bmdto.enrollment != null }">
                            <td>
                                <div>
                                	${sdf.format(bmdto.enrollment) }
                                </div>
                                </td>
                                </c:if>
                                
 							<th scope="row">수정일  </th>
 							
 							<c:if test="${bmdto.update_day == null }">
 							<td>
                                <div> </div>                               
 							</c:if>
 							
                            <c:if test="${bmdto.update_day != null }">
                            <td>
                                <div>
                                  	${sdf.format(bmdto.update_day) }
                                </div>           
				      	 	 </td>     
							</c:if>               
                   	 	</tr>
                    
                 
                        
  						<tr>
							<th scope="row">업무보관함    </th>
                            <td colspan="3">
                          
                                	${bmdto.box_name }
                               
                   	 	</tr>
                   	 	
  						<tr style=" height: 500px;">
							<th scope="row">업무내용  </th>
                            <td colspan="3">
                                <div>
                                	${bmdto.bm_content }
                                </div>
                   	 	</tr>
                   	 	
                   	 	<tr>
							<th scope="row">첨부파일    </th>
							<c:if test="${fileCount == 0}">
                            <td colspan="3">
                                <div>
                             		첨부파일이 없습니다.
                                </div>
						    </td>
							</c:if>
                   	 	
                   	 		<c:if test="${fileCount > 0}">
                            <td colspan="3">
								<div>

                                	<c:forEach var="Bm_file" items="${Bm_file}">
										<a href="bmFileDown.jp?fileName=${Bm_file.sys_file}">${Bm_file.org_file}</a><br/>
									</c:forEach>
                                </div>
						    </td>
							</c:if>
                   	 	</tr>


</tbody></table></div>
			<div class="btn-wrap" >
			<c:if test="${bm_state != 2 }">
				<button type="button" id="bmupdatebutton" class="btn2 btn-color7 br" style="width: 63px;">업무완료 </button>
     		   	<button type="button" onClick="window.location='mytodoContentModify.jp?bm_num=${bm_num}'" class="btn2 btn-color7 br">수정 </button>
    			</c:if>
    			<button type="button" onClick="window.location='my_bm_delete.jp?bm_num=${bm_num}'"class="btn2 btn-color7 br">삭제 </button>
    			<button type="button" onClick="window.location='mytodoList.jp'"class="btn2 btn-color7 br">목록  </button>
    
    		</div>
</form></div></div>
</div>
</body>
</html>