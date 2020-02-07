<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>layui</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- 引入layui的样式表 -->
<link rel="stylesheet" href="assert/layui/css/layui.css">
</head>
<body>
	<form class="layui-form" lay-filter="form_user">
		<div class="layui-form-item">
			<label class="layui-form-label">学生名称</label>
			<div class="layui-input-block">
				<input name="stuName" required lay-verify="required|checkstuname"
					placeholder="请输入学生名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生年龄</label>
			<div class="layui-input-inline">
				<input name="stuAge" required lay-verify="required"
					placeholder="请输入学生年龄" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生生日</label>
			<div class="layui-input-inline">
				<input name="stuBirthday" id="stuBirthday" required
					lay-verify="required" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">学生性别</label>
			<div class="layui-input-block">
				<input type="radio" name="stuSex" value="1" title="男"> <input
					type="radio" name="stuSex" value="0" title="女" checked>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">学生爱好</label>
			<div class="layui-input-block">
				<input type="checkbox" name="stuLikes" value="写作" title="写作"> 
				<input type="checkbox" name="stuLikes" value="阅读" title="阅读" checked>
				<input type="checkbox" name="stuLikes" value="打游戏" title="打游戏">
			</div>
		</div>
		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交<tton>
				<button type="reset" class="layui-btn layui-btn-primary">重置<tton>
			</div>
		</div>
		



	</form>
</body>
<!-- 按模块开发
layui.all.js 全部加载模块
layui.js 按需加载模块
 -->
<script type="text/javascript" src="assert/layui/layui.js"></script>
<!-- 书写自己的脚本 -->
<script type="text/javascript">
	//layui.user 当页面渲染成功后，加载配置的模块
	layui.use([ 'layer', 'form', 'laydate' ], function() {
		
		//通过一个变量将模块取出
		var layer = layui.layer;
		var form = layui.form;
		var laydate = layui.laydate;
		//layui内置jquery
		var $ = layui.$;
		//layer.msg('Hello world');
		//渲染日历
		laydate.render({
			elem : '#stuBirthday'//指定元素
		});
		//表单的自定义校验
		form.verify({
			checkstuname:function(value,item){//value ,表单的值，item 表单的DOM对象
				var msg ;
			console.log(1);
			$.ajax({
				type:'get',
				async:false, //为了让layui可以做唯一性的校验，需要将ajax异步提交关闭
				url:'student/checkname',
				data:{"stuName":value},
				success: function(result){
					//判定此名称是否可以使用
					if(result == 0){
						msg = '此名称有人使用';
					}
				}
			});
			return msg;
				
			}
		});
		
		
		

		//绑定提交按钮
		form.on('submit(formDemo)', function(data) {
			//form.val('filter',object); 表单赋值 取值
			
			//var date = form.val('form_user');
			//通过使用jQuery的表单序列化
			var fromData = $(data.form).serialize();
			console.log(fromData);
			$.ajax({
				type : 'post',
				url : 'student',
				data : fromData,
				success : function(result) {
					if (result) {
						layer.msg("提交成功了！");
					}
				}
			});
			//将按钮自带的提交动作屏蔽掉
			return false;
		});

	});
</script>
</html>