package com.dao;

import com.entities.Departement;
import com.entities.InscriptionCour;

public class InscriptionCourRepository extends Repository<InscriptionCour, Long>{

	public InscriptionCourRepository() {
		super(InscriptionCour.class);
	}
}
