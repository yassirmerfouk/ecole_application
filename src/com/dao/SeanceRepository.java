package com.dao;

import com.entities.Departement;
import com.entities.Seance;

public class SeanceRepository extends Repository<Seance, Long>{

	public SeanceRepository() {
		super(Seance.class);
	}
}
