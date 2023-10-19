<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="card">
	<div class="card-header">${cour.nom }</div>
	<div class="card-body">
		<div class="d-flex">
			<div class="col-4">
				<c:if test="${not empty cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/${cour.image}" alt="Card image cap" style="width: 300px; height: 180px;">
				</c:if>
				<c:if test="${empty cour.image }">
					<img class="card-img-top" src="${initParam.IMAGES_PATH }cours/no.png" alt="Card image cap" style="width: 300px; height: 180px;"">
				</c:if>
			</div>
			<div>
				<h5 class="card-title">${cour.nom }</h5>
				<p class="card-text">${cour.description }.</p>
				<p class="card-text">
					<span class="font-weight-bold">Tuteur : </span>
					<a href="">${cour.tuteur.nom } ${cour.tuteur.prenom }</a>
				</p>
				<p class="card-text">
					<span class="font-weight-bold">Matière : </span>
					<a href="">${cour.matiere.nom } </a>
				</p>
			</div>
		</div>
		<div class="card-body">
			<h5 class="card-title">Documents</h5>
			<c:forEach items="${cour.documents}" var="document">
				<div class="d-flex mt-2">
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
					<form action="${initParam.DOCUMENTS_PATH}${document.nom}" method="GET" class="ml-3" target="_blank">
						<input type="hidden" name="idDocument" value="${document.id }">
						<button type="submit" class="btn btn-primary btn-sm" style="padding: 3px 8px 3px 8px">
							<i class="icon-copy fa fa-eye" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>