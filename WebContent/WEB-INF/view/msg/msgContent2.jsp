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
color:white;
width:1210px;
height:65px;
background-color:gray;
text-align:center;
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

.employee th {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size : 12px;
    background-color: #d1e0e0;
}

.employee td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    font-size : 12px;
    background-color: #d1e0e0;
}

.cont {
background-color: #f2f2f2;
    height: 300px;
    text-align: initial;
    font-size: 14px;
    margin: auto;
    padding: 20px;

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



ul{
   list-style:none;
}




li {
margin: 5px 15px;
}


a:link {
    text-decoration: none;
    
}

a:hover{
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


.tn {
background-color: #669900;
}
    
</style>

<script type="text/javascript">

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


</script>

<c:if test="${memId==null}" >

로그인 후 이용해 주시기 바랍니다.

<input type="button" onClick="window.location='main.jp'" value="돌아가기"/>

</c:if>


<c:if test="${memId!=null}">

<div class="root">
<div class="top">쪽지</div>
<div class="menu">
<ul>

<li><a href="/JackPot/msgmain.jp">받은 쪽지함</a></li>
<li><a href="/JackPot/msgsmain.jp">보낸 쪽지함</a></li>
<li>임시 보관함</li>
</ul>


</div>


<div class="con">

<div class="employee">

<table  cellpadding="0" cellspacing="0"> 
    <tr height="30"  > 
     <th align="center"  width="50"  > <b>제목</b></th> 
     <td align="left"  width="950" ><span class="tn">${cDTO.msg_title}</span></th>
    </tr>
    
    <tr height="30"  >
    <th align="center"  width="50"  > <b>분류</b></th> 
     <td align="left"  width="100" ><b>${cDTO.msg_cate}</b></th>
    </tr>
    
    <tr height="30"  > 
    <th align="center"  width="50"  > <b>보낸사람</b></th> 
     <td align="left"  width="100" ><b>${cDTO.msg_send}</b></th>
    </tr>
    
    <tr height="30"  > 
    <th align="center"  width="50"  > <b>받는사람</b></th> 
     <td align="left"  width="100" ><b>${cDTO.msg_receive}</b></th>
    </tr> 

     
      
    
   
    </table>
<div class="cont">
 ${cDTO.msg_content} 
</div>
<input type="button" value="목록으로" onClick="window.location='msgsmain.jp'" />
</div>

</div>


<div class="bottom">하단</div>



</div>


</c:if>




