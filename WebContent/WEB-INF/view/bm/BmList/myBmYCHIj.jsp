<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>> 
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
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=1" type="text/css" />   
<script src="resource/ckeditor.js"></script>
<html>
<head>

<style type="text/css">

.inform-wrap { padding: 7px; background-color: #e9ecef;}
* { box-sizing: border-box;}
.statement { position: relative; background: #fff;}
.statement h4 { padding: 12px 14px;  background-color: #f9fafc;  border-bottom: 1px solid #cccccc;  font-size: 16px;  font-weight: 600;}
h4 {  display: block;  -webkit-margin-before: 1.33em;  -webkit-margin-after: 1.33em;  -webkit-margin-start: 0px;  -webkit-margin-end: 0px;  font-weight: bold;}
h1, h2, h3, h4, h5, h6 { padding: 0;  margin: 0;  font-weight: 500;  line-height: 1.1;}

.todo-cate-box.color2, .todo-cate-box1.color2, .todo-cate-box3.color2, .todo-cate-box4.color2 {  background: #59c2e6;}
.statement .todo-cate-box1, .statement .todo-cate-box2, .statement .todo-cate-box3 {  position: absolute; top: 11px; right: 20px;}
.todo-cate-box1 { display: inline-block; width: 83px; padding: 2px 8px 1px !important; line-height: 18px;  text-align: center;  font-size: 11px;  color: #fff;  border-radius: 2px;}
.todo-cate-box2 {display: inline-block; width: 83px; padding: 1px 8px 0 !important; line-height: 18px; border: 1px solid #ddd !important; background: #fff; text-align: center; font-size: 11px; color: #767575 !important; border-radius: 2px;}
.todo-cate-box.color4, .todo-cate-box1.color4, .todo-cate-box3.color4, .todo-cate-box4.color4 { background: #f2a62e;}
.todo-cate-box1 {display: inline-block; width: 83px; padding: 2px 8px 1px !important; line-height: 18px; text-align: center; font-size: 11px; color: #fff; border-radius: 2px;}
ul:not(.itemContentLi), ol:not(.itemContentLi), dl, dt, dd, p { margin: 0; padding: 0;}
.progtd-todo {}
.progtd { margin-bottom: 0; list-style: none;}
* {  -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;}
ul, menu, dir { display: block; list-style-type: disc; -webkit-margin-before: 1em; -webkit-margin-after: 1em; -webkit-margin-start: 0px; -webkit-margin-end: 0px; -webkit-padding-start: 40px;}
.bar-chart-todo:first-child { margin-top: 5px;}
.bar-chart-todo { position: relative; margin-top: 20px;}
.bar-chart-todo .bar-chart {  height: 15px; background: #f5f5f5;}
.bar-chart-todo .bar-chart .bar { height: 15px; background: #de4848;width: 60%;}
i.icon.exclamation02 {  width: 12px; height: 12px; background-position: -45px -57px;}
i.icon { display: inline-block; vertical-align: middle; background-image: url(../images/common/ic_common.png); margin: 0 4px; background-repeat: no-repeat;}
.form-control {display: inline-block; width: 100%; border: 1px solid #c3c6c9; border-radius: 2px; font-size: 12px; color: #555; line-height: 1.42857;}
button, input, optgroup, select, textarea { color: inherit; font: inherit; margin: 0;}
textarea { padding: 5px 8px; color: #555; border: 1px solid #c3c6c9; border-radius: 2px; /* box-shadow: 0 3px 3px #f4f4f4 inset; */ resize: vertical; overflow: auto;}
input, button, select, textarea { vertical-align: middle;}

</style>

 <script type="text/javascript">
 
 /* 파일 다중 업로드 */
	$(document).ready(function(){
 
 	//use jQuery MultiFile Plugin 
	    $('#inputfile input[name=org_file]').MultiFile({
 	    max: 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
     	accept: '',
	        maxfile: 1024, //각 파일 최대 업로드 크기
 	    maxsize: 3024,  //전체 파일 최대 업로드 크기
     	STRING: { //Multi-lingual support : 메시지 수정 가능
	        remove : "<img src='/JackPot/images/memo/delete-photo.png'/>", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
 	        duplicate : "$file 은 이미 선택된 파일입니다.", 
     	    denied : "$ext 는(은) 업로드 할수 없는 파일확장자입니다.",
		    selected:'$file 을 선택했습니다.', 
 	        toomuch: "업로드할 수 있는 최대크기를 초과하였습니다.($size)", 
     	    toomany: "업로드할 수 있는 최대 갯수는 $max개 입니다.",
	        toobig: "$file 은 크기가 매우 큽니다. (max $size)"
 	    },
     	list:"#file-list" //파일목록을 출력할 요소 지정가능
	    });
	});
 
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

<!-- 
<script>
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
</script>

 -->

<title> 내가한 업무 요청 조회 </title>
    
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />
<div id="main-contents">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="con-header">
    <h2>내가한 업무 요청 조회</h2>
    </div>
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
                                	${bmdto.bm_state2}
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


</tbody></table></div></div>

<div class="inform-wrap" >
	<div class="statement">
    	<h4>처리내역</h4>
    	<c:if test="${bmdto.bm_state == 1}"> <!-- 미완료  -->
    	    <span class="todo-cate-box1 color2">${bmdto.bm_state2 }</span>
    	 </c:if>
    	 <c:if test="${bmdto.bm_state == 2}"><!-- 완료  -->
    	    <span class="todo-cate-box1 color2">${bmdto.bm_state2 }</span>
    	 </c:if>
    	 <c:if test="${bmdto.bm_state == 3}"><!-- 지연  -->
    	    <span class="todo-cate-box1 color4">${bmdto.bm_state2 }</span>
    	 </c:if>
    	 <c:if test="${bmdto.bm_state == 0}"><!-- 반려  -->
    	    <span class="todo-cate-box1 color2">${bmdto.bm_state2 }</span>
    	 </c:if>
    	 
            	<div class="form-block" >
            	<form name="history" class="form-horizontal" action="" method="post">
                	<table class="table">
                    	<caption></caption>
                         	<tbody>
                            	<tr>
                                	<th scope="row">담당자</th>
                                    	<td>
                                        	<div class="director-info">
                                        		<div>
                                            		<span>
                                                 			<a href="javascript:void(0)" onclick="spro.showUserContextMenu(this, 'U144718', 'bottom')" title="서지연">${ Bm_ref1.ref_name}</a>
                                                    	</span>
                                                	</div>
                                                </div>
                                            </td>
                                            
                                            <th scope="row">최종수정일</th>
                                            	<td>
                                            		<c:if test="${his.modify_date == null }">
 														<td>
                             			   				<div> </div>                               
 													</c:if>
 							
		                           				 	<c:if test="${his.modify_date != null }">
        		                    					<td>
                		                					<div>
                        		          						${sdf.format(his.modify_date) }
                                							</div>           
				      	 	 							</td>     
												</c:if>               
                   	 					</tr>

                                        <tr>
                                            <th scope="row">진척율</th>
                                            <c:if test="${his_process ==null }">
                                            <td colspan="3">
                                            	<ul class="progtd progtd-todo">
                                                    <li class="active"><a href="javascript:checkProgress('0');"><span>0%</span></a></li>
                                                    <li class=""><a href="javascript:checkProgress('20');"><span>20%</span></a></li>
                                                    <li class=""><a href="javascript:checkProgress('40');"><span>40%</span></a></li>
                                                    <li class=""><a href="javascript:checkProgress('60');"><span>60%</span></a></li>
                                                    <li class=""><a href="javascript:checkProgress('80');"><span>80%</span></a></li>
                                                    <li class=""><a href="javascript:checkProgress('100');"><span>100%</span></a></li>
                                                </ul>
                                                <div class="tdprogress" style="width:448px;">
	                                                <div class="bar-chart-todo">
	                                                    <div class="bar-chart">
	                                                        <div id="progressBar" class="bar" style="width:0%;"></div>
	                                                    </div>
	                                                </div>
	                                            </div>
	                                            <div>
	                                            </c:if>
	                                            <c:if test="${his_process !=null }">
	                                            	<td colspan="3">
	                                            		${his. his_process}
	                                            	</td>
	                                            </c:if>
	                                                <span><i class="icon exclamation02"></i> 업무완료(100%) 후에는 업무 내용을 수정할 수 없습니다.</span>
                                                </div>
                                            </td>
                                        </tr>
                                       <tr>
                                            <th scope="row">업무내용</th>
                                            <td colspan="3">
                                                <textarea id="userContents" name="his_content  " class="form-control" value="${his_content}" placeholder="업무 내용을 입력하세요." rows="10" title="업무내용"></textarea>
                                            </td>
                                        </tr>
                                	</tbody>
                                </table>
							<!--파일 부분 -->	
							<div class="fileup">
								<div class="fileup_t">
									<h3>파일 업로드</h3>
								</div>
			
							<div class="plupload_wrapper">
								파일 : <input type="file" name="org_file" value="파일 첨부" id="fileInp" />
								<div id="file-list"></div>
							</div>
                            </div>
                        </div>
 

			<div class="btn-wrap" >
				<button type="button" class="btn btn-color5 br" onclick="window.location='bmForm.jp'">업무 등록</button>
     		   	<button type="button" onClick="window.location='myBmModify.jp?num=${bm_num}'" class="btn2 btn-color7 br">수정 </button>
    			<button type="button" onClick="window.location='bm_Ij_delete.jp?bm_num=${bm_num}'"class="btn2 btn-color7 br">삭제 </button>
    			<button type="button" onClick="window.location='mytodoList.jp'"class="btn2 btn-color7 br">목록  </button>
    		</div>
</form></div></div>
</div>
</body>
</html>