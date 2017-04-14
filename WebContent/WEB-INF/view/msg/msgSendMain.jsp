<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src=" https://code.jquery.com/jquery-3.1.1.min.js"></script> 

    
<style>

.root{
margin:auto;
width:100%;
height:800px;
}

.top{
    color: white;
    font-size: 17px;
    width: 1210px;
    height: 65px;
    background-color: gray;
    padding: 20px;
    text-align: center;
    vertical-align: middle;
}

.menu{
    width: 200px;
    height: 800px;
    float: left;
    background-color: #e0e0eb;
    text-align: left;
    font-size: 14px;
}

.menu ul{
text-align:left;
}

.con{
width:75%;
height:800px;
float:left;
background-size:100%100%;
text-align:center;
}

.bottom{
width:100%;
height:65px;
clear:both;
background-color:green;
text-align:center;
}

.employee th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size : 12px;
}

.employee {
	width: 1000px;
    height: 250px;
    margin: 10px;
}

th, td {
    padding: 8px;
    text-align: center;
    border: 1px solid #ddd;
    font-size : 12px;
}

.employee tr:hover{background-color: #ffe6ff}

ul{
   list-style:none;
}




li {
margin: 5px 15px;
}


a:link {
    text-decoration: none;
    
}

.menu a:hover{
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
  -webkit-transition: all 100ms ease-in;
  transition: all 100ms ease-in;
  box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4);
  font-size: 16px;
}






* {
  box-sizing: border-box;
}



.dialog__trigger, .dialog__action {
  border: 2px solid #333333;
  background: #f1f1f1;
  padding: 9px 9px;
  margin: 10px;
  font-size: 0.8rem;
  text-transform: uppercase;
  display: block;
  -webkit-transition: all 150ms ease-out;
  transition: all 150ms ease-out;
  -webkit-transform: translateY(0px);
          transform: translateY(0px);
}
.dialog__trigger:hover, .dialog__action:hover {
  -webkit-transform: translateY(-5px);
          transform: translateY(-5px);
  -webkit-transition: all 100ms ease-in;
  transition: all 100ms ease-in;
  box-shadow: 0 5px 10px rgba(51, 51, 51, 0.4);
}
.dialog__trigger:focus, .dialog__action:focus {
  outline: 0;
}
.dialog__trigger:active, .dialog__action:active {
  -webkit-transform: translateY(-3px);
          transform: translateY(-3px);
}

.dialog {
  background: #f1f1f1;
  width: 600px;
  position: absolute;
  left: calc(50% - 35%);
  top: 0;
  padding: 30px;
  box-shadow: 0 10px 30px rgba(51, 51, 51, 0.4);
  border: 3px solid #333333;
  visibility: hidden;
  opacity: 0;
  -webkit-transition: all 180ms ease-in;
  transition: all 180ms ease-in;
}
@media (max-width: 600px) {
  .dialog {
    width: 90%;
    left: calc(50% - 45%);
  }
}
.dialog.dialog--active {
  top: 10%;
  visibility: visible;
  opacity: 1;
  -webkit-transition: all 250ms ease-out;
  transition: all 250ms ease-out;
}
.dialog .dialog__close {
  font-size: 2rem;
  line-height: 2rem;
  position: absolute;
  right: 15px;
  top: 15px;
  cursor: pointer;
  padding: 15px;
  -webkit-transition: color 150ms ease;
  transition: color 150ms ease;
}
.dialog .dialog__close:hover {
  color: #E74C3C;
}
.dialog .dialog__title {
  font-size: 1.8rem;
  font-family: 'Slabo 25px', serif;
  font-weight: 100;
  margin: 0;
  padding: 0 0 15px 0;
  border-bottom: 2px solid #333333;
}
.dialog .dialog__content {
  font-size: 1.1rem;
  line-height: 2rem;
}
.dialog .dialog__action {
  margin: 0;
  font-size: 1rem;
}



    
</style>

<script type="text/javascript">

function allChk(obj){
    var chkObj = document.getElementsByName("RowCheck");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true; 
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false; 
         }
        }
    }
} 




