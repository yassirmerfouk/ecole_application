package com.dao;
import com.entities.Document;

public class DocumentRepository extends Repository<Document, Long> {
	public DocumentRepository() {
		super(Document.class);
	}
}
