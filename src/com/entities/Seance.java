package com.entities;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Data @NoArgsConstructor @Setter @Getter @ToString
public class Seance implements Comparable<Seance>{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String Titre;
	private boolean type;
	private boolean etat;
	@Column(length = 500)
	private String description;
	private LocalDate date;
	private String temps;
	
	@ToString.Exclude
	@ManyToOne
	@JoinColumn(name = "idCour")
	private Cour cour;
	
	@ToString.Exclude
	@ManyToMany(mappedBy = "seances")
	private List<Etudiant> etudiants;

	@Override
	public int compareTo(Seance o) {
		if(this.date.isBefore(o.date)) return -1;
		else if(this.date.isAfter(o.date)) return 1;
		else return 0;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Seance other = (Seance) obj;
		return Objects.equals(id, other.id);
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	
}
