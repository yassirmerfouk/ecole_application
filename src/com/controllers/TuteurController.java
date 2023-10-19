package com.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.websocket.Session;

import org.springframework.context.ApplicationContext;

import com.config.Config;
import com.dao.AdminRepository;
import com.dao.CourRepository;
import com.dao.DepartementRepository;
import com.dao.DocumentRepository;
import com.dao.EtudiantRepository;
import com.dao.InscriptionCourRepository;
import com.dao.MatiereRepository;
import com.dao.SeanceRepository;
import com.entities.Cour;
import com.entities.Departement;
import com.entities.Document;
import com.entities.Etudiant;
import com.entities.InscriptionCour;
import com.entities.Matiere;
import com.entities.Seance;
import com.helpers.Auth;
import com.helpers.Image;

public class TuteurController extends Controller {
	private ApplicationContext applicationContext;
	private AdminRepository adminRepository;
	private CourRepository courRepository;
	private DepartementRepository departementRepository;
	private EtudiantRepository etudiantRepository;
	private InscriptionCourRepository inscriptionCourRepository;
	private MatiereRepository matiereRepository;
	private SeanceRepository seanceRepository;
	private DocumentRepository documentRepository;
	private Etudiant etudiant;

	public TuteurController(HttpServletRequest request, HttpServletResponse response) throws Exception {
		applicationContext = (ApplicationContext) request.getServletContext().getAttribute("applicationContext");
		adminRepository = applicationContext.getBean(AdminRepository.class);
		courRepository = applicationContext.getBean(CourRepository.class);
		departementRepository = applicationContext.getBean(DepartementRepository.class);
		etudiantRepository = applicationContext.getBean(EtudiantRepository.class);
		inscriptionCourRepository = applicationContext.getBean(InscriptionCourRepository.class);
		matiereRepository = applicationContext.getBean(MatiereRepository.class);
		seanceRepository = applicationContext.getBean(SeanceRepository.class);
		documentRepository = applicationContext.getBean(DocumentRepository.class);
		if (request.getSession().getAttribute("etudiant") != null)
			etudiant = etudiantRepository.find(((Etudiant) request.getSession().getAttribute("etudiant")).getId());
	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "index");
		request.getRequestDispatcher(Config.ViewsPath + "tuteur/index.jsp").forward(request, response);
	}

	public void cours(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "index");
		request.setAttribute("cours", etudiant.getCoursTuteure());
		request.setAttribute("matieres", matiereRepository.findAll());
		request.getRequestDispatcher(Config.ViewsPath + "tuteur/cour/index.jsp").forward(request, response);
	}

	public void ajoutercour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			String nom = request.getParameter("nom");
			String description = request.getParameter("description");
			Long idMatiere = Long.parseLong(request.getParameter("idMatiere"));
			String path = Config.ImagesPath + "cours/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : "";
			Matiere matiere = matiereRepository.find(idMatiere);
			Cour cour = new Cour();
			cour.setNom(nom);
			cour.setDescription(description);
			cour.setImage(imageName);
			cour.setMatiere(matiere);
			cour.setTuteur(etudiant);
			courRepository.save(cour);
			if (image.getSize() > 0)
				image.write(fileName);
			request.getSession().setAttribute("alert_success", "Votre nouveau cour ' " + cour.getNom() + " ' est ajouté avec success");
			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		}
	}

	public void supprimercour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idCour = Long.parseLong(request.getParameter("idCour"));
			Cour cour = courRepository.find(idCour);
			courRepository.delete(cour);
			request.getSession().setAttribute("alert_success", "Votre cour ' " + cour.getNom() + " ' est supprimé avec success");
			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		}
	}

	public void modifiercour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Cour cour = courRepository.find(Long.parseLong(request.getParameter("idCour")));
			String nom = request.getParameter("nom");
			String description = request.getParameter("description");
			Long idMatiere = Long.parseLong(request.getParameter("idMatiere"));
			String path = Config.ImagesPath + "cours/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : cour.getImage();
			Matiere matiere = matiereRepository.find(idMatiere);
			cour.setNom(nom);
			cour.setDescription(description);
			cour.setImage(imageName);
			cour.setMatiere(matiere);
			courRepository.update(cour);
			if (image.getSize() > 0)
				image.write(fileName);
			request.getSession().setAttribute("alert_success", "Votre cour ' " + cour.getNom() + " ' est modifié avec success");
			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		}
	}

	public void consultercour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "index");
		Long idCour = Long.parseLong(request.getParameter("idCour"));
		Cour cour = courRepository.find(idCour);
		Long count = etudiant.getCoursTuteure().stream().filter(x -> x.getId() == cour.getId()).count();
		if (count == 0)
			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		else {
			request.setAttribute("cour", cour);
			request.setAttribute("matieres", matiereRepository.findAll());
			request.getRequestDispatcher(Config.ViewsPath + "tuteur/cour/consulter.jsp").forward(request, response);
		}
	}

	public void bloqueretudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long inscriptionId = Long.parseLong(request.getParameter("inscriptionId"));
			InscriptionCour inscriptionCour = inscriptionCourRepository.find(inscriptionId);
			inscriptionCour.setEtat(false);
			inscriptionCourRepository.update(inscriptionCour);
			response.sendRedirect(Config.AppPath + "tuteur/consultercour.do?idCour=" + inscriptionCour.getCour().getId());
