package com.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;

import com.config.Config;
import com.dao.AdminRepository;
import com.dao.EtudiantRepository;
import com.entities.Admin;
import com.entities.Etudiant;
import com.helpers.Auth;

public class AuthController extends Controller {

	private ApplicationContext applicationContext;
	private AdminRepository adminRepository;
	private EtudiantRepository etudiantRepository;

	public AuthController(HttpServletRequest request, HttpServletResponse response) {
		applicationContext = (ApplicationContext) request.getServletContext().getAttribute("applicationContext");
		adminRepository = applicationContext.getBean(AdminRepository.class);
		etudiantRepository = applicationContext.getBean(EtudiantRepository.class);
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(Auth.doRedirectToLogedUser(request, response)) return;
		if (request.getMethod().equals("GET")) {
			request.getRequestDispatcher(Config.ViewsPath + "login.jsp").forward(request, response);
		} else {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Admin admin = adminRepository.findByEmailAndPassword(email, password);
			if (admin != null) {
				request.getSession().setAttribute("admin", admin);
				response.sendRedirect(Config.AppPath + "admin/index.do");
			} else {
				Etudiant etudiant = etudiantRepository.findByEmailAndPassword(email, password);
				if (etudiant != null) {
					if (!etudiant.isEtat()) {
						request.getSession().setAttribute("error_login", "Votre compte est bloqué, merci de contacter administrateur");
						response.sendRedirect(Config.AppPath + "auth/login.do");
					} else {
						request.getSession().setAttribute("etudiant", etudiant);
						response.sendRedirect(Config.AppPath + "etudiant/index.do");
					}
				} else {
					request.getSession().setAttribute("error_login", "Verifier votre email ou votre mot de passe");
					response.sendRedirect(Config.AppPath + "auth/login.do");
				}
			}
		}
	}
	
	public void  logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(Auth.isAdmin(request)) Auth.doLogoutAdmin(request, response);
		else Auth.doLogoutEtudiant(request, response);
	}
}
