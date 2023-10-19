package com.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.context.ApplicationContext;

import com.config.Config;
import com.dao.AdminRepository;
import com.dao.CourRepository;
import com.dao.DepartementRepository;
import com.dao.EtudiantRepository;
import com.dao.InscriptionCourRepository;
import com.dao.MatiereRepository;
import com.dao.SeanceRepository;
import com.entities.Admin;
import com.entities.Departement;
import com.entities.Etudiant;
import com.entities.Matiere;
import com.helpers.Auth;
import com.helpers.Image;

public class AdminController extends Controller {

	private ApplicationContext applicationContext;
	private AdminRepository adminRepository;
	private CourRepository courRepository;
	private DepartementRepository departementRepository;
	private EtudiantRepository etudiantRepository;
	private InscriptionCourRepository inscriptionCourRepository;
	private MatiereRepository matiereRepository;
	private SeanceRepository seanceRepository;

	public AdminController(HttpServletRequest request, HttpServletResponse response) throws Exception {
		applicationContext = (ApplicationContext) request.getServletContext().getAttribute("applicationContext");
		adminRepository = applicationContext.getBean(AdminRepository.class);
		courRepository = applicationContext.getBean(CourRepository.class);
		departementRepository = applicationContext.getBean(DepartementRepository.class);
		etudiantRepository = applicationContext.getBean(EtudiantRepository.class);
		inscriptionCourRepository = applicationContext.getBean(InscriptionCourRepository.class);
		matiereRepository = applicationContext.getBean(MatiereRepository.class);
		seanceRepository = applicationContext.getBean(SeanceRepository.class);
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		request.getRequestDispatcher(Config.ViewsPath + "admin/index.jsp").forward(request, response);
	}

	public void departements(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		List<Departement> departements;
		if (request.getParameter("rechercheNom") != null)
			departements = departementRepository.findByNomLike(request.getParameter("rechercheNom"));
		else
			departements = departementRepository.findAll();
		request.setAttribute("departements", departements);
		request.getRequestDispatcher(Config.ViewsPath + "admin/departement/index.jsp").forward(request, response);
	}

