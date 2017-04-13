<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
					<c:if test="${count == 0 }">
						<th style="text-align:center;"><label>출근기록이 없습니다</label></th>
					</c:if>
					<c:if test="${count > 0 }">
						<c:forEach var="wdto" items="${monthsh}" >	
							<td style="text-align:center;height: 30px;"><label>${month.format(wdto.work_on)}</label></td>		
    						<td name="emplMgntNo" style="text-align:center;">${wdto.emp_num}</td>
							<td style="text-align:center;height: 30px;"><label >${sys.format(wdto.work_on)}</label></td>
							<td style="text-align:center;"><label >${sys.format(wdto.work_off)}</label></td>
							<td style="text-align:center;"><label >{wdto.work_time}</label></td>
							<td style="text-align:center;"><label >${wdto.h_work}</label></td>
							<td style="text-align:center;"><label >${wdto.workOut}</label></td>
							<td style="text-align:center;"><label >${wdto.lateNess}</label></td>
							<td style="text-align:center;"><label>${wdto.early}</label></td>
							<td style="text-align:center;"><label >${wdto.ip}</label></td>	

					</c:forEach>
				</c:if>