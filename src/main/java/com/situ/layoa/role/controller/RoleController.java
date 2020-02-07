package com.situ.layoa.role.controller;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

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
		
	}

