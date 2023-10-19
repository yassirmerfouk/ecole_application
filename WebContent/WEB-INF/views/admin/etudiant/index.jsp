<%@ include file="/WEB-INF/layouts/admin/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Liste des étudiant</div>
		<div class="card-body">
			<div class="mb-2 d-flex">
				<nav class="navbar navbar-light bg-light p-0 col-5">
					<form class="form-inline" action="${initParam.APP_PATH }admin/etudiants.do" method="GET">
						<input class="form-control mr-2" style="height: 40px;" type="search" placeholder="Nom etudiant" name="rechercheNom" value="${param.rechercheNom }">
						<button class="btn btn-outline-primary btn-sm" type="submit">Rechercher</button>
					</form>
				</nav>
				<nav class="navbar navbar-light bg-light p-0 col-4">
					<form class="form-inline" action="${initParam.APP_PATH }admin/etudiants.do" method="GET">
						<select name="filiereFiltre" class="form-control mr-2" style="height: 40px;">
							<c:if test="${not empty param.filiereFiltre }">
								<option value="${param.filiereFiltre }">${param.filiereFiltre }</option>
							</c:if>
							<c:if test="${ param.filiereFiltre !=  'Génie Informatique'}">
								<option value="Génie Informatique">Génie Informatique</option>
							</c:if>
							<c:if test="${ param.filiereFiltre !=  'Génie Electronique'}">
								<option value="Génie Electronique">Génie Electronique</option>
							</c:if>
							<c:if test="${ param.filiereFiltre !=  'Management'}">
								<option value="Management">Management</option>
							</c:if>
						</select>
						<button class="btn btn-outline-primary btn-sm" type="submit">Filtrer</button>
					</form>
				</nav>
				<div class="col-3 text-right">
					<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#ajouterMatiere">Ajouter étudiant</button>
				</div>
			</div>
			<div class="modal fade" id="ajouterMatiere" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Ajouter etudiant</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="${initParam.APP_PATH }admin/ajouteretudiant.do" method="POST">
								<div class="form-group">
									<label>
										Nom
										<span class="text-danger">*</span>
									</label>
									<input type="text" name="nom" class="form-control">
								</div>
								<div class="form-group">
									<label>
										Prenom
										<span class="text-danger">*</span>
									</label>
									<input type="text" name="prenom" class="form-control">
								</div>
								<div class="form-group">
									<label>
										CNE
										<span class="text-danger">*</span>
									</label>
									<input type="text" name="cne" class="form-control">
								</div>
								<div class="form-group">
									<label>
										Email
										<span class="text-danger">*</span>
									</label>
									<input type="email" name="email" class="form-control">
								</div>
								<div class="form-group">
									<label>
										Filiere
										<span class="text-danger">*</span>
									</label>
									<select name="filiere" class="form-control">
										<option value="Génie Informatique">Génie Informatique</option>
										<option value="Génie Electronique">Génie Electronique</option>
										<option value="Management">Management</option>
									</select>
								</div>
								<div class="form-group">
									<label>
										Niveau
										<span class="text-danger">*</span>
									</label>
									<select name="niveau" class="form-control">
										<option value="1er année">1er année</option>
										<option value="2eme année">2eme année</option>
										<option value="3eme année">3eme année</option>
										<option value="4eme année">4eme année</option>
										<option value="5eme année">5eme année</option>
									</select>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-sm mt-2">Ajouter</button>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm mt-2" data-dismiss="modal">Fermer</button>
						</div>
					</div>
				</div>
			</div>
			<table class="data-table table hover multiple-select-row nowrap dataTable no-footer dtr-inline" width="100%">
				<thead>
					<tr>
						<th>image</th>
						<th>CNE</th>
						<th>Nom</th>
						<th>Prénom</th>
						<th>Email</th>
						<th>Filière</th>
						<th>Etat</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${etudiants }" var="etudiant" varStatus="status">
						<tr style="padding: 0 !important;">
							<td>
								<div class="text-center">
									<img style="width: 50px; height: 50px;" class="rounded" src="${initParam.IMAGES_PATH}profiles/${not empty etudiant.image ? etudiant.image : 'no.png'}" />
								</div>
							</td>
							<td>${etudiant.cne }</td>
							<td>${etudiant.nom }</td>
							<td>${etudiant.prenom }</td>
							<td>${etudiant.email }</td>
							<td>${etudiant.filiere}</td>
							<td>
								<c:choose>
									<c:when test="${etudiant.etat == true }">
										<span type="submit" class="badge badge-success">Active</span>
									</c:when>
									<c:otherwise>
										<span type="submit" class="badge badge-danger">Bloqué</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<div class="d-flex flex-row">
									<c:choose>
										<c:when test="${etudiant.etat == true }">
											<form action="${initParam.APP_PATH }/admin/bloqueretudiant.do" method="POST">
												<input type="hidden" name="idEtudiant" value="${etudiant.id }">
												<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm" style="padding: 3px 8px 3px 8px">
													<i class="icon-copy fa fa-ban" aria-hidden="true"></i>
												</button>
											</form>
										</c:when>
										<c:otherwise>
											<form action="${initParam.APP_PATH }/admin/debloqueretudiant.do" method="POST">
												<input type="hidden" name="idEtudiant" value="${etudiant.id }">
												<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-success btn-sm" style="padding: 3px 8px 3px 8px">
													<i class="icon-copy fa fa-ban" aria-hidden="true"></i>
												</button>
											</form>
										</c:otherwise>
									</c:choose>
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