<%@ include file="/WEB-INF/layouts/tuteur/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Modifier séance</div>
		<div class="card-body">
			<form action="${initParam.APP_PATH }tuteur/modifierseance.do" method="POST">
				<input type="hidden" value="${seance.id }" name="idSeance">
				<div class="form-group">
					<label>
						Titre
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="titre" class="form-control" value="${seance.titre }">
				</div>
				<div class="form-group">
					<label>
						Date
						<span class="text-danger">*</span>
					</label>
					<input type="date" name="date" class="form-control" value="${seance.date}">
				</div>
				<div class="form-group">
					<label>
						Temps
						<span class="text-danger">*</span>
					</label>
					<input type="time" name="temps" class="form-control" value="${seance.temps }">
				</div>
				<div class="form-group">
					<label>Description </label>
					<textarea name="description" class="form-control">${seance.description}</textarea>
				</div>
				<div class="form-group">
					<label>
						Cour
						<span class="text-danger">*</span>
					</label>
					<select name="idCour" class="form-control">
						<option value="${seance.cour.id }">${seance.cour.nom }</option>
						<c:forEach items="${cours }" var="cour">
							<c:if test="${cour.id != seance.cour.id }">
								<option value="${cour.id }">${cour.nom }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label>
						Type
						<span class="text-danger">*</span>
					</label>
					<select name="type" class="form-control">
						<option value="${seance.type }">${seance.type == true ? 'A distance' : 'Presentiel'  }</option>
						<option value="false">Presentiel</option>
						<option value="true">A distance</option>
					</select>
				</div>
				<div class="form-group">
					<label>
						Etat
						<span class="text-danger">*</span>
					</label>
					<select name="etat" class="form-control">
						<option value="${seance.etat }">${seance.etat == true ? 'Ouverte' : 'Fermé'  }</option>
						<option value="true">Ouverte</option>
						<option value="false">Fermée</option>
					</select>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-sm mt-2">Modifier</button>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
<%@ include file="/WEB-INF/layouts/tuteur/footer.jsp"%>