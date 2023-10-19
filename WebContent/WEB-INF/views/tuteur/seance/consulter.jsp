<%@ include file="/WEB-INF/layouts/tuteur/header.jsp"%>
<div class="mt-3">
	<div class="card">
		<div class="card-header">${seance.titre }| ${seance.type == false ? 'Présentiel' : 'A distance' } | ${seance.temps }</div>
		<div class="card-body">
			<div class="pd-10">
				<div class="d-flex justify-content-between">
					<h4 class="mb-10 h4">Cour : ${seance.cour.nom }</h4>
					<c:if test="${seance.etat == true }">
						<span class="badge badge-success" style="height: 30px;">Ouverte</span>
					</c:if>
					<c:if test="${seance.etat == false }">
						<span class="badge badge-danger" style="height: 30px;">Fermée</span>
					</c:if>
				</div>
				<p>${seance.description }.</p>
			</div>
			<table class="data-table table hover multiple-select-row nowrap dataTable no-footer dtr-inline" width="100%">
				<thead>
					<tr>
						<td>N°</td>
						<th>Image</th>
						<th>Nom</th>
						<th>Prenom</th>
						<th>Email</th>
						<th>Téléphone</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${seance.etudiants }" var="etudiant" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>
								<img style="width: 50px; height: 50px;" src="${initParam.IMAGES_PATH}profiles/${not empty etudiant.image ? etudiant.image : 'no.png'}" />
							</td>
							<td>${etudiant.nom }</td>
							<td>${etudiant.prenom }</td>
							<td>${etudiant.email }</td>
							<td>${etudiant.telephone }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/tuteur/footer.jsp"%>