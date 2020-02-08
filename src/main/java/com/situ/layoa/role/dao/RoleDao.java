package com.situ.layoa.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;


@Repository
public interface RoleDao {
   void add(Role role);
   
   Role findName(String Name);
   
   Integer getCount();
   
   List<Role> findAllRole(@Param("role")Role role,@Param("firstResult") Integer firstResult, @Param("limit") Integer limit);
   
   void delete(Long rowId);
   
   Role findRole(Long rowId);
   void update(Role role);
}
