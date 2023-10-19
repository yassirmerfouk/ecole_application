<%@ include file="/WEB-INF/layouts/admin/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card mb-25">
		<div class="card-header">Liste des départements</div>
		<div class="card-body">
			<div class="mb-2 d-flex">
				<nav class="navbar navbar-light bg-light p-0 col-6">
					<form class="form-inline" action="${initParam.APP_PATH }admin/departements.do" method="GET">
						<input class="form-control ds-input mr-2" style="height: 40px;" type="search" placeholder="Nom département" name="rechercheNom" value="${param.rechercheNom }">
						<button class="btn btn-outline-primary btn-sm " type="submit">Rechercher</button>
					</form>
				</nav>
				<div class="col-6 text-right">
					<button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#ajouterDepartement">Ajouter département</button>
				</div>
			</div>
			<div class="modal fade" id="ajouterDepartement" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Ajouter département</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="${initParam.APP_PATH }admin/ajouterdepartement.do" method="POST" enctype="multipart/form-data">
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
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${departements }" var="departement" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${departement.nom }</td>
							<td>
								<div class="d-flex flex-row">
									<a href="${initParam.APP_PATH }admin/matieres.do?idDepartement=${departement.id}" class="btn btn-primary btn-sm mr-1" style="padding: 3px 8px 3px 8px">
										<i class="icon-copy fa fa-list" aria-hidden="true"></i>
									</a>
									<a href="${initParam.APP_PATH }admin/modifierdepartement.do?departementId=${departement.id}" class="btn btn-success btn-sm mr-1" style="padding: 3px 8px 3px 8px">
										<i class="icon-copy fa fa-edit" aria-hidden="true"></i>
									</a>
									<form action="${initParam.APP_PATH }admin/supprimerdepartement.do" method="POST">
										<input type="hidden" name="departementId" value="${departement.id }">
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