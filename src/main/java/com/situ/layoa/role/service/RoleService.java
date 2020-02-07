package com.situ.layoa.role.service;

import com.situ.layoa.role.domain.Role;

public interface RoleService {
  void add (Role role);
  
  Role findName(String Name);
}
