package fr.francis.dao;

import java.util.List;


public interface InterfaceCRUD<T> {
	
	public List<T> findAll() throws Exception;
	
	public T findOneById(T t) throws Exception;
	
	public void insert(T t) throws Exception;
	
	public void update(T t) throws Exception;
	
	public void delete(T t) throws Exception;
	
	public List<T> rechercheParMC(String mc) throws Exception;

}
