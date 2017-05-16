<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/JackPot/js/jquery.min.js"></script>
<!--  jQuery UI CSS파일 --> 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<link rel="stylesheet" href="/JackPot/css/common.css?ver=1" type="text/css" /> 
<link rel="stylesheet" href="/JackPot/css/basic.css?ver=2" type="text/css" />
<link rel="stylesheet" href="/JackPot/css/sub.css?ver=3" type="text/css" />    
<link rel="stylesheet" href="/JackPot/css/bm.css?ver=9 type="text/css" />   
<script src="/JackPot/js/jquery.form.min.js"></script><!-- 파일업로드 (jquery plug-in) -->
<script src="/JackPot/js/jQuery.MultiFile.min.js"></script>
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
						window.location='bmYCH_state_finish.jp?bm_num=${bm_num}';
					}else if(bm_state == 2){
						alert("이미 완료되었습니다.")
					}
				});
			});
			
$(document).ready(function(){
	$("#bmupdatebutton").click(function(){
			var bm_state;
			var result = confirm('업무반려 처리하시겠습니까?');
				if(bm_state != 0){
					window.location='bmYCH_state_nonfinish.jp?bm_num=${bm_num}';
				}else if(bm_state == 0){
					
				}
			});
		});
</script>

<title> 내가한 업무 요청 조회 </title>
  
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />

<div id="main-contents">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="con-header">

    <h2>내가 한 업무 요청</h2>


    </div>
<form id="myBmYCHCont">    
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
							<th scope="row" >지시자 </th>
                            <td colspan="3">
                                <div >
                                	${bmdto.bm_name }
                                </div>
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
							<th scope="row">담당자  </th>
                            <td colspan="3">
                                <div>
                                	${bmdto.inchar_name }
                                </div>
                   	 	</tr>
                        
						<tr>
							<th scope="row" >참조자  </th>
                            <td colspan="3">
                                <div>
                                	${bmdto.ref_name }
                                </div>
                   	 	</tr>
                        
  						<tr>
							<th scope="row">업무보관함    </th>
                            <td colspan="3">
                                <div>
                                	${bmdto.box_name }
                                </div>
                   	 	</tr>
                   	 	
  						<tr>
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
                                	<a>첨부 파일</a>
                                	<c:forEach var="Bm_file" items="${Bm_file}">
										<a href="bmFileDown.jp?fileName=${Bm_file.sys_file}">${Bm_file.org_file}</a><br/>
									</c:forEach>
                                </div>
						    </td>
							</c:if>
                   	 	</tr>

</tbody></table></div>
			

<div class="inform-wrap" >
	<div class="statement">
    	<h4>처리내역</h4>
           	<div class="form-block" >
           	<form name="history" action="/JackPot/insertHistory.jp"  method="post" enctype="multipart/form-data" id="inputfile" onSubmit="return checkIt();" >
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
             <table class="table">
                    	    	

                         	<tbody>
                            	<tr>
                                	<th scope="row">담당자</th>
                                    	<td >
                                        	<div class="director-info">
            
                                                 	${bmdto.inchar_name }
							
                                                </div>
                                            </td>
                                            </tr>
                                            <tr>
                                            <th scope="row">최종수정일</th>
                                            		<c:if test="${his.modify_date == null }">
 														<td >
                             			   				<div> </div>                               
 													</c:if>
 							
		                           				 	<c:if test="${his.modify_date != null }">
        		                    					<td >
                		                					<div>
                        		          						${sdf.format(his.modify_date) }
                                							</div>           
				      	 	 							</td>     
												</c:if>               
                   	 						</tr>                 

                                          	  <tr>
	                                         <th scope="row"> 의견 </th>
	                                         <c:if test="${bm_state != 1 }">
	                                            <td >
	                                                ${his.his_content}
	                                           </td>
	                                          </c:if>
	                                          <c:if test="${his_content == 1}">
	                                           <td >
													<textarea id="userContents" name="his_content" class="form-control" placeholder="의견을 입력하세요." rows="5" ></textarea>
	                                           </td>
	                                         </c:if>
	                                    </tr>
                                
							<!--파일 부분 -->	
							
							<div class="fileup">
								<tr>
								  <th scope="row">
								 파일 업로드 
								</th>

						<td class="plupload_wrapper" >
							<c:if test="${fileCount == 0}">
								파일 : <input type="file" name="org_file" value="파일 첨부" id="fileInp" />
							<div id="file-list"></div>
							</c:if>
                   	 	   <c:if test="${fileCount > 0}">
                                	<a>첨부 파일</a>
                                	<c:forEach var="Bm_file" items="${Bm_file}">
										<a href="bmFileDown.jp?fileName=${Bm_file.sys_file}">${Bm_file.org_file}</a><br/>
									</c:forEach>
									</c:if>
                                </div>
						    </td>
                   	 	</tr>
					</div>

			</tbody>
          </table>
          </div></div>
          </div>
 


			<div class="btn-wrap" >
			<c:if test="${bm_state !=1}">
				<input type="submit" value="처리" class="btn btn-color5 br" />
     		 	<button type="button"  id="banlyeo"onClick="window.location='bmYCH_state_nonfinish.jp?bm_num=${bm_num}'"class="btn2 btn-color7 br">반려 </button>
    		</c:if>
    			<button type="button" onClick="window.location='myBmYCHList.jp'"class="btn2 btn-color7 br">목록  </button>
    
    		</div>
</div></div>
</div>
</body>
</html>