	public void ajouterdepartement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			String nom = request.getParameter("nom");
			if (departementRepository.findByNom(nom) != null) {
				request.getSession().setAttribute("error", "Le nom est déjà utilisé, choisir un autre");
			} else {
				String description = request.getParameter("description");
				String path = Config.ImagesPath + "departements/";
				Part image = request.getPart("image");
				String fileName = Image.traiterImage(path, image);
				String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : "";
				Departement departement = new Departement();
				departement.setNom(nom);
				departement.setDescription(description);
				departement.setImage(imageName);
				departementRepository.save(departement);
				if (image.getSize() > 0)
					image.write(fileName);
				request.getSession().setAttribute("alert_success", "Département ' " + departement.getNom() + " ' est ajouté avec success");
			}
			response.sendRedirect(Config.AppPath + "admin/departements.do");
		} else
			response.sendRedirect(Config.AppPath + "admin/departements.do");
	}

	public void modifierdepartement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("GET")) {
			if (request.getParameter("departementId") != null) {
				Long departementid = Long.parseLong(request.getParameter("departementId"));
				Departement departement = departementRepository.find(departementid);
				request.setAttribute("departement", departement);
				request.getRequestDispatcher(Config.ViewsPath + "admin/departement/modifier.jsp").forward(request, response);
			}
		} else {
			Long departementid = Long.parseLong(request.getParameter("departementId"));
			Departement departement = departementRepository.find(departementid);
			String nom = request.getParameter("nom");
			String description = request.getParameter("description");
			String path = Config.ImagesPath + "departements/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : departement.getImage();
			departement.setNom(nom);
			departement.setDescription(description);
			departement.setImage(imageName);
			departementRepository.update(departement);
			if (image.getSize() > 0)
				image.write(fileName);
			request.getSession().setAttribute("alert_success", "Département ' " + departement.getNom() + " ' est modifié avec success");
			response.sendRedirect(Config.AppPath + "admin/departements.do");
		}
	}

	public void supprimerdepartement(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long departementid = Long.parseLong(request.getParameter("departementId"));
			Departement departement = departementRepository.find(departementid);
			departementRepository.delete(departement);
			request.getSession().setAttribute("alert_success", "Département ' " + departement.getNom() + " ' est supprimé avec success");
			response.sendRedirect(Config.AppPath + "admin/departements.do");
		} else
			response.sendRedirect(Config.AppPath + "admin/departements.do");
	}

	public void profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("GET")) {
			request.getRequestDispatcher(Config.ViewsPath + "admin/profile.jsp").forward(request, response);
		} else {
			Admin admin = (Admin) request.getSession().getAttribute("admin");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String newpassword = request.getParameter("newpassword");
			if (!admin.getPassword().equals(password)) {
				request.getSession().setAttribute("error", "Mot de passe inccorect");
			} else if (adminRepository.findByEmailInOthers(admin, email) != null) {
				request.getSession().setAttribute("error", "Email déjè utilisé, choisir un autre");
			} else {
				password = newpassword.isEmpty() ? password : newpassword;
				admin.setEmail(email);
				admin.setPassword(password);
				adminRepository.update(admin);
				request.getSession().setAttribute("alert_success", "Vos informations sont changés avec succès");
			}
			response.sendRedirect(Config.AppPath + "admin/profile.do");
		}
	}

	public void matieres(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		List<Matiere> matieres = null;
		if (request.getParameter("idDepartement") != null) {
			Long idDepartement = Long.parseLong(request.getParameter("idDepartement"));
			Departement departement = departementRepository.find(idDepartement);
			if (request.getParameter("rechercheNom") != null) {
				matieres = matiereRepository.findByIdAndNomLike(idDepartement, request.getParameter("rechercheNom"));
			} else {
				matieres = departement.getMatieres();
			}
		} else {
			if (request.getParameter("filtreDepartement") != null) {
				Long idDepartement = Long.parseLong(request.getParameter("filtreDepartement"));
				Departement departement = departementRepository.find(idDepartement);
				request.setAttribute("departement", departement);
				matieres = departement.getMatieres();
			} else if (request.getParameter("rechercheNom") != null) {
				matieres = matiereRepository.findByNomLike(request.getParameter("rechercheNom"));
			} else {
				matieres = matiereRepository.findAll();
			}
		}
		request.setAttribute("matieres", matieres);
		request.setAttribute("departements", departementRepository.findAll());
		request.getRequestDispatcher(Config.ViewsPath + "admin/matiere/index.jsp").forward(request, response);
	}

	public void ajoutermatiere(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			String nom = request.getParameter("nom");
			String description = request.getParameter("description");
			Long idDepartement = Long.parseLong(request.getParameter("idDepartement"));
			String path = Config.ImagesPath + "matieres/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : "";
			Departement departement = departementRepository.find(idDepartement);
			if (matiereRepository.findByNom(nom) != null) {
				request.getSession().setAttribute("error", "Le nom est déjà utilisé, choisir un autre");
			} else {
				Matiere matiere = new Matiere();
				matiere.setNom(nom);
				matiere.setDescription(description);
				matiere.setDepartement(departement);
				matiere.setImage(imageName);
				matiereRepository.save(matiere);
				if (image.getSize() > 0)
					image.write(fileName);
				request.getSession().setAttribute("alert_success", "Matière ' " + matiere.getNom() + " ' est ajoutée avec success");
			}
			response.sendRedirect(Config.AppPath + "admin/matieres.do?idDepartement=" + departement.getId());
		}
	}

	public void modifiermatiere(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("GET")) {
			if (request.getParameter("idMatiere") != null) {
				Long idMatiere = Long.parseLong(request.getParameter("idMatiere"));
				Matiere matiere = matiereRepository.find(idMatiere);
				request.setAttribute("matiere", matiere);
				request.setAttribute("departements", departementRepository.findAll());
				request.getRequestDispatcher(Config.ViewsPath + "admin/matiere/modifier.jsp").forward(request, response);
			}
		} else {
			Long idMatiere = Long.parseLong(request.getParameter("idMatiere"));
			String nom = request.getParameter("nom");
			String description = request.getParameter("description");
			Long idDepartement = Long.parseLong(request.getParameter("idDepartement"));
			Matiere matiere = matiereRepository.find(idMatiere);
			Departement departement = departementRepository.find(idDepartement);
			String path = Config.ImagesPath + "matieres/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : matiere.getImage();
			matiere.setNom(nom);
			matiere.setDescription(description);
			matiere.setDepartement(departement);
			matiere.setImage(imageName);
			matiereRepository.update(matiere);
			if (image.getSize() > 0)
				image.write(fileName);
			request.getSession().setAttribute("alert_success", "Matière ' " + matiere.getNom() + " ' est modifiée avec success");
			response.sendRedirect(Config.AppPath + "admin/matieres.do?idDepartement=" + departement.getId());
		}
	}

	public void supprimermatiere(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idMatiere = Long.parseLong(request.getParameter("idMatiere"));
			Matiere matiere = matiereRepository.find(idMatiere);
			matiereRepository.delete(matiere);
			request.getSession().setAttribute("alert_success", "Matière ' " + matiere.getNom() + " ' est supprimée avec success");
			response.sendRedirect(Config.AppPath + "admin/matieres.do?idDepartement=" + matiere.getDepartement().getId());
		}
	}

	public void etudiants(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		List<Etudiant> etudiants;
		if (request.getParameter("rechercheNom") != null)
			etudiants = etudiantRepository.findByNomLike(request.getParameter("rechercheNom"));
		else if (request.getParameter("filiereFiltre") != null)
			etudiants = etudiantRepository.findByFiliere(request.getParameter("filiereFiltre"));
		else
			etudiants = etudiantRepository.findAll();
		request.setAttribute("etudiants", etudiants);
		request.getRequestDispatcher(Config.ViewsPath + "admin/etudiant/index.jsp").forward(request, response);
	}

	public void ajouteretudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String cne = request.getParameter("cne");
			String email = request.getParameter("email");
			String filiere = request.getParameter("filiere");
			String niveau = request.getParameter("niveau");
			if (etudiantRepository.findByEmail(email) != null) {
				request.getSession().setAttribute("error", "Email est déjà utilisé, choisir un autre");
			} else if (etudiantRepository.findByCne(cne) != null) {
				request.getSession().setAttribute("error", "Cne est déjà utilisé, choisir un autre");
			} else {
				Etudiant etudiant = new Etudiant();
				etudiant.setNom(nom);
				etudiant.setPrenom(prenom);
				etudiant.setCne(cne);
				etudiant.setEmail(email);
				etudiant.setFiliere(filiere);
				etudiant.setNiveau(niveau);
				etudiant.setPassword(cne);
				etudiantRepository.save(etudiant);
				request.getSession().setAttribute("alert_success", "Un nouveau etudiant est ajouté avec success");
			}
			response.sendRedirect(Config.AppPath + "admin/etudiants.do");
		}
	}

	public void bloqueretudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idEtudiant = Long.parseLong(request.getParameter("idEtudiant"));
			Etudiant etudiant = etudiantRepository.find(idEtudiant);
			etudiant.setEtat(false);
			etudiantRepository.update(etudiant);
			response.sendRedirect(Config.AppPath + "admin/etudiants.do");
		}
	}

	public void debloqueretudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotAdmin(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idEtudiant = Long.parseLong(request.getParameter("idEtudiant"));
			Etudiant etudiant = etudiantRepository.find(idEtudiant);
			etudiant.setEtat(true);
			etudiantRepository.update(etudiant);
			response.sendRedirect(Config.AppPath + "admin/etudiants.do");
		}
	}

}
