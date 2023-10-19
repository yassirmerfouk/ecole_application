<%@ include file="/WEB-INF/layouts/tuteur/header.jsp"%>
<div class="text-right mb-2">
	<button type="button" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#ajouterCour">Ajouter Séance</button>
</div>
<div class="modal fade" id="ajouterCour" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Ajouter Séance</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="${initParam.APP_PATH }tuteur/ajouterseance.do" method="POST">
					<div class="form-group">
						<label>
							Titre
							<span class="text-danger">*</span>
						</label>
						<input type="text" name="titre" class="form-control">
					</div>
					<div class="form-group">
						<label>
							Date
							<span class="text-danger">*</span>
						</label>
						<input type="date" name="date" class="form-control">
					</div>
					<div class="form-group">
						<label>
							Temps
							<span class="text-danger">*</span>
						</label>
						<input type="time" name="temps" class="form-control">
					</div>
					<div class="form-group">
						<label>Description </label>
						<textarea name="description" class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label>
							Cour
							<span class="text-danger">*</span>
						</label>
						<select name="idCour" class="form-control">
							<c:forEach items="${cours }" var="cour">
								<option value="${cour.id }">${cour.nom }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label>
							Type
							<span class="text-danger">*</span>
						</label>
						<select name="type" class="form-control">
							<option value="false">Presentiel</option>
							<option value="true">A distance</option>
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
<div class="container pd-0">
	<div class="timeline mb-30">
		<ul>
			<c:forEach items="${seances }" var="seance">
				<li>
					<div class="timeline-date">${seance.date }</div>
					<div class="timeline-desc card-box">
						<div class="pd-20">
							<div class="d-flex justify-content-between">
								<h4 class="mb-10 h4">${seance.titre }| ${seance.type == false ? 'Présentiel' : 'A distance' } | ${seance.temps }</h4>
								<c:if test="${seance.etat == true }">
									<span class="badge badge-success" style="height: 30px;">Ouverte</span>
								</c:if>
								<c:if test="${seance.etat == false }">
									<span class="badge badge-danger" style="height: 30px;">Fermée</span>
								</c:if>
							</div>
							<h4 class="mb-10 h4">Cour : ${seance.cour.nom }</h4>
							<p>${seance.description }.</p>
							<div class="d-flex">
								<a href="${initParam.APP_PATH }tuteur/consulterseance.do?idSeance=${seance.id}" class="btn btn-primary btn-sm mr-2">
									<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
									Consulter
								</a>
								<a href="${initParam.APP_PATH }tuteur/modifierseance.do?idSeance=${seance.id}" class="btn btn-success btn-sm mr-2">
									<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
									Modifier
								</a>
								<form action="${initParam.APP_PATH }tuteur/supprimerseance.do" method="POST">
									<input type="hidden" value="${seance.id }" name="idSeance">
									<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm">
										<i class="icon-copy fa fa-trash" aria-hidden="true"></i>
										Supprimer
									</button>
								</form>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/tuteur/footer.jsp"%>