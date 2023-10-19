<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="row clearfix">
	<c:forEach items="${inscriptionsCours }" var="inscriptionCour">
		<div class="col-sm-12 col-md-12 col-lg-4 mb-30">
			<div class="card card-box">
				<c:if test="${not empty inscriptionCour.cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/${inscriptionCour.cour.image}" alt="Card image cap" style="height: 180px;">
				</c:if>
				<c:if test="${empty inscriptionCour.cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/no.png" alt="Card image cap" style="height: 180px;">
				</c:if>
				<div class="card-body">
					<h5 class="card-title weight-500">${inscriptionCour.cour.nom }</h5>
					<p class="card-text" style="margin-bottom: 8px;">${inscriptionCour.cour.matiere.nom }
						<c:if test="${inscriptionCour.etat == false }">
							<span type="submit" class="badge badge-danger" style="padding: 4px 5px;">Bloqué</span>
						</c:if>
					</p>
					<p class="card-text font-weight-bold">${inscriptionCour.cour.tuteur.nom }${inscriptionCour.cour.tuteur.prenom }</p>
					<div class="d-flex justify-content-between" style="width: 100%;">
						<a href="${initParam.APP_PATH }etudiant/consultercour.do?idCour=${inscriptionCour.cour.id}" class="btn btn-primary btn-sm mr-2" style="width: 48%;">
							<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
							Consulter
						</a>
						<a href="${initParam.APP_PATH }etudiant/seances.do?idCour=${inscriptionCour.cour.id}" class="btn btn-primary btn-sm mr-2" style="width: 48%;">
							<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
							Séances
						</a>
					</div>
					<form action="${initParam.APP_PATH }etudiant/desinscrirecour.do" method="POST" style="width: 100%;" class="mt-2">
						<input type="hidden" value="${inscriptionCour.id }" name="idInscription">
						<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-secondary btn-sm mr-2 btn-block">
							<i class="icon-copy fa fa-minus" aria-hidden="true"></i>
							Désinscrire du cour
						</button>
					</form>
				</div>
			</div>
		</div>
	</c:forEach>
</div>

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
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>>
