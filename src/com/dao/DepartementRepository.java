package com.dao;

import java.util.List;

import javax.persistence.Query;

import com.entities.Departement;

public class DepartementRepository extends Repository<Departement, Long> {

	public DepartementRepository() {
		super(Departement.class);
	}

	public Departement findByNom(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT departement FROM Departement departement WHERE departement.nom = :nom");
		query.setParameter("nom", nom);
		return !query.getResultList().isEmpty() ? (Departement) query.getResultList().get(0) : null;
	}

	public List<Departement> findByNomLike(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT departement FROM Departement departement WHERE departement.nom like :nom");
		query.setParameter("nom", "%" + nom + "%");
		return (List<Departement>) query.getResultList();
	}
}
