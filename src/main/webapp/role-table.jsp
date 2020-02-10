<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<form class="layui-form" lay-filter="form_find" id="form_find">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input name="roleCode" required  placeholder="请输入角色编号"
					autocomplete="off" class="layui-input">
			</div>
			<div class="layui-input-inline">
				<input name="roleName" required  placeholder="请输入角色名称"
					autocomplete="off" class="layui-input">
			</div>

			<button type="button" class="layui-btn layui-btn-normal"
				id="btn_find">查询</button>
			<button type="button" class="layui-btn" id="btn_add">新增角色</button>
		</div>
	</form>

	<table id="demo" lay-filter="test"></table>
</body>

<!-- 自定义模板 1显示超级用户 0普通用户 -->
<script type="text/html" id="userKindTpl">
{{#  if(d.roleKind == 1){ }}
    <span class="layui-badge layui-bg-orange">超级用户</span>
  {{#  } else { }}
    <span class="layui-badge layui-bg-black">普通用户</span>
{{#  } }}
</script>

<!-- 自定义删除修改 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
{{#  if(d.roleKind == 1){ }}
  <a class="layui-btn layui-btn-xs  layui-btn-disabled">删除</a>
 {{#  } else { }}
 <a class="layui-btn layui-btn-xs " lay-event="del">删除</a>
{{#  } }}

  
</script>




<script type="text/javascript" src="assert/layui/layui.js"></script>
<!-- 书写自己的脚本 -->
<script type="text/javascript">
	layui.use([ 'table', 'form' ], function() {
		var table = layui.table;
		var $ = layui.$;
		var form = layui.form;
		
		table.render({
			elem : '#demo' //要绑定的页面元素
			// ,height: 312 //设置高度
			,
			url : 'role/' //数据接口
			,
			page : true //开启分页
			,
			where : $('#form_find').serialize(),
			cols : [ [ //表头
			{
				field : 'rowId',
				title : 'ID',
				width : 180,
				sort : true,
				fixed : 'left'
			}, {
				field : 'roleCode',
				title : '角色编号',
				width : 180
			}, {
				field : 'roleName',
				title : '角色名称',
				width : 180,
				sort : true
			}, {
				field : 'roleKind',
				title : '角色类型',
				width : 180,
				templet : '#userKindTpl'
			}, {
				field : 'roleInfo',
				title : '角色简介',
				width : 177
			}, {
				title : '操作',
				width : 177,
				templet : '#barDemo'
			}
			/*  ,{field: 'experience', title: '积分', width: 80, sort: true}
			  ,{field: 'score', title: '评分', width: 80, sort: true}
			  ,{field: 'classify', title: '职业', width: 80}
			  ,{field: 'wealth', title: '财富', width: 135, sort: true}*/
			] ]
		});

		//监听工具条 
		table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

			if (layEvent === 'del') { //删除
				layer.confirm('确定删除么', function(index) {

					$.ajax({
						url : 'role/' + data.rowId,
						type : 'delete',

						success : function(result) {
							if (result) {
								table.reload('demo');
								
								//obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
								layer.close(index);
							}
						}
					})

				});
			}
			if (layEvent === 'edit') { //修改
				$.ajax({
					url : 'role/edit',
					success : function(htmlData) {
						layer.open({
							type : 1,
							title : '修改用户',
							area : '800px',//设置宽度 ，高度自适应
							content : htmlData,
							success : function() {//layer打开成功后的回调
								$.ajax({
									type : 'get',
									url : 'role/'+data.rowId,
									success : function(role){
										//让form表单渲染一下，
										//给表单赋值
										form.val("form_user",role);
										//新加一个属性 为了修改的时候名字不变不执行唯一校验
										$('#roleName').data('old',role.roleName);
									//	alert($('#roleName').data('old'));
										form.render(null, 'form_user');

									}
								})
								
								
								
								
								
								
							}
						})
					}
				})

				//do something
				//同步更新缓存对应的值
				obj.update({
					username : '123',
					title : 'xxx'
				});
			}
		});
		$('#btn_add').on('click', function() {
			$.ajax({
				url : 'role/goadd',
				success : function(htmlData) {
					layer.open({
						type : 1,
						title : '新增用户',
						area : '800px',//设置宽度 ，高度自适应
						content : htmlData,
						success : function() {//layer打开成功后的回调
							//让form表单渲染一下，
							form.render(null, 'form_user');

						}
					})
				}
			})
		})

		$('#btn_find').on('click', function() {
			
			//查询渲染table数据
			table.reload('demo',{
				page: {
					curr: 1//重新从第一页开始
				}
			,where : $('#form_find').serialize(),
			},'data');
			return false;
			
			
			
		})

	});
</script>



</html>