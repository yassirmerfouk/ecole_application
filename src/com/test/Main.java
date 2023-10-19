package com.test;

import javax.persistence.EntityManagerFactory;

import javax.persistence.Persistence;

import com.dao.AdminRepository;
import com.entities.Admin;

public class Main {

	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("ecole");
		AdminRepository adminRepository = new AdminRepository();
//		Admin admin = adminRepository.find(1L);
//		System.out.println(admin);
//		System.out.println(admin);
//		adminRepository.save(new Admin(null, "yassirmerfouk1", "yassirmerfouk111@gmail.com", "123456"));
//		adminRepository.save(new Admin(null, "yassirmerfouk2", "yassirmerfouk222@gmail.com", "123456"));
//		adminRepository.delete(admin);
//		adminRepository.findAll().stream().forEach(e -> System.out.println(e));
		System.out.println(adminRepository.findByEmailAndPassword("yassirmerfouk111@gmail.com",  "1234"));
		System.out.println(adminRepository.findByEmailAndPassword("yassirmerfouk111@gmail.com",  "123456"));
	}
}
