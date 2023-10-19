package com.dao;

import java.util.List;

import javax.persistence.Query;

import com.entities.Etudiant;

public class EtudiantRepository extends Repository<Etudiant, Long>{

	public EtudiantRepository() {
		super(Etudiant.class);
	}
	
	public Etudiant findByEmailAndPassword(String email, String password) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.email = :email AND etudiant.password = :password");
		query.setParameter("email", email);
		query.setParameter("password", password);
		return !query.getResultList().isEmpty() ? (Etudiant) query.getResultList().get(0) : null;  
	}
	
	public List<Etudiant> findByNomLike(String nom) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.nom like :nom");
		query.setParameter("nom", "%" + nom + "%");
		return (List<Etudiant>)query.getResultList();
	}
	
	public List<Etudiant> findByFiliere(String filiere) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.filiere = :filiere");
		query.setParameter("filiere", filiere);
		return (List<Etudiant>)query.getResultList();
	}
	
	public Etudiant findByEmail(String email) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.email = :email");
		query.setParameter("email", email);
		return !query.getResultList().isEmpty() ? (Etudiant) query.getResultList().get(0) : null;  
	}
	
	public Etudiant findByCne(String cne) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.cne = :cne");
		query.setParameter("cne", cne);
		return !query.getResultList().isEmpty() ? (Etudiant) query.getResultList().get(0) : null;  
	}
	
	public Etudiant findByEmailInOthers(Etudiant etudiant,String email) {
		em = emf.createEntityManager();
		Query query = em.createQuery("SELECT etudiant FROM Etudiant etudiant WHERE etudiant.email = :email AND etudiant.id != :id");
		query.setParameter("email", email);
		query.setParameter("id", etudiant.getId());
		return !query.getResultList().isEmpty() ? (Etudiant) query.getResultList().get(0) : null;  
	}
}
