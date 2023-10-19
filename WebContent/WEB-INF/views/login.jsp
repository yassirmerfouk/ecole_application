<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8">
<title>Se connecter</title>

<!-- Site favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${initParam.ADMIN_STYLES}vendors/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${initParam.ADMIN_STYLES}vendors/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${initParam.ADMIN_STYLES}vendors/images/favicon-16x16.png">

<!-- Mobile Specific Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES}vendors/styles/core.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES}vendors/styles/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${initParam.ADMIN_STYLES}vendors/styles/style.css">
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="login.html">
					<img src="${initParam.ADMIN_STYLES}vendors/images/deskapp-logo.svg" alt="">
				</a>
			</div>
			<div class="login-menu">
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<img src="${initParam.ADMIN_STYLES}vendors/images/login-page-img.png" alt="">
				</div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Se Connecter Au Platforme</h2>
						</div>
						<form action="${initParam.APP_PATH }auth/login.do" method="POST">
							<c:if test="${not empty error_login }">
								<div class="alert alert-danger" role="alert">${error_login }</div>
							</c:if>
							<c:remove var="error_login" scope="session" />
							<div class="input-group custom">
								<input type="email" class="form-control form-control-lg" placeholder="Email" name="email">
								<div class="input-group-append custom">
									<span class="input-group-text">
										<i class="icon-copy dw dw-user1"></i>
									</span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" class="form-control form-control-lg" placeholder="**********" name="password">
								<div class="input-group-append custom">
									<span class="input-group-text">
										<i class="dw dw-padlock1"></i>
									</span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" class="custom-control-input" id="customCheck1">
										<label class="custom-control-label" for="customCheck1">Remember</label>
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password">
										<a href="#">Mot De passe Oublié</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<button type="submit" class="btn btn-primary btn-lg btn-block">Se connecter</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="${initParam.ADMIN_STYLES}vendors/scripts/core.js"></script>
	<script src="${initParam.ADMIN_STYLES}vendors/scripts/script.min.js"></script>
	<script src="${initParam.ADMIN_STYLES}vendors/scripts/process.js"></script>
	<script src="${initParam.ADMIN_STYLES}vendors/scripts/layout-settings.js"></script>
</body>
</html>