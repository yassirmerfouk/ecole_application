package com.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class Repository<T, U> {
	public static EntityManagerFactory emf;
	protected EntityManager em;
	private Class<T> classof;

	public Repository(Class<T> classof) {
		if(emf == null)
			emf = Persistence.createEntityManagerFactory("ecole");
		this.classof = classof;
	}
	
	public void save(T obj) {
		em = emf.createEntityManager();
		EntityTransaction tr = em.getTransaction();
		try {
			tr.begin();
			em.persist(obj);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
		}
	}

	public void update(T obj) {
		em = emf.createEntityManager();
		EntityTransaction tr = em.getTransaction();
		try {
			tr.begin();
			em.merge(obj);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
		}
	}

	public void delete(T obj) {
		em = emf.createEntityManager();
		obj = em.merge(obj);
		EntityTransaction tr = em.getTransaction();
		try {
			tr.begin();
			em.remove(obj);
			tr.commit();
		} catch (Exception e) {
			tr.rollback();
		}
	}

	public T find(U pk) {
		em = emf.createEntityManager();
		return em.find(classof, pk);
	}

	public List<T> findAll() {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT ob FROM " + classof.getSimpleName() + " ob");
		return query.getResultList();
	}
}
