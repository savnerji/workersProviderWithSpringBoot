package com.serviceProvider.DAO;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.serviceProvider.Entities.User;

public interface UserReposiritery extends CrudRepository<User, Integer> {

	public User findByEmail(String email);
	
	
	@Query("FROM User U WHERE U.email=:eml and U.Password=:pass")
	public User getUserByEmail_Password(@Param("eml") String email ,@Param("pass") String password);
	
}
