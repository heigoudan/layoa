<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<form class="layui-form" lay-filter="form_user">
		<div class="layui-form-item">
			<label class="layui-form-label">角色编号</label>
			<div class="layui-input-block">
				<input name="roleCode" required lay-verify="required"  
					placeholder="请输入角色编号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称</label>
			<div class="layui-input-inline">
				<input name="roleName" id="roleName"  lay-verify="required|checkstuname" 
					placeholder="请输入角色名称" autocomplete="off" class="layui-input" >
			</div>
		</div>
		

		<div class="layui-form-item">
			<label class="layui-form-label">角色类型</label>
			<div class="layui-input-block">
				<input type="radio" name="roleKind" value="1" title="超级角色"  checked  > <input
					type="radio" name="roleKind" value="0" title="普通角色" >
			</div>
		</div>
		
						
		
		<div class="layui-form-item">
			<label class="layui-form-label">角色简介</label>
			<div class="layui-input-inline">
				<input name="roleInfo" required lay-verify="required" 
					placeholder="请输入角色简介" autocomplete="off" class="layui-input">
			</div>
		</div>
		<input type="hidden" id="rowId" value= "${Role.rowId }" name="rowId">
		
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

<!-- 书写自己的脚本 -->
<script >
	//layui.user 当页面渲染成功后，加载配置的模块
	layui.use([ 'layer', 'form', 'laydate' ], function() {
		
		//通过一个变量将模块取出
		var layer = layui.layer;
		var form = layui.form;
		
		//layui内置jquery
		var $ = layui.$;
		
		//表单的自定义校验
		form.verify({
			checkstuname:function(value,item){//value ,表单的值，item 表单的DOM对象
				var msg ;
				//console.log(item);
			//判断是否需要进行自定义校验  点击修改的时候加了一个属性
			var oldVal =  $(item).data('old');
			
			
			//如果原来的值有数据，并且原值和当前的一样，则不需要进行唯一性校验
			if(oldVal !=null && oldVal == value){
				return msg;
			}else{
			$.ajax({
				type:'get',
				async:false, //为了让layui可以做唯一性的校验，需要将ajax异步提交关闭
				url:'role/checkname',
				data:{"roleName":value},
				success: function(result){
					//判定此名称是否可以使用
					if(result == 0){
						msg = '此名称有人使用';
					}
				}
			});
			return msg;
			}
			}
		});
		
		
		

		//绑定提交按钮
		form.on('submit(formDemo)', function(data) {
			//form.val('filter',object); 表单赋值 取值
			var rowId = $('#rowId').val();
			var fromData = $(data.form).serialize();
			//var date = form.val('form_user');
			//通过使用jQuery的表单序列化
			if(rowId ){
				$.ajax({
					type : 'put',
					url : 'role',
					data : fromData,
					success : function(result) {
						if (result) {
							layer.msg("修改成功了！");
						}
					}
				});
			}else{
				$.ajax({
					type : 'post',
					url : 'role',
					data : fromData,
					success : function(result) {
						if (result) {
							layer.msg("提交成功了！");
						}
					}
				});
			}
			
			
		//关掉弹框
			layer.close(layer.index);
		//重新加载表格数据
		table.reload('demo');
		
			//将按钮自带的提交动作屏蔽掉
			return false;
		});

	});
</script>
</html>