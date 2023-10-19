package com.controllers;

import java.io.IOException;

import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class FrontController extends HttpServlet{

	private String _controller;
	private String _action;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		dispatchRequest(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void dispatchRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		_controller = "";
		_action = "";
		
		String path = request.getServletPath().substring(1, request.getServletPath().length()-3);
		if (!path.isEmpty()) {
			String[] uri = path.split("/", 2);
			_controller = uri[0].substring(0, 1).toUpperCase() + uri[0].substring(1) + "Controller";
			if (uri.length > 1 && !uri[1].isEmpty()) {
				_action = uri[1];
			}
		}
		
		try {
			Class controllerClass = Class.forName("com.controllers." + _controller);
			Controller controller = (Controller) controllerClass.getDeclaredConstructor(HttpServletRequest.class, HttpServletResponse.class).newInstance(request,response);
			Method method = controllerClass.getMethod(_action, HttpServletRequest.class, HttpServletResponse.class);
			method.invoke(controller, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(404);
		}
	}
}