$(document).ready(function(){
    $(".write").click(function(){
        window.open("/JackPot/msgwrite.jp","쪽지보내기","width=500, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
    });
    
});


function dialog() {

    var dialogBox = $('.dialog'),
        dialogTrigger = $('.dialog__trigger'),
        dialogClose = $('.dialog__close'),
        dialogTitle = $('.dialog__title'),
        dialogContent = $('.dialog__content'),
        dialogAction = $('.dialog__action');

    // Open the dialog
    dialogTrigger.on('click', function(e) {
        dialogBox.toggleClass('dialog--active');
        e.stopPropagation()
    });

    // Close the dialog - click close button
    dialogClose.on('click', function() {
        dialogBox.removeClass('dialog--active');
    });

    // Close the dialog - press escape key // key#27
    $(document).keyup(function(e) {
        if (e.keyCode === 27) {
            dialogBox.removeClass('dialog--active');
        }
    });

 

};

// Run function when the document has loaded
$(function() {
    dialog();
});



function checkIt(){
	var userinput=eval("document.userinput");
	
	
	if(!userinput.msg_title.value){
		alert("제목을 입력하세요.");
		return false;
	}
	
	if(!userinput.msg_receive.value){
		alert("받는사람을 입력하세요.");
		return false;
	}
	
	if(!userinput.msg_content.value){
		alert("내용을 입력하세요.");
		return false;
	}
	
}


function msgfind(){
	 url="msgFind.jp?"
	 open(url, "find" , "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, height=400, width=600");
	}





</script>

<c:if test="${memId==null}" >

로그인 후 이용해 주시기 바랍니다.

<input type="button" onClick="window.location='main.jp'" value="돌아가기"/>

</c:if>


<c:if test="${memId!=null}">

<div class="root">
<div class="top"><b>보낸 쪽지</b></div>
<div class="menu">
<ul>

<li><a href="/JackPot/msgmain.jp">받은 쪽지함</a>
<c:if test="${count==0}"></c:if>
<c:if test="${count!=0}">(${count})</c:if>
</li>
<li><a href="/JackPot/msgsmain.jp">보낸 쪽지함</a></li>
<li>임시 보관함</li>
</ul>


</div>


<div class="con">

<div class="employee">

<form action="msgDel2.jp" method="post" >

<table width="100%" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30"  > 
     <th align="center"  width="20"  > <b><input id="allCheck" type="checkbox" onclick="allChk(this);"/></b></th>
     <th align="center"  width="50"  > <b>분류</b></th> 
      <th align="center"  width="100" ><b>제목</b></th> 
      <th align="center"  width="50" ><b>받는사람</b></th>
      <th align="center"  width="50" ><b>수신여부</b></th>
      <th align="center"  width="100" ><b>일시</b></th>
      
    </tr>


 <c:forEach var="article" items="${articleList}" >
   
    
    <th align="center"  width="20"  > <b><input type="checkbox" name="RowCheck" value="${article.msg_num}" /></b></th>
    <td align="center">${article.msg_cate} </td>
	<td align="center"><a href="/JackPot/msgcont2.jp?msg_num=${article.msg_num}">${article.msg_title}</a></td>	
    <td align="center"  width="50">${article.msg_receive} (${article.msg_rid})</td>
    <td align="center"  width="50">
         <c:if test="${article.ref == 0}">
         읽지않음
         </c:if>
          
         <c:if test="${article.ref == 1}">
         읽음
         </c:if>
         
         </td>
    <td align="center"  width="100"> ${article.msg_read} </td>
  </tr>
  </c:forEach>
</table>
<input type="submit" value="선택 삭제" />
</form>
<center>
<button class="dialog__trigger">쪽지 쓰기</button>
</center>
</div>






</div>


<div class="bottom">하단</div>



</div>

<div class="dialog">
  <span class="dialog__close">&#x2715;</span>
  <h2 class="dialog__title">쪽지보내기</h2>
  <p class="dialog__content">
  
  
  <form action="msgWritePro.jp" name="userinput" method="post">

<table>
<tr>
<td>
<label><input type="radio" name="msg_cate" value="일반" checked="checked" />일반</label>
<label><input type="radio" name="msg_cate" value="공지" />공지</label>
<label><input type="radio" name="msg_cate" value="중요" />중요</label>
<label><input type="radio" name="msg_cate" value="배포" />배포</label>
</td>
</tr> 
<tr>
<td>
제목 <input class="input2" type="text" name="msg_title" placeholder="제목을 입력하세요." />
</td>
</tr>
<tr>
<td>
받는사람 <input class="input2"  type="text" name="msg_receive" placeholder="검색행~" readonly />
<input type="button" value="찾아보기" onClick="msgfind()"/>
</td>
</tr>
<tr>
<td>
<textarea name="msg_content" style="width:450px; height:200px">
</textarea>
</td>
</tr>
</table>
<center>
<input type="submit" value="보내기" />

</center>

</form>
  
  </p>
  
</div>  
</c:if>




