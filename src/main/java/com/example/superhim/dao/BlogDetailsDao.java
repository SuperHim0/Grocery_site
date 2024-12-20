package com.example.superhim.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.superhim.pojo.BlogDetailsPojo;

public interface BlogDetailsDao extends CrudRepository<BlogDetailsPojo, Integer>{
	
	@Override
	public <S extends BlogDetailsPojo> S save(S entity) ;

	@Query(value = "select * from blogdetail", nativeQuery = true)
	public List<BlogDetailsPojo> readBlog();
	
	
}
