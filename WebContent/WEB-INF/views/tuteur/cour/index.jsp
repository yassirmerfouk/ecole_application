<%@ include file="/WEB-INF/layouts/tuteur/header.jsp"%>
<div class="text-right mb-2">
	<button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#ajouterCour">Ajouter cour</button>
</div>
<div class="modal fade" id="ajouterCour" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Ajouter Cour</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="${initParam.APP_PATH }tuteur/ajoutercour.do" method="POST" enctype="multipart/form-data">
					<div class="form-group">
						<label>
							Nom
							<span class="text-danger">*</span>
						</label>
						<input type="text" name="nom" class="form-control">
					</div>
					<div class="form-group">
						<label>Description </label>
						<textarea name="description" class="form-control"></textarea>
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
							Matière
							<span class="text-danger">*</span>
						</label>
						<select name="idMatiere" class="form-control">
							<c:forEach items="${matieres }" var="matiere">
								<option value="${matiere.id }">${matiere.nom }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<button type="submit" class="btn btn-primary btn-sm mt-2">Ajouter</button>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Fermer</button>
			</div>
		</div>
	</div>
</div>
<div class="row clearfix">
	<c:forEach items="${cours }" var="cour">
		<div class="col-sm-12 col-md-12 col-lg-4 mb-30">
			<div class="card card-box">
				<c:if test="${not empty cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/${cour.image}" alt="Card image cap" style="height: 180px;">
				</c:if>
				<c:if test="${empty cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/no.png" alt="Card image cap" style="height: 180px;">
				</c:if>
				<div class="card-body">
					<h5 class="card-title weight-500">${cour.nom }</h5>
					<p class="card-text">${cour.matiere.nom }</p>
					<div class="d-flex " style="width:100%;">
						<a href="${initParam.APP_PATH }tuteur/consultercour.do?idCour=${cour.id}" class="btn btn-primary btn-sm mr-2" style="width:48%;">
							<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
							Consulter
						</a>
						<form action="${initParam.APP_PATH }tuteur/supprimercour.do" method="POST" style="width:48%;">
							<input type="hidden" value="${cour.id }" name="idCour">
							<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm" style="width:100%;">
								<i class="icon-copy fa fa-trash" aria-hidden="true"></i>
								Supprimer
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
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
<%@ include file="/WEB-INF/layouts/tuteur/footer.jsp"%>