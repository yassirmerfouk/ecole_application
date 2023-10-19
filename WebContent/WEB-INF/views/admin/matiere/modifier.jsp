<%@ include file="/WEB-INF/layouts/admin/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Modifier matière</div>
		<div class="card-body">
			<form action="${initParam.APP_PATH }admin/modifiermatiere.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="idMatiere" value="${matiere.id }">
				<div class="form-group">
					<label>
						Nom
						<span class="text-danger">*</span>
					</label>
					<input type="text" name="nom" class="form-control" value="${matiere.nom }">
				</div>
				<div class="form-group">
					<label>Description </label>
					<textarea name="description" class="form-control">${matiere.description }</textarea>
				</div>
				<div class="form-group">
					<label>
						Département
						<span class="text-danger">*</span>
					</label>
					<select name="idDepartement" class="form-control">
						<option value="${matiere.departement.id }">${matiere.departement.nom }</option>
						<c:forEach items="${departements}" var="departement">
							<c:if test="${matiere.departement.id != departement.id }">
								<option value="${departement.id }">${departement.nom }</option>
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
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/layouts/admin/footer.jsp"%>