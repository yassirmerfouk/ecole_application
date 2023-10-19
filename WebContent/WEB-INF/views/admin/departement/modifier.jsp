<%@ include file="/WEB-INF/layouts/admin/header.jsp"%>
<div class="col-md-12 col-lg-12">
	<div class="card">
		<div class="card-header">Modifier département</div>
		<div class="card-body">
			<form action="${initParam.APP_PATH }admin/modifierdepartement.do" method="POST" enctype="multipart/form-data">
				<input type="hidden" name="departementId" value="${departement.id }">
				<div class="form-group">
					<label>Nom <span class="text-danger">*</span></label>
					<input type="text" name="nom" class="form-control" value="${departement.nom }">
				</div>
				<div class="form-group">
					<label>Description </label>
					<textarea name="description" class="form-control">${departement.description }</textarea>
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