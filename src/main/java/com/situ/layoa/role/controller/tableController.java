package com.situ.layoa.role.controller;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.layResult.domain.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@RestController
public class tableController implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	@Autowired
	private RoleService roleService;



	
	
	@GetMapping("role/goadd")
	public ModelAndView goAdd(ModelAndView modelAndView) {
		modelAndView.setViewName("/role-add");
		return modelAndView;
	}
	
	@GetMapping("role/edit/{rowId}")
	public ModelAndView edit(ModelAndView modelAndView,@PathVariable Long rowId) {
		modelAndView.addObject("Role",roleService.findRole(rowId) );
		modelAndView.setViewName("/role-add");
		return modelAndView;
	}
}
