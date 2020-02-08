package com.situ.layoa.role.service.impl;

import java.util.List;

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

	@Override
	public Integer getCount() {
		
	return	roleDao.getCount();	
	}

	@Override
	public List<Role> findAllRole(Integer page, Integer limit ,Role role) {
		// limit查询数据开始的下标
		Integer firstResult = (page - 1) * limit;
	
		return roleDao.findAllRole(role,firstResult,limit);
	}

	@Override
	public void delete(Long rowId) {
		roleDao.delete(rowId);
		
	}

	@Override
	public Role findRole(Long rowId) {
		
	return	roleDao.findRole(rowId);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
		
	}

}
