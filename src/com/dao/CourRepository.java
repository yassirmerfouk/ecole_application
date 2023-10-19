package com.dao;

import java.util.List;

import javax.persistence.Query;

import com.entities.Cour;
import com.entities.Departement;
import com.entities.Matiere;

public class CourRepository extends Repository<Cour, Long>{

	public CourRepository() {
		super(Cour.class);
	}
	
	public List<Cour> findByMatiereId(Long id) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT cour FROM Cour cour WHERE cour.matiere.id = :id");
		query.setParameter("id", id);
		return (List<Cour>)query.getResultList();
	}
	
	public List<Cour> findByNom(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT cour FROM Cour cour WHERE cour.nom like  :nom");
		query.setParameter("nom", "%" + nom +"%");
		return (List<Cour>)query.getResultList();
	}
	
}