//				request.getSession().setAttribute("success", "Un nouvelle matiére est ajouté avec success");
//			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		}
	}

	public void debloqueretudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long inscriptionId = Long.parseLong(request.getParameter("inscriptionId"));
			InscriptionCour inscriptionCour = inscriptionCourRepository.find(inscriptionId);
			inscriptionCour.setEtat(true);
			inscriptionCourRepository.update(inscriptionCour);
			response.sendRedirect(Config.AppPath + "tuteur/consultercour.do?idCour=" + inscriptionCour.getCour().getId());
//				request.getSession().setAttribute("success", "Un nouvelle matiére est ajouté avec success");
//			response.sendRedirect(Config.AppPath + "tuteur/cours.do");
		}
	}

	public void seances(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("cours", etudiant.getCoursTuteure());
		List<Seance> seances = new ArrayList<>();
		for (Cour cour : etudiant.getCoursTuteure()) {
			seances.addAll(cour.getSeances());
		}
		seances = seances.stream().sorted(Comparator.reverseOrder()).collect(Collectors.toList());
		request.setAttribute("seances", seances);
		request.getRequestDispatcher(Config.ViewsPath + "tuteur/seance/index.jsp").forward(request, response);
	}

	public void ajouterseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			String titre = request.getParameter("titre");
			LocalDate date = LocalDate.parse(request.getParameter("date"));
			String temps = request.getParameter("temps");
			String description = request.getParameter("description");
			Cour cour = courRepository.find(Long.parseLong(request.getParameter("idCour")));
			Boolean type = Boolean.parseBoolean(request.getParameter("type"));
			Seance seance = new Seance();
			seance.setTitre(titre);
			seance.setDate(date);
			seance.setTemps(temps);
			seance.setDescription(description);
			seance.setEtat(true);
			seance.setCour(cour);
			seance.setType(type);
			seanceRepository.save(seance);
			response.sendRedirect(Config.AppPath + "tuteur/seances.do");
		}
	}

	public void modifierseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idSeance = Long.parseLong(request.getParameter("idSeance"));
		Seance seance = seanceRepository.find(idSeance);
		Long nb = etudiant.getCoursTuteure().stream().filter(x -> x.getId() == seance.getCour().getId()).count();
		if (nb == 0) {
			response.sendRedirect(Config.AppPath + "tuteur/seances.do");
			return;
		}
		if (request.getMethod().equals("GET")) {
			request.setAttribute("seance", seance);
			request.setAttribute("cours", etudiant.getCoursTuteure());
			request.getRequestDispatcher(Config.ViewsPath + "tuteur/seance/modifier.jsp").forward(request, response);
		}
		if (request.getMethod().equals("POST")) {
			String titre = request.getParameter("titre");
			LocalDate date = LocalDate.parse(request.getParameter("date"));
			String temps = request.getParameter("temps");
			String description = request.getParameter("description");
			Cour cour = courRepository.find(Long.parseLong(request.getParameter("idCour")));
			Boolean type = Boolean.parseBoolean(request.getParameter("type"));
			Boolean etat = Boolean.parseBoolean(request.getParameter("etat"));
			seance.setTitre(titre);
			seance.setDate(date);
			seance.setTemps(temps);
			seance.setDescription(description);
			seance.setEtat(etat);
			seance.setCour(cour);
			seance.setType(type);
			seanceRepository.update(seance);
			response.sendRedirect(Config.AppPath + "tuteur/seances.do");
		}
	}

	public void supprimerseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idSeance = Long.parseLong(request.getParameter("idSeance"));
			Seance seance = seanceRepository.find(idSeance);
			seanceRepository.delete(seance);
			response.sendRedirect(Config.AppPath + "tuteur/seances.do");
		}
	}

	public void profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("GET"))
			request.getRequestDispatcher(Config.ViewsPath + "tuteur/profile.jsp").forward(request, response);
		else {
			Etudiant etudiant = (Etudiant) request.getSession().getAttribute("etudiant");
			String email = request.getParameter("email");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String telephone = request.getParameter("telephone");
			String password = request.getParameter("password");
			String newpassword = request.getParameter("newpassword");
			String path = Config.ImagesPath + "profiles/";
			Part image = request.getPart("image");
			String fileName = Image.traiterImage(path, image);
			String imageName = image.getSize() > 0 ? fileName.split("/")[fileName.split("/").length - 1] : etudiant.getImage();
			if (!etudiant.getPassword().equals(password)) {
				request.getSession().setAttribute("error", "Mot de passe inccorect");
			} else if (etudiantRepository.findByEmailInOthers(etudiant, email) != null) {
				request.getSession().setAttribute("error", "Email déjè utilisé, choisir un autre");
			} else {
				etudiant.setEmail(email);
				etudiant.setNom(nom);
				etudiant.setPrenom(prenom);
				etudiant.setTelephone(telephone);
				password = newpassword.isEmpty() ? password : newpassword;
				etudiant.setPassword(password);
				etudiant.setImage(imageName);
				etudiantRepository.update(etudiant);
				if (image.getSize() > 0)
					image.write(fileName);
				request.getSession().setAttribute("alert_success", "Vos informations sont changés avec succès");
			}
			response.sendRedirect(Config.AppPath + "tuteur/profile.do");
		}
	}

	public void consulterseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idSeance = Long.parseLong(request.getParameter("idSeance"));
		Seance seance = seanceRepository.find(idSeance);
		Long count = etudiant.getCoursTuteure().stream().filter(x -> x.getId() == seance.getCour().getId()).count();
		if (count == 0) {
			response.sendRedirect(Config.AppPath + "tuteur/seances.do");
		} else {
			request.setAttribute("seance", seance);
			request.getRequestDispatcher(Config.ViewsPath + "tuteur/seance/consulter.jsp").forward(request, response);
		}
	}

	public void ajouterdocument(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idCour = Long.parseLong(request.getParameter("idCour"));
		Cour cour = courRepository.find(idCour);
		String path = Config.DocumentsPath;
		Part documentPart = request.getPart("document");
		Document document = new Document();
		document.setNom(documentPart.getSubmittedFileName());
		document.setCour(cour);
		documentRepository.save(document);
		documentPart.write(Config.DocumentsPath + documentPart.getSubmittedFileName());
		response.sendRedirect(Config.AppPath + "tuteur/consultercour.do?idCour=" +cour.getId());
	}
	
	public void supprimerdocument(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idDocument = Long.parseLong(request.getParameter("idDocument"));
		Document document = documentRepository.find(idDocument);
		documentRepository.delete(document);
		response.sendRedirect(Config.AppPath + "tuteur/consultercour.do?idCour=" +document.getCour().getId());
	}
}
