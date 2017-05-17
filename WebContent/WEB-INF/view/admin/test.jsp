<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="jquery-3.1.1.min.js" ></script>
<script type="text/javascript" src="js/jquery.min.js"></script>

<script type="text/javascript" >    
    $(document).ready(function () {      
     $('#resultTable tr').click(function (event) {
          alert($(this).attr('id')); //trying to alert id of the clicked row          

     });
 });
        
</script>    
    
    
    
    <table id="resultTable" border="1">
 <tr id="first">
  <td>c1</td>      
  <td>c2</td>      
 </tr>
 <tr id="second">
  <td>c3</td>      
  <td>c4</td>      
  </tr>    
</table>