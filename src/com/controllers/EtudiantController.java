package com.controllers;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
import com.entities.Admin;
import com.entities.Cour;
import com.entities.Etudiant;
import com.entities.InscriptionCour;
import com.entities.Seance;
import com.helpers.Auth;
import com.helpers.Image;

public class EtudiantController extends Controller {

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

	public EtudiantController(HttpServletRequest request, HttpServletResponse response) throws Exception {
		applicationContext = (ApplicationContext) request.getServletContext().getAttribute("applicationContext");
		adminRepository = applicationContext.getBean(AdminRepository.class);
		courRepository = applicationContext.getBean(CourRepository.class);
		departementRepository = applicationContext.getBean(DepartementRepository.class);
		etudiantRepository = applicationContext.getBean(EtudiantRepository.class);
		inscriptionCourRepository = applicationContext.getBean(InscriptionCourRepository.class);
		matiereRepository = applicationContext.getBean(MatiereRepository.class);
		seanceRepository = applicationContext.getBean(SeanceRepository.class);
		documentRepository = applicationContext.getBean(DocumentRepository.class);
		if (request.getSession().getAttribute("etudiant") != null) {
			etudiant = etudiantRepository.find(((Etudiant) request.getSession().getAttribute("etudiant")).getId());
//			System.out.println(etudiant.getSeances());
		}
	}

	public void choix(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getParameter("type") == null)
			request.getRequestDispatcher(Config.ViewsPath + "choix.jsp").forward(request, response);
		else if (request.getParameter("type").equals("etudiant"))
			response.sendRedirect(Config.AppPath + "etudiant/index.do");
		else if (request.getParameter("type").equals("tuteur"))
			response.sendRedirect(Config.AppPath + "tuteur/index.do");

	}

	public void index(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "Index");
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/index.jsp").forward(request, response);
	}

	public void cours(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "index");
		List<Cour> cours = null;
		if (request.getParameter("idMatiere") != null)
			cours = courRepository.findByMatiereId(Long.parseLong(request.getParameter("idMatiere")));
		else if (request.getParameter("nom") != null)
			cours = courRepository.findByNom(request.getParameter("nom"));
		else
			cours = courRepository.findAll();
		List<Cour> etudiantCours = etudiant.getInscriptionCours().stream().map(x -> x.getCour()).toList();
		cours = cours.stream().filter(x -> !etudiantCours.contains(x)).toList();
//		cours = cours.stream().filter(x -> !etudiant.getCoursTuteure().contains(x)).toList();
		request.setAttribute("cours", cours);
		request.setAttribute("matieres", matiereRepository.findAll());
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/cours.jsp").forward(request, response);
	}

	public void mescours(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("titre", "index");
		request.setAttribute("inscriptionsCours", etudiant.getInscriptionCours());
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/mescours.jsp").forward(request, response);
	}

	public void inscrirecour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idCour = Long.parseLong(request.getParameter("idCour"));
			Cour cour = courRepository.find(idCour);
			InscriptionCour inscriptionCour = new InscriptionCour();
			inscriptionCour.setEtat(true);
			inscriptionCour.setEtudiant(etudiant);
			inscriptionCour.setCour(cour);
			inscriptionCourRepository.save(inscriptionCour);
			response.sendRedirect(Config.AppPath + "etudiant/cours.do");
		}
	}

	public void desinscrirecour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("POST")) {
			Long idInscription = Long.parseLong(request.getParameter("idInscription"));
			InscriptionCour inscriptionCour = inscriptionCourRepository.find(idInscription);
			if(!inscriptionCour.isEtat()) 
				request.getSession().setAttribute("error", "Vous ne noupez pas désinscrire de ce cour");
			else 
				inscriptionCourRepository.delete(inscriptionCour);
			response.sendRedirect(Config.AppPath + "etudiant/mescours.do");
		}
	}

	public void profile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		if (request.getMethod().equals("GET"))
			request.getRequestDispatcher(Config.ViewsPath + "etudiant/profile.jsp").forward(request, response);
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
			response.sendRedirect(Config.AppPath + "etudiant/profile.do");
		}
	}

	public void seances(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idCour = Long.parseLong(request.getParameter("idCour"));
		Cour cour = courRepository.find(idCour);
		Long nb = etudiant.getInscriptionCours().stream().filter(x -> x.getCour().getId() == cour.getId()).count();
		if (nb == 0) {
			request.getSession().setAttribute("error", "Vous etes pas inscrit au ce cour");
			response.sendRedirect(Config.AppPath + "etudiant/mescours.do");
			return;
		}
		InscriptionCour inscriptionCour = etudiant.getInscriptionCours().stream().filter(x -> x.getCour().getId() == cour.getId()).toList().get(0);
		if (!inscriptionCour.isEtat()) {
			request.getSession().setAttribute("error", "Vous etes bloqué de ce cour");
			response.sendRedirect(Config.AppPath + "etudiant/mescours.do");
			return;
		}
		cour.setSeances(cour.getSeances().stream().sorted(Comparator.reverseOrder()).toList());
		request.setAttribute("cour", cour);
		request.setAttribute("seances", etudiant.getSeances());
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/seances.jsp").forward(request, response);
	}

	public void participerseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idSeance = Long.parseLong(request.getParameter("idSeance"));
		Seance seance = seanceRepository.find(idSeance);
		etudiant.getSeances().add(seance);
		etudiantRepository.update(etudiant);
		response.sendRedirect(Config.AppPath + "etudiant/seances.do?idCour=" + seance.getCour().getId());
	}

	public void quitterseance(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idSeance = Long.parseLong(request.getParameter("idSeance"));
		Seance seance = seanceRepository.find(idSeance);
		etudiant.getSeances().remove(seance);
		etudiantRepository.update(etudiant);
		response.sendRedirect(Config.AppPath + "etudiant/messeances.do");
	}

	public void messeances(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		request.setAttribute("seances", etudiant.getSeances().stream().sorted(Comparator.reverseOrder()).toList());
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/messeances.jsp").forward(request, response);
	}

	public void tuteur(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idTuteur = Long.parseLong(request.getParameter("idTuteur"));
		Etudiant tuteur = etudiantRepository.find(idTuteur);
		request.setAttribute("tuteur", tuteur);
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/tuteur.jsp").forward(request, response);
	}

	public void consultercour(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (Auth.doRedirectToNotEtudiant(request, response))
			return;
		Long idCour = Long.parseLong(request.getParameter("idCour"));
		Cour cour = courRepository.find(idCour);
		request.setAttribute("cour", cour);
		request.getRequestDispatcher(Config.ViewsPath + "etudiant/consulter.jsp").forward(request, response);
	}

}
