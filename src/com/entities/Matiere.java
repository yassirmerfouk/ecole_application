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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "matieres")
@Data @NoArgsConstructor @Setter @Getter @ToString
public class Matiere {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(unique = true)
	private String nom;
	@Column(length = 500)
	private String description;
	private String image;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "idDepartement")
	private Departement departement;
	
	@ToString.Exclude
	@OneToMany(mappedBy = "matiere",cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Cour> cours;
}
