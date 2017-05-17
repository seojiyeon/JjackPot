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


<html>
<head>
<style type="text/css">
.plupload_wrapper {
    font-family: "Nanum Gothic", NanumGothic, 나눔고딕, NanumGothic, ng, 돋움, Dotum, Helvetica, "Apple SD Gothic Neo", sans-serif;
    font-size: 12px;
    line-height: 20px;
}
</style>

<script >
	 

    	   $(document).ready(function()
    				{
    				    
    				    $('input[name=bm_form]').change(function()
    				    {
    				    	
    				    	if($(':radio[name="bm_form"]:checked').val()=='1')
    						{	    		
    							$('#Termless').show();
    				    		$('#incharge').hide();
    							$('#rec').hide();
    							$('#ref').hide();
    				    		
    						}else if($(':radio[name="bm_form"]:checked').val()=='2')
    						{
    							$('#Termless').show();
    							$('#incharge').show();
    							$('#rec').hide();
    							$('#ref').show();
    						}else if($(':radio[name="bm_form"]:checked').val()=='3')
    						{
    							$('#Termless').hide();
    							$('#incharge').hide();
    							$('#rec').show();
    							$('#ref').show();
    						}else if($(':radio[name="bm_form"]:checked').val()=='4')
    						{
    							$('#Termless').hide();
    							$('#incharge').hide();
    							$('#rec').show();
    							$('#ref').show();
    						}
    				    });
    				});
    	   
    	   
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
			    
			    $('input[name=bm_end2]').change(function()
			    {
			    	
			    	if($(':checkbox[name="bm_end2"]:checked').val()=='0')
					{	    		
						$('#bm_end').hide();
			    			 
					}
			    });
			    
			 });
		



	function checkIt() {
		var bminput = eval("document.forms.bminput"); //forms : 전체폼중에서 bminput을 사용한다.
		
		if(bminput.bm_title.value == null ) {
			alert("제목을 입력하시요.");
			return false;
		}
		
		if(bminput.bm_content.value == null) {
			alert("내용을 입력하시요.");
			return false;
		}
		if(bminput.file.value == null) {
			alert("파일을 선택 하시요.");
			return false;
		}
		
/* 		
		if(!bminput.ref_name.value) {
			alert("참조자를 선택하시요.");
			return false;
		}
		
		if(!bminput.inchar_name.value) {
			alert("담당자를 선택하시요.");
			return false;
		}
		
		if(!bminput.rec_name.value) {
			alert("수신자를 선택하시요.");
			return false;
		} */
	}
	
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
	
	

