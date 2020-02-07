package com.situ.layoa.role.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;



@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public void add(Role role) {
	System.out.println(role);		
		roleDao.add(role);
	}

	@Override
	public Role findName(String Name) {
		
	return	roleDao.findName(Name);
		
	}

}
