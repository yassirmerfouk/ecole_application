<%@ include file="/WEB-INF/layouts/etudiant/header.jsp"%>
<div class="container pd-0">
	<div class="timeline mb-30">
		<ul>
			<c:forEach items="${seances }" var="seance">
				<li>
					<div class="timeline-date">${seance.date }</div>
					<div class="timeline-desc card-box">
						<div class="pd-20">
							<div class="d-flex justify-content-between">
								<h4 class="mb-10 h4">${seance.titre } | ${seance.type == false ? 'Présentiel' : 'A distance' } | ${seance.temps }</h4>
								<c:if test="${seance.etat == true }">
									<span class="badge badge-success" style="height: 30px;">Ouverte</span>
								</c:if>
								<c:if test="${seance.etat == false }">
									<span class="badge badge-danger" style="height: 30px;">Fermée</span>
								</c:if>
							</div>
							<h4 class="mb-10 h4">Cour : ${seance.cour.nom }</h4>
							<p>${seance.description }.</p>
							<c:if test="${seance.etat == true }">
								<div class="d-flex">
									<c:if test="${seances.contains(seance) == true }">
										<form action="${initParam.APP_PATH }etudiant/quitterseance.do" method="POST">
											<input type="hidden" value="${seance.id }" name="idSeance">
											<button onclick="return confirm('Vous-etes sur??')" type="submit" class="btn btn-danger btn-sm">
												<i class="icon-copy fa fa-trash" aria-hidden="true"></i>
												Quitter seance
											</button>
										</form>
									</c:if>
								</div>
							</c:if>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/etudiant/footer.jsp"%>