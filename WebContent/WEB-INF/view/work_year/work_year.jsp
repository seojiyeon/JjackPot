<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="jquery-3.1.1.min.js"></script> 
	<script type="text/javascript" src="/js/calendar.js"></script>
    <!--  jQuery UI CSS파일 --> 
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
	<!-- // jQuery 기본 js파일 -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
	<!-- // jQuery UI 라이브러리 js파일 -->
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	
	<script type="text/javascript">
	

    	   $(function() {
        	      $( "#work_date").datepicker({
        	    	    showOn: "both", 
                        buttonImage:"/JackPot/images/calender.png",
                        buttonImageOnly: true ,
                        buttonImageSize : "vertical-align: middle; margin: 10px 235px 0px 0px",
        	    	 	dateFormat:'yy/mm/dd', 
						showButtonPanel: true,
						changeMonth: true, 
						changeYear: true,
						nextText: '다음 달',
						prevText: '이전 달',
						currentText:'오늘 날짜',
						changeMonth: true, 
						dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
						monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					});
        	      });
       
           
	</script>

	<head>
		<h2>휴가신청</h2>
		<hr style="border: solid 0.5px rightgray;">
	<table>
		<td>사업장 루크</td>  
		<td> 
		휴가년월 
		<input type="text" id="work_date" name="schdate"  style="width:100px;height:25px; margin: 10px 0px 0px 0px;" value="<fmt:formatDate value="${now}" type="both" pattern="yyyyMMdd"/>"/> 
		</td>
		<td>
			전자결재상태
			<select>
				<option selecte>전체</option> 
				<option>작성 </option> 
				<option>결재요청</option> 
				<option>완료</option> 
				<option>자동승인 </option> 
				<option>반료 </option> 
			</select>
		</td>
		<td align="right">
			<input type= "button" id="work_on" value="검" >
		</td>
	</table>
	
	<table>
		<td>사원번호</td>
		<td>
		<textbox text=""></textbox>
	
		</td>
 

	</table>


		
	</form>