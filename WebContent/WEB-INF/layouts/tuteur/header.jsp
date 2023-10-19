<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>Tuteur</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${initParam.ADMIN_STYLES }vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${initParam.ADMIN_STYLES }vendors/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${initParam.ADMIN_STYLES }vendors/images/favicon-16x16.png">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES }vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES }vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES }src/plugins/datatables/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES }src/plugins/datatables/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES }vendors/styles/style.css">
<script src="${initParam.	ADMIN_STYLES }sweetalert.js"></script>
</head>
<body>
	<style>
.form-group {
	margin-bottom: 10px;
}

.form-control {
	height: 40px;
}

textarea.form-control {
	height: 100px;
}

.header {
	height: 70px;
}

.rounded-circle {
    border-radius: 20% !important;
}

.rounded {
    border-radius: 0.75rem !important;
}
</style>
	<div class="header">
		<div class="header-left">
			<div class="menu-icon dw dw-menu"></div>
			<div class="search-toggle-icon dw dw-search2" data-toggle="header_search"></div>
			<div class="header-search">
				<form>
					<div class="form-group mb-0">
						<i class="dw dw-search2 search-icon"></i>
						<input type="text" class="form-control search-input" placeholder="Search Here">
						<div class="dropdown">
							<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
								<i class="ion-arrow-down-c"></i>
							</a>
							<div class="dropdown-menu dropdown-menu-right">
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">From</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control form-control-sm form-control-line" type="text">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">To</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control form-control-sm form-control-line" type="text">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-sm-12 col-md-2 col-form-label">Subject</label>
									<div class="col-sm-12 col-md-10">
										<input class="form-control form-control-sm form-control-line" type="text">
									</div>
								</div>
								<div class="text-right">
									<button class="btn btn-primary">Search</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="header-right">
			<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown">
						<i class="icon-copy dw dw-notification"></i>
						<span class="badge notification-active"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="notification-list mx-h-350 customscroll">
							<ul>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/img.jpg" alt="">
										<h3>John Doe</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/photo1.jpg" alt="">
										<h3>Lea R. Frith</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/photo2.jpg" alt="">
										<h3>Erik L. Richards</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/photo3.jpg" alt="">
										<h3>John Doe</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/photo4.jpg" alt="">
										<h3>Renee I. Hansen</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
								<li>
									<a href="#">
										<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/img.jpg" alt="">
										<h3>Vicki M. Coleman</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed...</p>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
						<span class="user-icon">
							<img ${initParam.ADMIN_STYLES } style="height:52px;" src="${initParam.IMAGES_PATH }profiles/${not empty etudiant.image ? etudiant.image : 'no.png'}" alt="">
						</span>
						<span class="user-name">${not empty etudiant ? etudiant.prenom += ' ' += etudiant.nom : 'Guest' }</span>
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
						<a class="dropdown-item" href="${initParam.APP_PATH }tuteur/profile.do">
							<i class="dw dw-user1"></i>
							Profile
						</a>
						<a class="dropdown-item" href="${initParam.APP_PATH }etudiant/index.do">
							<i class="dw dw-settings2"></i>
							Etudiant
						</a>
						<a class="dropdown-item" href="${initParam.APP_PATH }auth/logout.do">
							<i class="dw dw-logout"></i>
							Se deconnecter
						</a>
					</div>
				</div>
			</div>
			<div class="github-link">
				<div>
					<div alt="" style="width:40px; height:70px;"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="index.html">
				<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/deskapp-logo.svg" alt="" class="dark-logo">
				<img ${initParam.ADMIN_STYLES } src="${initParam.ADMIN_STYLES }vendors/images/deskapp-logo-white.svg" alt="" class="light-logo">
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<li>
						<a href="${initParam.APP_PATH }tuteur/index.do" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span>
							</span>
							<span class="mtext">Accueil</span>
						</a>
					</li>
					<li>
						<a href="${initParam.APP_PATH }tuteur/cours.do" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span>
							</span>
							<span class="mtext">Cours</span>
						</a>
					</li>
					<li>
						<a href="${initParam.APP_PATH }tuteur/seances.do" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-house-1"></span>
							</span>
							<span class="mtext">Séances</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pt-3">