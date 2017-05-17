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



  



 
</body>
</html>


