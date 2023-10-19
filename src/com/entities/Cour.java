package com.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="cours")
@Data @NoArgsConstructor @Setter @Getter @ToString
public class Cour {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nom;
	@Column(length = 500)
	private String description;
	private String image;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "idMatiere")
	private Matiere matiere;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name="idEtudiant")
	private Etudiant tuteur;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "cour", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Seance> seances;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "cour", cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<InscriptionCour> inscriptionCours;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "cour",cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Document> documents;

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cour other = (Cour) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
}
