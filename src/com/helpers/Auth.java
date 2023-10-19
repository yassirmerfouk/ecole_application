package com.helpers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.config.Config;

public class Auth {

	public static boolean isAdmin(HttpServletRequest request) {
		if(request.getSession().getAttribute("admin") != null)
			return true;
		return false;
	}
	
	public static boolean isEtudiant(HttpServletRequest request) {
		if(request.getSession().getAttribute("etudiant") != null)
			return true;
		return false;
	}
	
	public static boolean doRedirectToNotAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(!isAdmin(request)) {
			response.sendRedirect(Config.AppPath + "auth/login.do");
			return true;
		}
		return false;
	}
	
	public static boolean doRedirectToNotEtudiant(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(!isEtudiant(request)) {
			response.sendRedirect(Config.AppPath + "auth/login.do");
			return true;
		}
		return false;
	}
	
	public static boolean doRedirectToLogedUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(isAdmin(request)) {
			response.sendRedirect(Config.AppPath + "admin/index.do");
			return true;
		}else if(isEtudiant(request)) {
			response.sendRedirect(Config.AppPath + "etudiant/index.do");
			return true;
		}
		return false;
	}
	
	public static boolean doLogoutAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getSession().removeAttribute("admin");
		response.sendRedirect(Config.AppPath + "auth/login.do");
		return true;
	}
	
	public static boolean doLogoutEtudiant(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.getSession().removeAttribute("etudiant");
		response.sendRedirect(Config.AppPath + "auth/login.do");
		return true;
	}

}
