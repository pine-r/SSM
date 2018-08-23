<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
function popWin(div_id,win_title,win_width,win_height){
	if(div_id==null) return;
	var user_win = $("#"+div_id);	
	var _width = 300,_height = 200,_z_index = 8000,_titleHeight = 26;
	if(document.getElementById(div_id)!=null){
		if(win_width!=null&&win_width!=""){
			_width = win_width;
		}else{
			_width = parseInt(user_win.css("width"));
		}
		if(win_height!=null&&win_height!=""){
			_height = win_height+_titleHeight;
		}else{
			_height = parseInt(user_win.css("height"))+_titleHeight;
		}		
	}else{
		if(win_width!=null) _width = win_width;
		if(win_height!=null) _height = win_height;
		user_win = $("<div id='userwin'><p>"+div_id+"</p></div>").css({
			width:_width,
			height:_height-_titleHeight
		});
	}
	var mks = 0,old_x = 0,old_y = 0;
	var _doc = document.documentElement;
	
	win_title==null&&(win_title="消息");
	var _left =($(document).width()-_width)/2;
	var _top =(_doc.clientHeight-_height)/2;
	var _win = $('<div id="popwin"><div id="title">&nbsp;&nbsp;'+win_title+'<div id="close">×</div></div></div>').appendTo("body").css({
		position:"absolute",
		left:_left,top:_top,
		display:"block",
		"z-index":_z_index+100,
		border:"1px solid #CCC",
		background:"#eee"
	});
	var _title = $("#title").css({		
		background:"#00e", 
		color:"#fff",
		display:"block", 
		"line-height":_titleHeight+"px",
	});
	var _close = $("#close").css({
		"float":"right",
		"line-height":(_titleHeight-2)+"px", 
		background:"#aaa",
		color:"#000",
		padding:"0 6px",
		cursor:"default",
		border:"1px solid #eee"
	});	
	_title.mousedown(function(mouse){
		mks = 1;
		_title.css({cursor:"move"});
		old_x = mouse.pageX-parseInt(_win.css("left"));
		old_y = mouse.pageY-parseInt(_win.css("top"));
		_win.css({"z-index":_z_index+110}).fadeTo(50,.7);
	});
	$(document).mouseup(function(){
		if(mks){
			mks = 0;
			_title.css({cursor:""});
			_win.css({"z-index":_z_index+100}).fadeTo("fast",1);
		}
	});
	$(document).mousemove(function(mouse){
		if(mks){
			var new_x=Math.min(_doc.clientWidth-_width-5,mouse.pageX-old_x);		
			3>new_x&&(new_x=3);			
			var new_y=Math.min(_doc.clientHeight-_height-5,mouse.pageY-old_y);
			3>new_y&&(new_y=3);
			_win.css({top:new_y,left:new_x});
		}
	});
	_close.on("click",function(){
		win_close();
	});
	$('<div id="maskLayer"></div>').appendTo("body").css({
		background:"#666",
		opacity:".6",
		top:0,left:0,
		position:"absolute",
		zIndex:_z_index
	});
	$(document).keydown(function(key){
		27==key.keyCode&&(win_close())
	});
	var win_close = function(){
		if(document.getElementById(div_id)!=null){
			user_win.appendTo("body").hide();
		}
		_win.remove();
		$("#maskLayer").remove();
	}
	var ml = _doc?_doc:document.body;
	var	ml_h = ml.scrollHeight>ml.clientHeight?ml.scrollHeight:ml.clientHeight;
	var	ml_w = ml.scrollWidth>ml.clientWidth?ml.scrollWidth:ml.clientWidth;
	$("#maskLayer").css({height:ml_h,width:ml_w});
	user_win.appendTo(_win).css({display:"block"});
	_win.css({height:_height,width:_width});
}
</script>

<title>DIV弹出窗口演示</title>
</head>
<body>
	<p>弹出窗口可输出指定文本或指定div。窗口弹出居中；"Esc"和窗口右上角按钮可关闭窗口；按住标题栏可拖动窗口。</p>
	<input type="button" value="输出文本，默认大小" onclick="popWin('这是随意输入的文本','这是标题')">
	<input type="button" value="输出指定DIV，自适应大小" onclick="popWin('这是div_id')">
	<input type="button" value="带标题的，指定高度" onclick="popWin('这是div_id','这是标题',null,200)">
	<input type="button" value="指定大小的" onclick="popWin('这是div_id','这是标题',400,200)">
	
	<div id="这是div_id" style="display: none">
	AAAAAAAAAAAAAAAAAAAA
	</div>
</html>

</body>
