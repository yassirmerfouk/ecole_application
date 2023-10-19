package com.dao;

import javax.persistence.Query;

import com.entities.Admin;

public class AdminRepository extends Repository<Admin, Long>{

	public AdminRepository() {
		super(Admin.class);
	}
	
	public Admin findByEmailAndPassword(String email, String password) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT admin FROM Admin admin WHERE admin.email = :email AND admin.password = :password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		return !query.getResultList().isEmpty() ? (Admin) query.getResultList().get(0) : null;  
	}
	
	public Admin findByEmailInOthers(Admin admin,String email) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT admin FROM Admin admin WHERE admin.email = :email AND admin.id != :id");
		query.setParameter("email", email);
		query.setParameter("id", admin.getId());
		return !query.getResultList().isEmpty() ? (Admin) query.getResultList().get(0) : null;  
	}
}
