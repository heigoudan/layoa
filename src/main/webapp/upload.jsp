<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- 引入layui的样式表 -->
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
<button type="button" class="layui-btn" id="test1">
  <i class="layui-icon">&#xe67c;</i>上传图片
</button>
<!-- 此处隐藏域保存上传文件成功后的返回的文件路径 -->
<input type="hidden" name="stuImg" id="stuImg"/>
<input type="hidden" id="rowId" value= "35">


</body>
<script type="text/javascript" src="assert/layui/layui.js"></script>
<script type="text/javascript" >

layui.use('upload', function(){
	  var upload = layui.upload;
	  var $ =layui.$;
	   
	  //执行实例
	  var uploadInst = upload.render({
	    elem: '#test1' //绑定元素
	    ,
	    url: 'upload/' //上传接口
	    ,
	    field:'uploadFile' //设定文件域的字段名
	    ,
	    data : {"id":function(){
	    	return $('#rowId').val(); //上传的额外参数(可选)
	    }}
	    ,
	    done: function(res){ //相当于success
	      console.log(res.data);
	    //将上传成功返回的文件路径 赋值到隐藏域
	    $('#stuImg').val(res.data);
	    }
	    ,
	    error: function(){
	      //请求异常回调
	    }
	  });
	});


</script>
</html>