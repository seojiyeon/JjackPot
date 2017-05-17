<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Comet demo</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="prototype.js"></script>
  </head>
  <body>

<div id="content">
</div>

<script type="text/javascript">
name = prompt('이름 입력');

function doit(text){
	comet.doRequest(name,text.value);
}

var Comet = Class.create();
Comet.prototype = {

  timestamp: 0,
  url: './backend.php',
  noerror: true,

  initialize: function() { },
  connect: function()  {
    this.ajax = new Ajax.Request(this.url, {
      method: 'POST',
      parameters: { 'timestamp' : this.timestamp },
      onSuccess: function(transport) {
        // handle the server response
        var response = transport.responseText.evalJSON();
        this.comet.timestamp = response['timestamp'];
        this.comet.handleResponse(response);
        this.comet.noerror = true;
		$('word').value=''; // 전송완료후 input값 비우기
      },
      onComplete: function(transport) {
        // send a new ajax request when this request is finished
        if (!this.comet.noerror)
          // if a connection problem occurs, try to reconnect each 6 seconds
          setTimeout(function(){ comet.connect() }, 6000); 
        else
          this.comet.connect();
        this.comet.noerror = false;
      }
    });
    this.ajax.comet = this;
  },

  disconnect: function() {
  },

  handleResponse: function(response) {
    $('content').innerHTML += '<div>'+ response['msgs'] + ' </div>';
  },

  doRequest: function(name,msgs) {
    new Ajax.Request(this.url, {
      method: 'POST',
      parameters: { 'name' : name , 'msgs' : msgs }
    });
  }
}

var comet = new Comet();
comet.connect();

</script>

<p>
  <form action="" name=test method="POST" onsubmit="doit( $('word') );return false;">
    <input type="text" name="word" id="word" value="" autocomplete=off />
    <input type="submit" name="submit" value="Send" />
  </form>
</p>

</body>
</html>