<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="container">
	<div class="main-body">

		<div class="row gutters-sm">
			<div class="col-md-4 mb-3">
				<div class="card">
					<div class="card-body">
						<div class="d-flex flex-column align-items-center text-center">
							<img style="width:150px; height:150px;" src="${initParam.IMAGES_PATH }profiles/${not empty tuteur.image ? 'no.png' : 'no.png'}" alt="Admin" class="rounded-circle" width="150">
							<div class="mt-3">
								<h4>${tuteur.nom }${etudiant.prenom }</h4>
								<p class="text-secondary mb-1">ISGA Etudiant</p>
								<p class="text-muted font-size-sm">${etudiant.filiere }</p>
								<button class="btn btn-primary">Follow</button>
								<button class="btn btn-outline-primary">Message</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="card mb-3">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Nom et Prenom</h6>
							</div>
							<div class="col-sm-9 text-secondary">${tuteur.nom }${tuteur.prenom }</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Email</h6>
							</div>
							<div class="col-sm-9 text-secondary">${tuteur.email }</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Téléphone</h6>
							</div>
							<div class="col-sm-9 text-secondary">(+212) ${etudiant.telephone }</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Filière</h6>
							</div>
							<div class="col-sm-9 text-secondary">${etudiant.filiere }</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<h6 class="mb-0">Niveau</h6>
							</div>
							<div class="col-sm-9 text-secondary">${etudiant.niveau }</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="row clearfix">
			<c:forEach items="${tuteur.coursTuteure }" var="cour">
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
							<p class="card-text" style="margin-bottom: 8px;">${cour.matiere.nom }</p>
							<div class="d-flex justify-content-between">
								<p class="card-text font-weight-bold">${cour.tuteur.nom }${cour.tuteur.prenom }</p>
								<form action="${initParam.APP_PATH }etudiant/inscrirecour.do" method="POST">
									<input type="hidden" value="${cour.id }" name="idCour">
									<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-success btn-sm mr-2">
										<i class="icon-copy fa fa-plus" aria-hidden="true"></i>
										S'inscrire
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>>
