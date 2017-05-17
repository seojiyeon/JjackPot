<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<% 
SimpleDateFormat sf = new SimpleDateFormat("hh:mm:ss");
Date date = new Date();
	out.println(sf.format(date));
%> 