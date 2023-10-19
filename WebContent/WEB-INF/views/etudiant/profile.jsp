<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Modifier Information</div>
		<div class="card-body">
			<form action="<%=application.getInitParameter("APP_PATH")%>etudiant/profile.do" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label>
						Cne
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="cne" class="form-control" value="${etudiant.cne }" readonly>
				</div>
				<div class="form-group">
					<label>
						Email
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="email" class="form-control" value="${etudiant.email }">
				</div>
				<div class="form-group">
					<label>
						Nom
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="nom" class="form-control" value="${etudiant.nom}">
				</div>
				<div class="form-group">
					<label>
						Prenom
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="prenom" class="form-control" value="${etudiant.prenom }">
				</div>
				<div class="form-group">
					<label>
						Télephone
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="telephone" class="form-control" value="${etudiant.telephone }">
				</div>
				<div class="form-group">
					<label>Image </label>
					<div class="custom-file">
						<input type="file" name="image" class="custom-file-input">
						<label class="custom-file-label">Choose file</label>
					</div>
				</div>
				<div class="form-group">
					<label>
						Mot de passe
						<span class="text-danger">*</span>
					</label>
					<input type="password" name="password" class="form-control" value="">
				</div>
				<div class="form-group">
					<label>Nouveau Mot de passe</label>
					<input type="password" name="newpassword" class="form-control" value="">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Modifier</button>
				</div>
			</form>
		</div>
	</div>
</div>

<c:if test="${not empty alert_success }">
	<script>
		var msg = "${alert_success}";
		Swal.fire({
			position : 'top-end',
			icon : 'success',
			title : msg,
			showConfirmButton : true,
			timer : 2000
		})
	</script>
	<c:remove var="alert_success" scope="session" />
</c:if>
<c:if test="${not empty error }">
	<script>
		var msg = "${error}";
		Swal.fire({
			icon : 'error',
			title : 'Oops...',
			text : msg
		})
	</script>
	<c:remove var="error" scope="session" />
</c:if>
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>