<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>회원 목록..!!</h2>

<table border="1">
	<tr> <td>id</td><td>pw</td></tr>
	<c:forEach var="dto" items="${list}">
		<tr> <td>${dto.id}</td><td>${dto.pw}</td></tr>
	</c:forEach>
</table>
	