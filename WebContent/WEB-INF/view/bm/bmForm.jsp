<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="/js/calendar.js"></script>

<script type="text/javascript">

selectTodoViewPopup = function(){
        var url = "/groupware/todo/selectTodoViewPopup.do";
        spro.showModalFrame(url,"",function(result){
        	 var chkids = result.chkid;
        	 var chkTitles = result.chkTitle;

             var $vList  = $("#addTask").children("ul").children("li");
             var vLength = $vList.length;
             var vIdList = [];
             
             for(var i = 0; i < vLength; i++){
                 vIdList.push($vList.eq(i).attr("id"));
             }

             var htmlTag  =  '';
             htmlTag += '<ul>';
             for(var i = 0; i < chkids.length; i++){
                 if(vIdList.toString().indexOf(chkids[i]) > -1){
                 } else {
                     htmlTag += '<li id="' + chkids[i] + '">' + chkTitles[i] + '<a herf="#a" onClick="javascript:cancelSelect('+chkids[i]+')"> <i class="icon del2"></i></a></li>';
                 }
             }
             
             htmlTag += '</ul>';
        	$("#addTask").append(htmlTag);
        },
        {title:'관련업무 추가', width:800, height:650});
    };

    cancelSelect = function(taskId){
    	$("#"+taskId).remove();
    });
    )
</script>
	


<div >
	<table >
		<tbody>
			<tr>
				<th scope="row"><span class="text-point-b">*</span>제목</th>
					<td>
						<div>
							<input type="text" title="제목" name="title" class="form-control" placeholder="제목을 입력하세요.">
                        </div>
					</td>
				</tr>
				
				<tr>
					<th scope="row"><span >*</span>업무형태</th>
						<td>
							<div >
								<label ><input type="radio" class="fnone" id="type0" name="taskType" title="나의 할 일" value="0"> 나의 할 일</label>
								<label ><input type="radio" class="fnone" id="type1" checked="checked" name="taskType" title="업무 요청" value="1"> 업무 요청</label>
                                <label ><input type="radio" class="fnone" id="type2" name="taskType" title="업무 보고" value="2"> 업무 보고</label>
                                <label ><input type="radio" class="fnone" id="type3" name="taskType" title="업무 일지" value="3"> 업무 일지</label>
                             </div>
                        </td>
                    </tr>
                    
                    <tr id="isTermlessTR">
                    	<th scope="row"><span class="text-point-b">*</span>업무기한</th>
							<td>
								<input type="text" title="업무기한" id="dueDateCalendar" name="dueDateCalendar" value="${date} " readonly="readonly" class="input-datepicker w100" data-date-format="yyyy.mm.dd" placeholder="yyyy.mm.dd">
                                <button type="button" id="dueDateCalendarBtn" class="btn btn-color7 br tbl-inner"><i class="icon calendar"></i></button>
                                <div class="timepicker-wrap blind">
                                <div class="input-group bootstrap-timepicker"><div class="bootstrap-timepicker-widget dropdown-menu"><table><tbody><tr><td><a href="#" data-action="incrementHour"><i class="fa fa-chevron-up"></i></a></td><td class="separator">&nbsp;</td><td><a href="#" data-action="incrementMinute"><i class="fa fa-chevron-up"></i></a></td></tr><tr><td><input type="text" class="form-control bootstrap-timepicker-hour" maxlength="2"></td> <td class="separator">:</td><td><input type="text" class="form-control bootstrap-timepicker-minute" maxlength="2"></td> </tr><tr><td><a href="#" data-action="decrementHour"><i class="fa fa-chevron-down"></i></a></td><td class="separator"></td><td><a href="#" data-action="decrementMinute"><i class="fa fa-chevron-down"></i></a></td></tr></tbody></table></div>
								<input type="text" title="시간" name="timepicker" readonly="readonly" class="input-timepicker" placeholder="h:mm">
                                <a href="javascript:void(0);" class="btn input-group-addon btn-color5 br">
                                	<i class="fa fa-clock-o"></i>
								</a>
                                </div>
                                </div>
								<span class="label-group ml10">
                                	<input type="checkbox" id="isTermless" title="기한없음" name="isTermless" value="0"><label>기한없음</label>
                                </span>
                            </td>
                        </tr>
                        <tr id="workerTR">
                            <th id="workerTH1" scope="row"><span class="text-point-b">*</span>담당자</th>
                            <th id="workerTH2" scope="row" style="display:none;"><span class="text-point-b">*</span>수신자</th>
                            <td>
                                <div id="selectUser1" class="input-group organization"><div id="selectUser1_div" class="tagsinput"><input type="text" title="사용자" id="selectUser1_input" placeholder="사용자" style="box-shadow:none;"></div><a href="#a" title="사용자" class="btn input-group-addon btn-color5 br"><i class="icon man-plus"></i><span class="none">사용자</span></a></div>
                            </td>
                        </tr>
                        <tr id="worker2TR">
                            <th scope="row">참조자</th>
                            <td>
                                <div id="selectUser2" class="input-group organization"><div id="selectUser2_div" class="tagsinput"><input type="text" title="사용자" id="selectUser2_input" placeholder="사용자" style="box-shadow:none;"></div><a href="#a" title="사용자" class="btn input-group-addon btn-color5 br"><i class="icon man-plus"></i><span class="none">사용자</span></a></div>
                            </td>
                        </tr>
                        <tr id="alarmTR">
                            <th scope="row">등록 알림</th>
                            <td>
                                <input name="alarmType0" type="checkbox" title="메일 발송" value="1"> 메일 발송&nbsp;&nbsp;
                                <input name="alarmType1" type="checkbox" title="쪽지 발송" value="2"> 쪽지 발송&nbsp;&nbsp;
                                <input name="alarmType2" type="checkbox" title="푸시 발송 " value="3"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr id="rAlarmTR">
                            <th scope="row">완료 알림</th>
                            <td>
                                <input name="isMailNotice" type="checkbox" title="메일 발송" value="0"> 메일 발송&nbsp;&nbsp;
                                <input name="isMessageNotice" type="checkbox" title="쪽지 발송" value="0"> 쪽지 발송&nbsp;&nbsp;
                                <input name="isMobileNotice" type="checkbox" title="푸시 발송 " value="0"> 푸시 발송 &nbsp;&nbsp;
                            </td>
                        </tr>
                        
                        <tr id="folderTR">
                            <th scope="row"><label for="folderId">업무 보관함</label></th>
                            <td>
                               <c:forEach var="wdto" items="${monthsh}" >	
                            	<select name="folderId" id="folderId" class="w400" style="">
									<option value="" selected="selected">선택안함</option>
                                    <option value="7902402">프로젝트</option>
                                    <option value="7902408"> 회식장소</option>
                                 </select>
                                 </c:forEach>
                            </td>
                        </tr>
                      
                        <tr id="categoryTR3">
                            <th scope="row"><label for="docId">관련업무</label></th>
                            <td>
                                <button type="button" class="btn btn-color7 br" onclick="javascript:selectTodoViewPopup();">관련업무 추가</button>
                                <div id="addTask"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>