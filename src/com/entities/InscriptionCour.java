package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "inscription_cour")
@Data @NoArgsConstructor @Setter @Getter @ToString
public class InscriptionCour {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "idEtudiant")
	private Etudiant etudiant;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "idCour")
	private Cour cour;
	
	private boolean etat;
}
