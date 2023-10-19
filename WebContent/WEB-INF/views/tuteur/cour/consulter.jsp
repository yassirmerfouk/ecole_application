<%@ include file="/WEB-INF/layouts/tuteur/header.jsp"%>
<div class="">
	<div class="card">
		<div class="card-header">Modifier cour</div>
		<div class="card-body">
			<form action="${initParam.APP_PATH }tuteur/modifiercour.do" method="POST" enctype="multipart/form-data">
				<%-- 				<div class="form-group">
					<div class="text-center">
						<img src="${initParam.IMAGES_PATH }cours/${not empty cour.image ? cour.image : 'no.png'}" style="width: 350px; height: 150px;" />
					</div>
				</div> --%>
				<input type="hidden" name="idCour" value="${cour.id }">
				<div class="form-group">
					<label>
						Nom
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="nom" class="form-control" value="${cour.nom }">
				</div>
				<div class="form-group">
					<label>Description </label>
					<textarea name="description" class="form-control">${cour.description }</textarea>
				</div>
				<div class="form-group">
					<label>
						Matière
						<span class="text-danger">*</span>
					</label>
					<select name="idMatiere" class="form-control">
						<option value="${cour.matiere.id }">${cour.matiere.nom }</option>
						<c:forEach items="${matieres}" var="matiere">
							<c:if test="${cour.matiere.id != matiere.id }">
								<option value="${matiere.id }">${matiere.nom }</option>
							</c:if>
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
				<div class="form-group mt-3">
					<button type="submit" class="btn btn-primary btn-sm">Modifier</button>
				</div>
			</form>
			<form action="${initParam.APP_PATH }tuteur/ajouterdocument.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="idCour" value="${cour.id }">
				<div class="form-group">
					<label>Document </label>
					<div class="custom-file">
						<input type="file" name="document" class="custom-file-input" required>
						<label class="custom-file-label">Choose file</label>
					</div>
				</div>
				<div class="form-group mt-3">
					<button type="submit" class="btn btn-primary btn-sm">Ajouter</button>
				</div>
			</form>
			<div class="m-3">
				<c:forEach items="${cour.documents}" var="document">
					<div class="d-flex">
						<div class="product-file-type ">
							<ul class="list-unstyled">
								<li class="media mb-3">
									<span class="mr-3 align-self-center img-icon danger-rgba text-danger">.pdf</span>
									<div class="media-body">
										<h5 class="font-16 mb-1">
											<a href="${initParam.DOCUMENTS_PATH}${document.nom}" target="_blank">${document.nom }</a>
											<i class="feather icon-download-cloud float-right"></i>
										</h5>
										<p>.pdf, 10.5 MB</p>
									</div>
								</li>
							</ul>
						</div> 
						<form action="${initParam.APP_PATH }tuteur/supprimerdocument.do" method="POST" class="ml-3">
							<input type="hidden" name="idDocument" value="${document.id }">
							<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm" style="padding: 3px 8px 3px 8px">
								<i class="icon-copy fa fa-trash" aria-hidden="true"></i>
							</button>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="mt-3">
		<div class="card">
			<div class="card-header">Etudiants Inscrits</div>
			<div class="card-body">
				<table class="data-table table hover multiple-select-row nowrap dataTable no-footer dtr-inline" width="100%">
					<thead>
						<tr>
							<td>N°</td>
							<th>Image</th>
							<th>Nom</th>
							<th>Prenom</th>
							<th>Email</th>
							<th>Téléphone</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cour.inscriptionCours }" var="inscriptionCour" varStatus="status">
							<tr>
								<td>${status.count }</td>
								<td>
									<img style="width: 50px; height: 50px;" class="rounded" src="${initParam.IMAGES_PATH}profiles/${not empty inscriptionCour.etudiant.image ? inscriptionCour.etudiant.image : 'no.png'}" />
								</td>
								<td>${inscriptionCour.etudiant.nom }</td>
								<td>${inscriptionCour.etudiant.prenom }</td>
								<td>${inscriptionCour.etudiant.email }</td>
								<td>${inscriptionCour.etudiant.telephone }</td>
								<td>
									<div class="d-flex flex-row">
										<c:if test="${inscriptionCour.etat == false }">
											<form action="${initParam.APP_PATH }tuteur/debloqueretudiant.do" method="POST">
												<input type="hidden" name="inscriptionId" value="${inscriptionCour.id }">
												<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-success btn-sm" style="padding: 3px 8px 3px 8px">
													<i class="icon-copy fa fa-ban" aria-hidden="true"></i>
												</button>
											</form>
										</c:if>
										<c:if test="${inscriptionCour.etat == true }">
											<form action="${initParam.APP_PATH }tuteur/bloqueretudiant.do" method="POST">
												<input type="hidden" name="inscriptionId" value="${inscriptionCour.id }">
												<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm" style="padding: 3px 8px 3px 8px">
													<i class="icon-copy fa fa-ban" aria-hidden="true"></i>
												</button>
											</form>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/layouts/tuteur/footer.jsp"%>