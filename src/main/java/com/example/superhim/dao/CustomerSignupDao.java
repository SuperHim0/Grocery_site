package com.example.superhim.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.superhim.pojo.SignUpPojo;

public interface CustomerSignupDao extends CrudRepository<SignUpPojo, Integer> {

	@Query(value = "select count(*) as count from signup where mobile=:mobile" ,nativeQuery = true)
	public int userMobileCheck(@Param("mobile") String mobile);
	

	@Query(value = "select count(*) as count from signup where email=:email" ,nativeQuery = true)
	public int userEmailCheck(@Param("email") String email);
	
	
	@Override
	public <S extends SignUpPojo> S save(S entity);
	
//	 @Query(value = "select count(*) from adminlogin where username=:username and password=:password" , nativeQuery = true)
	
	@Query(value = "select count(*) as count from signup where email=:email and password=:password" ,nativeQuery = true)
	public int CustomerLoginCheck(@Param("email") String mobile,@Param("password") String password);

	@Query(value = "select * from signup where mobile=:mobile and password=:password" ,nativeQuery = true)
	public List<SignUpPojo> GetUserData (@Param("mobile") String mobile,@Param("password") String password);

	@Query(value = "select * from signup where email=:email and password=:password" ,nativeQuery = true)
	public List<SignUpPojo> GetUserDataEmail (@Param("email") String mobile,@Param("password") String password);
	
	
}
