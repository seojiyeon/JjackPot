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
				<option >전체</option> 
				<option>작성 </option> 
				<option>결재요청</option> 
				<option>완료</option> 
				<option>자동승인 </option> 
				<option>반료 </option> 
			</select>
		</td>
		<td align="right">
			<input type= "button" id="" value="검색" >
		</td>
	</table>


	<table>
		

		<form id="" action="#">
		<table >
			<caption></caption>
			<colgroup>
				<col width="90px">
				<col width="120px">
				<col width="90px">
				<col width="120px">
				<col width="90px">
				<col width="120px">
				<col width="90px">
				<col width="120px">
				<col>
			</colgroup>
			<tbody>		
			<tr>
				<td>
				&nbsp;휴가신청 후 (1)실제사용여부에 체크 
				(2)전자결재상테가 '완료(승인)' or '자동승인'이 된 경우에만 휴가 사용일수에 '+'가 되고 
				잔여일수에서 '-'가 됩니다<br>	
				</td>
			<tr>
				<th scope="row"><label for="${y_dto.emp_num}">사원번호</label></th>
				<td>
					<input type="text" id="${y_dto.emp_num}" name="emplMgntNo">
				</td>
				<th scope="row"><label for="${y_dto.eemp_name}">성명</label></th>
				<td>
						<input type="text" id="${y_dto.eemp_name}" name="emplNm" >
					</td>
					<th scope="row"><label for="${y_dto.y_day}">연차기간</label></th>
					<td colspan="3">
						<input type="text" id="${y_dto.y_start}" name="yhdsStDt" > ~
						<input type="text" id="${y_dto.y_end}" name="yhdsEndDt" >
					</td>
					<td rowspan="2">
						<button type="button" id="${y_dto.eemp_name}">사용휴가조회</button>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="${y_dto.y_basic}">기본연차</label></th>
					<td>
						<input type="text" id="${y_dto.y_basic}" name="y_basic" >
					</td>

					<th scope="row"><label for="${y_dto.y_use}">사용일수</label></th>
					<td>
						<input type="text" id="${y_dto.y_use}" name="y_use" >
					</td>
					<th scope="row"><label for="${y_dto.y_remain}">잔여일수</label></th>
					<td>
						<input type="text" id="${y_dto.y_remain}" name="y_remain" >
					</td>
				</tr>
			</tbody>
		</table>
		</form>
	</table>
	
		<h3>휴가신청내역<em>0</em></h3>
	<table>
		<tr>
			<td>NO</td>
			<td> 신청일 </td>
			<td>휴가구분</td>
			<td>전일/반일</td>
			<td>시작일</td>
			<td>종료일</td>  
			<td>일수</td>
			<td> 전자결재상태</td>
			<td>실제사용</td>
			<td>휴가사유</td>
		</tr>
	
			
	</table>
	<div class="subtitle">
		<h3>휴가신청</h3>
	</div>
	<div class="content-write mb10">
		<form id="vctnUseRegMngForm" action="#" novalidate="novalidate">

		<input type="hidden" id="vctnUseRegMngForm_enplcCd" name="enplcCd" value="">
		<input type="hidden" id="vctnUseRegMngForm_emplNo" name="emplNo" value="">
		<input type="hidden" name="viewMenuCode" value="PF05">
		<input type="hidden" id="vctnUseRegMngForm_schdId" name="schdId">

		<table class="table border-top separate">
			<colgroup>
				<col width="120">
				<col width="170">
				<col width="120">
				<col width="140">
				<col width="120">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="${y_dto.y_day}">휴가신청일 </label></th>
					<td>
						<input type="text" id="${y_dto.y_day}" name="y_day" class="w100 ajaxDatePicker" value="2017.04.05" aria-required="true">
						<button class="btn btn-color5 br tbl-inner" type="button"><i class="icon calendar"></i></button>
					</td>
					<th scope="row">
						<span class="text-point-b" title="필수입력항목">*</span><label for="${y_dto.y_kind}">휴가구분</label>
					</th>
					<td>
						<select id="${y_dto.y_kind}" class="w100" name="y_kind" aria-required="true">
							<option value="" selected="selected">선택</option>
							
								<option value="H00">휴가(년차)</option>
							
								<option value="H01">생리휴가</option>
							
								<option value="H02">병가</option>
							
								<option value="H03">경조휴가</option>
							
								<option value="H04">출산휴가</option>
							
								<option value="H05">포상휴가</option>
							
						</select>
					</td>
						
						<!-- <label> - </label>
						<input class="w55" type="text" id="vctnUseRegMngForm_startTime"> ~ <input class="w55" type="text" id="vctnUseRegMngForm_endTime"> -->
					</td>
				</tr>
				<tr><!-- 휴가기간 -->
					<th scope="row"><span class="text-point-b" title="필수입력항목">*</span><label for="${y_dto.y_day}">휴가기간</label></th>
					<td colspan="3">
						<input type="text" id="${y_dto.y_start}" name="y_start" class="w100 ajaxDatePicker" value="2017.04.05" aria-required="true">
						<button class="btn btn-color5 br tbl-inner" type="button"><i class="icon calendar"></i></button>
						~
						<input type="text" id="${y_dto.y_end}" name="y_end" class="w100 ajaxDatePicker" value="2017.04.05" aria-required="true">
						<button class="btn btn-color5 br tbl-inner" type="button"><i class="icon calendar"></i></button>

						(일수 : 
						<input type="text" class="w50" id="${y_dto.y_day}" name="y_day" disabled="disabled">)

						<input type="hidden" id="${y_dto.y_start}" name="y_start" value="2017.04.05"> <!-- disabled 되었을 때 -->
						<input type="hidden" id="${y_dto.y_end}" name="y_end">
					</td>

				</tr>
			</tbody>
		</table>
		</form> --%>
		<!-- <div class="overflowH">
			<div class="btn-wrap fleft">
				
					<button type="button" id="vctnUseRegMngFormPayCompu" class="btn btn-color13 br" style="display: inline-block;">전자결재</button>
					<button type="button" id="vctnUseRegMngFormPayCompuCancle" class="btn btn-color13 br none" style="display: none;">전자결재취소</button>
				
			</div>
			<div class="btn-wrap fright">
				<button type="button" id="vctnUseRegMngFormReCreate" class="btn btn-color7 br" style="display:none;">재작성</button>재작성
				<button type="reset" id="vctnUseRegMngFormReset" class="btn btn-color7 br" style="display: none;">신규</button>신규
				<button type="button" id="vctnUseRegMngFormDel" class="btn btn-color7 br" style="display: none;">삭제</button>
				<button type="button" id="vctnUseRegMngFormSave" class="btn btn-color5 br" style="display: none;">저장</button>저장
			</div>
		</div>

		<div class="ins-box mt10">
			<ul>
				<li><i class="fa fa-exclamation-circle"></i>&nbsp;휴가구분은 근태기초정보설정/조회&gt;휴가항목설정에서 추가 또는 변경할 수 있습니다</li>
				<li><i class="fa fa-exclamation-circle"></i>&nbsp;휴가신청 작성 후 전자결재 처리 순서입니다</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;1)최초 입력 후(전자결재 사용시) : 휴가 신청 등록 -&gt; 전자결재(완료)</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;2)최초 입력 후(전자결재 미사용시) : 휴가 신청 등록과 동시에 전자결재(자동승인) 처리</li>
				<li><i class="fa fa-exclamation-circle"></i>&nbsp;[휴가신청] 메뉴에서 전자결재가 완료(승인) 된 경우, 해당 휴가내역은 수정, 삭제가 불가합니다. 실제사용여부를 미체크 후 재등록하시기 바랍니다.</li>
				<li><i class="fa fa-exclamation-circle"></i>&nbsp;휴가신청시, 각종 휴일을 휴가기간에서 제외하시고자 할 경우, 근태관리&gt; 근태기초정보설정/조회 &gt; [휴일설정] 메뉴에서 해당 일자를 휴일로 지정하시기 바랍니다. </li>
			</ul>
		</div>
	</div> -->
	
		
	</form>