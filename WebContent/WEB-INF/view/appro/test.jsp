<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>        
    <meta charset="UTF-8">        
    <title>Add More Elements</title>        
    <script src="/JackPot/js/jquery-3.1.1.min.js"></script>  
    <script>            
        $(document).ready (function () {                
            $('.btnAdd').click (function () {                                        
                $('.buttons').append (                        
                    '<input type="text" name="txt"> <input type="button" class="btnRemove" value="Remove"><br>'                    
                ); // end append                            
                $('.btnRemove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    $(this).next ().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            }); // end click
            $("#res").on("click", function() {
            	var chk = $("input[name='chk[]']:checked").map(function() {
            		return $(this).val();
            	}).get().join(" , ");
            	$("#result").text(chk);
            });
            
        }); // end ready  
        
   
    </script>    
    </head>    
    <body>        
        <div class="buttons">            
        <input type="text" name="txt"> <input type="button" class="btnAdd" value="Add"><br>        
        </div>  
        
        <input type="checkbox" name="chk[]" value="aaa">aaa
		<input type="checkbox" name="chk[]" value="bbb">bbb
		<input type="checkbox" name="chk[]" value="ccc">ccc
		<input type="button" value="submit" id="res">
		<span id="result"></span>  
    </body>
</html>