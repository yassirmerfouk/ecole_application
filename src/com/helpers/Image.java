package com.helpers;

import javax.servlet.http.Part;

public class Image {

	public static String traiterImage(String path, Part image) {
		String fileName = image.getContentType();
		String ext = fileName.split("/")[1];
		int randomNumber = (int) (Math.random() * 10000000);
		String imageName = null;
		imageName = image.getSize() > 0 ? randomNumber + "." + ext : "";
		fileName = path + imageName;
		return fileName;
	}
}
