<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        

					<c:if test="${wdto.work_on == null}">
						<th colspan="8" style="text-align: center;background-color: white;"><label>출근기록이 없습니다</label></th>
					</c:if>
					
					<c:if test="${wdto.work_on != null}">	
						
							<td  style="width: 105px;text-align:center;">${wdto.emp_num}</td>
							<td style="width: 105px;text-align:center;"><label >${sys.format(wdto.work_on)}</label></td>
							<td style="width: 105px; text-align:center;"><label >
								<c:if test="${wdto.work_off == null }"><label >00:00</label></c:if>
								<c:if test="${wdto.work_off != null }"><label >${sys.format(wdto.work_off)}</label></c:if></td>
							<td style="width: 105px;text-align:center;"><label >${wdto.work_time}</label></td>
							<td style="width: 105px;text-align:center;"><label >${wdto.workOut}</label></td>
							<td style="width: 105px;text-align:center;"><label >${wdto.lateNess}</label></td>
							<td style="width: 105px;text-align:center;"><label >${wdto.early}</label></td>
							<td style="width: 130px;text-align:center;"><label>${wdto.ip}</label></td>	
				</c:if>