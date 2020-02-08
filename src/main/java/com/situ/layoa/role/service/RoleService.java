package com.situ.layoa.role.service;

import java.util.List;

import com.situ.layoa.role.domain.Role;

public interface RoleService {
  void add (Role role);
  
  Role findName(String Name);
  
  Integer getCount();
  
  List<Role> findAllRole(Integer page, Integer limit ,Role role);
  
  void delete(Long rowId);
  
  Role findRole(Long rowId);
  
  void update(Role role);
}
