<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  

  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  
  <script type="text/javascript">
    
      
  
    function alram_access(){  
        var xmlhttp = getXmlHttpRequest();  
        var url = 'alram_access.jsp';  
        if(url){  
            xmlhttp.open("GET", url, true);  
            xmlhttp.onreadystatechange = function() {  
                if(xmlhttp.readyState == 4) {  
                    if(xmlhttp.status == 200) {  
                        var alram_msg = trim(xmlhttp.responseText);  
                        if(alram_msg!=''){  
                            view_msg(alram_msg);  
                        }  
                    } else {  
                        //alert("Error loading "+url+", "+xmlhttp.status+"("+xmlhttp.statusText+")");  
                    }  
                }  
            }  
            xmlhttp.send(null);  
        }  
        setTimeout("alram_access()", 3000);//3초 마다 서버와 통신함  
        return false;  
    }  
    function view_msg(msg){  
        var width = 350;  
        var height = 150;  
        var left = (document.body.clientWidth-width)/2;  
        var top = (document.body.clientHeight-height)/2;  
        var alram_win = window.open('alram_view.jsp?msg='+msg, '', 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar=no ,directories=no,menubar=no,location=no,scrollbars=no,resizable=yes,status=no');  
    
    
    
  </script>

