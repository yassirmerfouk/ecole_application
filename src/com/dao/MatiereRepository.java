package com.dao;

import java.util.List;

import javax.persistence.Query;

import com.entities.Admin;
import com.entities.Matiere;

public class MatiereRepository extends Repository<Matiere, Long>{
	
	public MatiereRepository() {
		super(Matiere.class);
	}
	
	public Matiere findByNom(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT matiere FROM Matiere matiere WHERE matiere.nom = :nom");
		query.setParameter("nom", nom);
		return !query.getResultList().isEmpty() ? (Matiere) query.getResultList().get(0) : null;  
	}
	
	public List<Matiere> findByNomLike(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT matiere FROM Matiere matiere WHERE matiere.nom like :nom");
		query.setParameter("nom", "%" +nom+ "%");
		return (List<Matiere>)query.getResultList();
	}
	
	public List<Matiere> findByIdAndNomLike(Long id,String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT matiere FROM Matiere matiere WHERE matiere.departement.id = :id AND matiere.nom like :nom");
		query.setParameter("id", id);
		query.setParameter("nom", "%" +nom+ "%");
		return (List<Matiere>)query.getResultList();
	}
}
