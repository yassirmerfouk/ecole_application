package com.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name= "etudiants")
@Data @NoArgsConstructor @Setter @Getter @ToString
public class Etudiant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(unique=true)
	private String cne;
	private String filiere;
	private String niveau;
	private String nom;
	private String prenom;
	@Column(unique = true)
	private String email;
	private String password;
	private boolean etat = true;
	private String image;
	private String telephone;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "tuteur", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Cour> coursTuteure;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "etudiant", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<InscriptionCour> inscriptionCours;
	
	@ToString.Exclude
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "etudiant_seance",
	joinColumns = @JoinColumn(name="idEtudiant"),
	inverseJoinColumns  = @JoinColumn(name="idSeance")
	)
	private List<Seance> seances;

}
