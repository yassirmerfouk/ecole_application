<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="mb-3">
	<form class="form-inline" action="${initParam.APP_PATH }etudiant/cours.do" method="GET">
		<select name="idMatiere" class="form-control col-3 mr-2" style="height: 40px;">
			<c:forEach items="${matieres }" var="matiere">
				<option value="${matiere.id }">${matiere.nom }</option>
			</c:forEach>
		</select>
		<button class="btn btn-outline-primary col-1 btn-sm" type="submit">Filtrer</button>
	</form>
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
					<p class="card-text" style="margin-bottom: 8px;">${cour.matiere.nom }</p>
					<p class="card-text font-weight-bold">${cour.tuteur.nom }${cour.tuteur.prenom }</p>
					<div class="d-flex justify-content-between" style="width:100%;">
						<form action="${initParam.APP_PATH }etudiant/inscrirecour.do" method="POST" style="width:48%;">
							<input type="hidden" value="${cour.id }" name="idCour">
							<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-success btn-sm mr-2" style="width:100%;">
								<i class="icon-copy fa fa-plus" aria-hidden="true"></i>
								S'inscrire
							</button>
						</form>
						<a href="${initParam.APP_PATH }etudiant/consultercour.do?idCour=${cour.id}" class="btn btn-primary btn-sm mr-2" style="width:48%;">
							<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
							Consulter
						</a>
					</div>
					<a href="${initParam.APP_PATH }etudiant/tuteur.do?idTuteur=${cour.tuteur.id}" class="btn btn-primary btn-sm mr-2 btn-block mt-2">
						<i class="icon-copy fa fa-phone" aria-hidden="true"></i>
						Contact Tuteur
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>>
