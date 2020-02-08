package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.situ.layoa.layResult.domain.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;
import com.situ.layoa.util.PageUtils;


@RestController
@RequestMapping("/role")
public class RoleController implements Serializable{
	

		private static final long serialVersionUID = 1L;
		@Autowired
		private RoleService roleService;
		
		
		@PostMapping
		public Long  add(Role role) {
			roleService.add(role);
			return 1L;
		}
		@GetMapping("/checkname")
		public Integer  checkName(String roleName) {

			Role role = roleService.findName(roleName);
			
			int y = role != null ? 0 : 1;
			
			return y;
		}
		@DeleteMapping("/{rowId}")
		public Integer delete(@PathVariable Long rowId) {
			roleService.delete(rowId);
			return 1;
		}
		@PutMapping
		public Integer update (Role role) {
			roleService.update(role);
			return 1;
		}
		
		
		@GetMapping("/{page}/{limit}")
		public LayResult findAllUser( @PathVariable Integer page, @PathVariable Integer limit,Role role) {
			System.out.println(role);
			//把搜索传过来的"" 转换为null  mapper文件就不用判断为""了
			role = PageUtils.buildSearchParam(role);
			System.out.println(role);
			//查询出表中数据的数量
			Integer count = roleService.getCount();
			//进行了分页
			List<Role> userList = roleService.findAllRole(page,limit,role);
			
			return new LayResult(0,"",count,userList);
		}
	}

