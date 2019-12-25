var websocket;
var wsUri = "ws://localhost:8080";
var ls_pre = document.getElementsByClassName('chats')[0];

function isJson(str)
{
    try
    {
    JSON.parse(str);
    }
    catch (e)
    {
    return false;
    }
    return true;
}



function AppendMessage(obj){
    
    ////console.log(obj);
    var node = document.createElement("LI");                 // Create a <li> node
    var textnode = document.createTextNode(obj===null?" ":JSON.stringify(obj));         // Create a text node
    node.appendChild(textnode);                              // Append the text to <li>
    document.getElementById("myList").appendChild(node);     // Append <li> to <ul> with id="myList"
}
function doSend(message)
{
    AppendMessage(message.data);
    websocket.send(message);
}

function onOpen(evt){
   /// alert(evt);
}

function onClose(evt){
    ////alert(evt);
}

function onClose(evt){
  ////  alert(evt);
}

function onMessage(message){
    console.log('received: '+ message);
    if(isJson(message.data))
    {
        var obj = JSON.parse(message.data);
        console.log("changing slide to "+ obj.indexh);
        isChangedByMe = false;
        Reveal.slide( obj.indexh, obj.indexv);
        AppendMessage(obj);
    }
    else{
        AppendMessage("no es mensjae");
    }
}

function onError(evt){
   //// alert(evt);
}




function initSocket(){
   websocket = new WebSocket(wsUri);
   websocket.onopen = onOpen;
   websocket.onclose = onClose;
   websocket.onmessage = onMessage;
   websocket.onerror = onError;
  //// alert('load socket sever');
}


window.addEventListener('load', initSocket());


const send = document.getElementById('send');send.addEventListener('click', function(){
      var text = document.getElementById('msg').value;
      doSend(text);
});