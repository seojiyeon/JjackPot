<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <h2>form</h2>
    
    <form action="formPro.jp" method="post" enctype="multipart/form-data">
    	id   <input type="text" name="id" /><br />
    	pw 	 <input type="text" name="pw" /><br />
    	file <input type="file" name="save" /> <br />
    		 <input type="submit" value="전송" /><br />
    </form>