<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 파일업로드 (jquery plug-in) -->
<script src="/JackPot/js/jquery.form.min.js"></script>
<script src="/JackPot/js/jQuery.MultiFile.min.js"></script>
<script src="resource/ckeditor.js"></script>

 <script type="text/javascript">
 
 /* 달력  */
 $(function() {
     	      $( "#bm_start,#bm_end").datepicker({
     	    	    showOn: "button", 
                     buttonImage:"/JackPot/images/calendar (1).png",
                     buttonImageOnly: true ,
                     buttonText: "Select date",
                     buttonImageSize : "vertical-align: middle; margin: 10px 10px 10px 10px",
     	    	 	dateFormat:'yy-mm-dd', 
						showButtonPanel: true,
						changeMonth: true, 
						changeYear: true,
						nextText: '다음 달',
						prevText: '이전 달',
						currentText:'오늘 날짜',
						closeText: '닫기',
						changeMonth: true, 
						dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
						monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
						minDate : 'd',
					});
     	      
     	  
 	   });
 	   
 	   
 	   

 $(document).ready(function()
			{
	 	/* 		CKEDITOR.instances.bm_content.setData("${bmdto.bm_content}");  */  
			    $('input[name=bm_end2]').change(function()
			    {
			    	
			    	if($(':checkbox[name="bm_end2"]:checked').val()=='0')
					{	    		
						$('#bm_end').hide();
			    			 
					}
			    });
			    
			 });
		

 
	/* 파일 다중 업로드 */
	$(document).ready(function(){
 
 	//use jQuery MultiFile Plugin 
	    $('#bminputfile input[name=org_file]').MultiFile({
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
	/* 선택한 파일 지우기 */
	$(document).ready(function() {
		$('.fileList').click(function() {
			$(this).hide();
			$("#multiform").append("<input type='hidden' name='cfile' value='"+this.text+"' />");
		});
	});
	/*
	  if(confirm("정보를 수정 하시겠습니까?")){
		  $.ajax({
		        url: "bmFormModify.jp",
		        type:"post", 
		        data : {bm_num:bm_num},
		        success: function(result){
		            if (result =="OK") {
		              alert("삭제되었습니다.");
		            } else{
		                alert("삭제되지 않았습니다.");
		            }
		        }
		    })
		}*/


</script>


<title> 내가한 업무 요청 수정  </title>
</head>    
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />
<div id="main-contents">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="con-header">
    <h2>나의 할 일 수정 </h2>
    </div>
<form name="bmInput" method="post" id="bminputfile" action="mytodoContentModifyPro.jp?bm_num=${bm_num }" enctype="multipart/form-data"    onSubmit="return checkIt();">
<div class="form-block">
                <table class="table">
                    <caption></caption>
                    <tbody>
                        <tr>
                            <th scope="row">제목</th>
                            <td>
                                <div>
                                	<input type="text" title="제목" name="bm_title" class="form-control" value="${bmdto.bm_title}" placeholder="제목을 입력하세요.">
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
	                  
				
                       <tr id="Termless" style=" display: ;" >
							<th scope="row">업무기한 </th>
                            <td colspan="3">
								<input type="text" id="bm_start" name="bm_start"readonly value="${bmdto.bm_start }" ><!-- readonly 칸에 글자못쓰게 막기-->
								<input type="text" title="종료날짜" id="bm_end" value="${bmdto.bm_end }" name="bm_end" readonly>
                           		<span class="label-group ml10">
								<input type="checkbox" title="기한없음" id="bm_end2" name="bm_end" value="0"><label>기한없음</label>
                             	
                            </td>
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
                    	
                    	<tr id="alarmTR">
                            <th scope="row">수정 알림</th>
                            <td colspan="3">
                     
                                <input name="reg_notice" type="checkbox" title="쪽지 발송" value="쪽지 발송"> 쪽지 발송&nbsp;&nbsp;
                                <input name="reg_notice" type="checkbox" title="푸시 발송 " value="푸시 발송"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr id="rAlarmTR">
                            <th scope="row">완료 알림</th>
                            <td>

                                <input name="cmp_notice" type="checkbox" title="쪽지 발송"  value="쪽지 발송"> 쪽지 발송&nbsp;&nbsp;
                                <input name="cmp_notice" type="checkbox" title="푸시 발송 " value="푸시 발송 "> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>

  						<tr>
							<th scope="row">업무보관함    </th>
                            <td colspan="3">
                            	<select name="bns_box" class="w400" style="">
									<c:if test="${countBns_box == 0}">
										<option value="0">폴더 없음</option>
									</c:if>
									<c:if test="${countBns_box > 0}">
											<option name="bns_box" value="${bmdto.bns_box }" selected>${bmdto.box_name }</option>
										<c:forEach var="Bns_box" items="${ListBns_box}">
											<c:if test="${Bns_box.bns_num == bmdto.getBns_box()}">
												<option value="${Bns_box.bns_box}" >${Bns_box.box_name}</option>
											</c:if>
											<c:if test="${Bns_box.bns_num != bmdto.getBns_box()}">
												<option value="${Bns_box.bns_box}">${Bns_box.box_name}</option>
											</c:if>									
									</c:forEach>
								</c:if>
								</select>
                            </td>
                   	 	</tr>
                   	 	
  						<tr style=" height: 500px;">
							<th scope="row">업무내용  </th>
                            <td colspan="3">
                                <div>			
									<textarea class="ckeditor" cols="1" id="bm_content"  value="${bmdto.bm_content}"  name="bm_content" rows="15">${bmdto.bm_content}</textarea>
                                </div>
                   	 	</tr>
                   	 	<!--파일 부분 -->	
                   	 		
                   	 	<tr>
							<th scope="row">
							<div class="fileup">
								<div class="fileup_t">
									<h3>파일 업로드</h3>
								</div></div></th>
							<c:if test="${fileCount == 0}">
                            <td colspan="3">
                                <div>
                             		첨부파일이 없습니다.
                             	<div class="plupload_wrapper">
								파일 : <input type="file" name="org_file" value="파일 첨부" id="fileInp" />
								<div id="file-list"></div>
								</div>
                                </div>
						    </td>
							</c:if>
                   	 	
                   	 		<c:if test="${fileCount > 0}">
                            <td colspan="3">
								<div>
									<c:forEach var="file" items="${file}">
										<a class="fileList"><img src='/JackPot/images/memo/delete-photo.png'/>${Bm_file.org_file}</a><br/>
									</c:forEach>
									<div class="plupload_wrapper">
										파일 : <input type="file" name="org_file" value="파일 첨부" id="fileInp" />
									<div id="file-list"></div>
                              	  </div>
						    </td>
							</c:if>
                   	 	</tr>


</tbody></table></div>

		<div class="btn-wrap" >
			<input type="submit" value="저장" class="btn btn-color5 br" />
        	<button type="button" onClick="window.location='mytodoList.jp'"class="btn2 btn-color7 br">취소</button>
    
    	</div>
</form></div></div>
</div>
</body>
</html>