function openInchar(){
	url = "/JackPot/incharPop.jp"
 	open(url, "inchar", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
   }  
   
function openBms_rec(){
	url = "/JackPot/bms_recPop.jp"
 	open(url, "bms_rec", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
   }   
   
function openBm_ref(){
	url = "/JackPot/refPop.jp"
 	open(url, "Bm_ref", "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=1200, height=500");
   }   
   
 
function resetAll(){
	  document.frm.reset();
	 }
	 
</script>



<title> 업무관리</title>
</head>    
 <body>
<jsp:include page="bm_sidebar.jsp" flush="false" />
<div id="main-contents" style=" TOP: 80PX;">
<form name="bminput"method="post" id="inputfile" action="/JackPot/bmFormPro.jp" enctype="multipart/form-data"  onSubmit="return checkIt();">
<div class="content-wrap">
<div class="content-write" style="width: 100%;">
<div class="form-block">
                <table class="table">
                    <caption></caption>
                    <tbody>
                        <tr>
                            <th scope="row"><span class="text-point-b">*</span>제목</th>
                            <td>
                                <div>
                                	<input type="text" title="제목" name="bm_title" class="form-control" value="${bm_title}" placeholder="제목을 입력하세요.">
                                </div>
                            </td>
                        </tr>
                        
						<tr>
							<th scope="row"><span class="text-point-b" >*</span>업무형태</th>
							<td>
								<div >
									
									<label ><input type="radio" id="type" name="bm_form" title="나의 할일" value="1"> 나의 할 일</label>
									<label ><input type="radio"  id="type" name="bm_form" title="업무 요청" value="2" checked="checked"> 업무 요청</label>
                              	  <label ><input type="radio"   id="type" name="bm_form" title="업무 보고" value="3"> 업무 보고</label>
                              	  <label ><input type="radio"  id="type" name="bm_form" title="업무 일지" value="4"> 업무 일지</label>
                             </div>
                       	 	</td>
                   	 	</tr>
                    
                    <tr id="Termless" >
                    	<th id="isTermlessTR"  ><span class="text-point-b">*</span>업무기한</th>
							<td>
		
								<input type="text" id="bm_start" name="bm_start"readonly value=${date } ><!-- readonly 칸에 글자못쓰게 막기-->

								<input type="text" title="종료날짜" id="bm_end" value="${date }" name="bm_end" readonly>
                           		<span class="label-group ml10">
								<input type="checkbox" title="기한없음" id="bm_end2" name="bm_end" value="0"><label>기한없음</label>
                             	</span>
                            </td>
                        </tr>
                 
                        <tr id="incharge" >
                            <th id="incharge_name" scope="row">
                            	<span class="text-point-b">*</span>담당자</th>
                            <td>
                            
								<input type="text" title="사용자" id = "inchar_name" name="inchar_name"  value="${inchar_name}" placeholder="사용자" readonly style="box-shadow:none;">
                                <button type="button" class="btn input-group-addon btn-color5 br" onclick="openInchar()"><i class="icon man-plus">
                                <span class="none">사용자</span></i></button>
     						</td>
                        </tr>
                        
                        <tr id="rec" style=" display: none;">
                        	<th id="rec_name" scope="row" ><span class="text-point-b">*</span>수신자</th>
                            <td>
                    
                            	<input type="text" title="사용자" name="rec_name"  value="${rec_name}" placeholder="사용자" readonly style="box-shadow:none;">
								<button type="button" class="btn input-group-addon btn-color5 br"  onClick="openBms_rec()">
								<i class="icon man-plus">
                                <span class="none">사용자</span></i></button>
                       
                            </td>
                        </tr>
                        
                        <tr id="ref" >
                            <th id="ref_name" scope="row" ><span class="text-point-b">*</span>참조자
                            </th>
                            <td>
                      			<input type="text" title="사용자" name="ref_name"  value="${ref_name}" placeholder="사용자" readonly style="box-shadow:none;">
                                <button type="button" class="btn input-group-addon btn-color5 br" onclick="openBm_ref()">
                                <i class="icon man-plus">
                                <span class="none">사용자</span></i></button>

                            </td>
                        </tr>


                       
                    
                        
                        <tr id="alarmTR">
                            <th scope="row">등록 알림</th>
                            <td>
                     
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
                        
                        <tr >
                            <th scope="row"><label for="bns_box">업무 보관함</label></th>
                            <td>
                            	<select name="bns_box" class="w400" style="">
									<c:if test="${countBns_box == 0}">
										<option value="0">폴더 없음</option>
									</c:if>
									<c:if test="${countBns_box > 0}">
											<option name="bns_box" value="0" selected>없음</option>
										<c:forEach var="Bns_box" items="${ListBns_box}">
											<c:if test="${Bns_box.bns_num == bmdto.getBns_box()}">
												<option value="${Bns_box.bns_num}" >${Bns_box.box_name}</option>
											</c:if>
											<c:if test="${Bns_box.bns_num != bmdto.getBns_box()}">
												<option value="${Bns_box.bns_num}">${Bns_box.box_name}</option>
											</c:if>									
									</c:forEach>
								</c:if>
								</select>

                            </td>
                        </tr>
                      
              </tbody>
              </table></div></div></div>
              
              
		<!--ckeditor 부분 -->
			
		<div>
			<textarea class="ckeditor" cols="1" id="bm_content"  value="${bm_content}"  name="bm_content" rows="15"></textarea>
		</div>
					
		<!--파일 부분 -->	
		<div class="fileup">
			<div class="fileup_t">
				<h3>파일 업로드</h3>
			</div>
			<div class="inputFileNImg">
				파일 : <input type="file" name="org_file" value="파일 첨부" id="fileInp" />
			</div>
			<td>
				<div id="file-list"></div>
			</td>
		
		<div class="btn-wrap" >
			<input type="submit" value="저장" class="btn btn-color5 br" />
        	<button type="button" onClick="window.location='bmForm.jp'"class="btn2 btn-color7 br">취소</button>
    
    	</div>
</form>
</div>
</body>
</html>