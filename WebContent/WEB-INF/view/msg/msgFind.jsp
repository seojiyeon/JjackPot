<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
table {
    border-collapse: collapse;
    width: 100%;
}

.find th, td {
    text-align: left;
    padding: 8px;
     font-size : 12px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>

<html>
<head>
<meta charset="utf-8">
<title>자동완성</title>
<script type="text/javascript" src="js/jquery/lib/jquery.js"></script>
<script type='text/javascript' src='js/jquery/lib/jquery.bgiframe.min.js'></script>
<script type='text/javascript' src='js/jquery/lib/jquery.ajaxQueue.js'></script>
<script type='text/javascript' src='js/jquery/jquery.autocomplete.js'></script>

</head>
<body>



	<script type='text/javascript'>
	
	function add_open(addform){   
		   var temp = $('#' + addform);
		   temp.fadeIn();
		   temp.find('a.add-cbtn').click(function(e){
		      temp.fadeOut();
		      e.preventDefault();
		   });
		   temp.find('a.add-addbtn').click(function(e){
		      temp.fadeOut();
		      $('.layer1-participants').html("<input type=text id=participants readonly value="+idlistname+"></input><input type=hidden name=participants value="+idlist+"></input>")
		      e.preventDefault();
		   })
		   
		}
	
	
	
	
	
	   $(".namelist>li>a").click(function(){
           var namelist = $(this);
           var id = $(this).attr('id');
           var name = $(this).text();
           var name2 = name.substring(0,3);
           var selectedlist = $(".selected-list");
           
           var exist = false;
          for(i = 0 ; i < idlist.length;i++){
             if(idlist[i] == id){
                exist = true;
                break;
             }
          } 
          if(! exist){
             $(".selected-list").append("<li class="+id+"><a href=# onClick=selected_click("+id+")>"+name+"</a></li>");
             idlist.push(id);
             idlistname.push(name2);
          }
           namelist.css("background-color","turquoise");
        });	
	
	   
	   
	    function selected_click(id){
	        var select = id.getAttribute('id');
	        $("."+select).remove();
	        $("#"+select).css("background-color","white");
	        for(i=0;i < idlist.length; i++){
	           if(idlist[i] == select){
	              idlist.splice(i,1);
	              idlistname.splice(i,1);
	           }
	        }
	     }  
	
	
	
	
	</script>

<script>
	

function setId(e)
{		 
	opener.document.userinput.msg_receive.value=e;
	self.close(); 
	}


</script>






<form name="msgFind" method="post" action="msgFind.jp" onSubmit="return checkIt()">
<table width="350" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td align="center"> 
       <b>사원 검색</b>
       
	  <input type="text" id="searchbox" name="id">
	  <input type="submit" id="submit" value="검색">
	       
       
       
    </td></tr></table>
</form>

<a href="#" class="add-btn2" onclick="add_open('participants-Form');return false;">추가</a>

<c:if test="${count==0}">
 
</c:if>

<c:if test="${count!=0}">

<div class="find">
<table> 
     <tr height="30"  > 
     <th align="center"  width="50"  > <b>이름</b></th> 
     <th align="center"  width="100" ><b>사원번호</b></th> 
     <th align="center"  width="50" ><b>부서</b></th>
     <th align="center"  width="50" ></th>
     </tr>
     
      <c:forEach var="article" items="${articleList}" >
   
    <tr>
    <td align="center">${article.emp_name} </td>
	<td align="center" width="50">${article.emp_num} </td>
    <td align="center"  width="100"> ${article.department} </td>
    <td><input type="button" value="선택" onClick="setId('${article.emp_name}')" /></td>
  </tr>
  </c:forEach>
     
          
     </table>
     
    </div>
     
     </c:if>



   <div id="participants-Form">
      <div class="participants-Form-container">
         <div class="participants-Form-top">
         </div>
         <div class="participants-Form-contents">
            <div class="participants-Form-con-tab">
               <ul>
                  <li><a>조직도</a></li>
                  <li><a>주소록</a></li>
                  <li><a>거래처</a></li>
               </ul>
            </div>
            <div class="participants-Form-con-contents">
               <ul>
               <li>
                  <ul>
                     <li class="branchlist"><a href="#" class="강남">강남지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '강남'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>   
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="종로">종로지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '종로'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="동작">동작지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '동작'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="수지">수지지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '수지'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="용인">용인지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '용인'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
                  <ul>
                     <li class="branchlist"><a href="#" class="인천서구">인천서구지점</a>
                        <ul class="namelist">
                        <c:forEach var="participantsDTO" items="${participants}">
                        <c:if test="${participantsDTO.branch eq '인천서구'}">
                         <li><a href="#" id="${participantsDTO.emp_num}">${participantsDTO.emp_name} ${participantsDTO.position} (${participantsDTO.department})</a></li>
                        </c:if></c:forEach>
                        </ul>
                     </li>
                  </ul>
               </li>
               </ul>
            </div>
            <div class="participants-Form-con-selected">
               <ul class="selected-list">
               </ul>
            </div>
         </div>
         <div class="participants-Form-btn">
            <ul>
               <li><a href="#" class="add-cbtn">닫기</a></li>
               <li><a href="#" class="add-addbtn">추가</a></li>
            </ul>
         </div>
      </div>
   </div>




 
</body>
</html>


