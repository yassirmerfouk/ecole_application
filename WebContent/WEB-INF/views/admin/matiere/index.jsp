<%@ include file="/WEB-INF/layouts/admin/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Liste des matières</div>
		<div class="card-body">
			<c:choose>
				<c:when test="${empty param.idDepartement }">
					<div class="mb-2 d-flex">
						<nav class="navbar navbar-light bg-light p-0 col-5">
							<form class="form-inline" action="${initParam.APP_PATH }admin/matieres.do" method="GET">
								<input class="form-control mr-sm-2" style="height: 40px;" type="search" placeholder="Nom matiere" name="rechercheNom" value="${param.rechercheNom }">
								<button class="btn btn-outline-primary btn-sm" type="submit">Rechercher</button>
							</form>
						</nav>
						<nav class="navbar navbar-light bg-light p-0 col-5">
							<form class="form-inline" action="${initParam.APP_PATH }admin/matieres.do" method="GET">
								<select name="filtreDepartement" class="form-control mr-2" style="height: 40px;">
									<c:if test="${not empty departement }">
										<option value="${departement.id }">${departement.nom }</option>
									</c:if>
									<c:forEach items="${departements }" var="departement2">
										<c:if test="${departement.id != departement2.id }">
											<option value="${departement2.id }">${departement2.nom }</option>
										</c:if>
									</c:forEach>
								</select>
								<button class="btn btn-outline-primary btn-sm" type="submit">Filtrer</button>
							</form>
						</nav>
						<div class="col-2 text-right">
							<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ajouterMatiere">Ajouter matiere</button>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="mb-2 d-flex">
						<nav class="navbar navbar-light bg-light p-0 col-6">
							<form class="form-inline" action="${initParam.APP_PATH }admin/matieres.do" method="GET">
								<input type="hidden" name="idDepartement" value="${param.idDepartement }">
								<input class="form-control mr-sm-2" style="height: 40px;" type="search" placeholder="Nom matiere" name="rechercheNom" value="${param.rechercheNom }">
								<button class="btn btn-outline-primary btn-sm" type="submit">Rechercher</button>
							</form>
						</nav>
						<div class="col-6 text-right">
							<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ajouterMatiere">Ajouter matiere</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="modal fade" id="ajouterMatiere" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Ajouter matière</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="${initParam.APP_PATH }admin/ajoutermatiere.do" method="POST" enctype="multipart/form-data">
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
									<label>
										Département
										<span class="text-danger">*</span>
									</label>
									<select name="idDepartement" class="form-control">
										<c:forEach items="${departements}" var="departement">
											<option value="${departement.id }">${departement.nom }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Image </label>
									<div class="custom-file">
										<input type="file" name="image" class="custom-file-input">
										<label class="custom-file-label">Choose file</label>
									</div>
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
			<table class="data-table table hover multiple-select-row nowrap dataTable no-footer dtr-inline" width="100%">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nom</th>
						<th>Département</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${matieres }" var="matiere" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${matiere.nom }</td>
							<td>${matiere.departement.nom }</td>
							<td>
								<div class="d-flex flex-row">
									<a href="${initParam.APP_PATH }admin/modifiermatiere.do?idMatiere=${matiere.id}" class="btn btn-success btn-sm mr-1" style="padding: 3px 8px 3px 8px">
										<i class="icon-copy fa fa-edit" aria-hidden="true"></i>
									</a>
									<form action="${initParam.APP_PATH }admin/supprimermatiere.do" method="POST">
										<input type="hidden" name="idMatiere" value="${matiere.id }">
										<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm" style="padding: 3px 8px 3px 8px">
											<i class="icon-copy fa fa-trash" aria-hidden="true"></i>
										</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
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
<%@ include file="/WEB-INF/layouts/admin/footer.jsp"%>