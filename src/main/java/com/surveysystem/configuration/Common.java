package com.surveysystem.configuration;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.surveysystem.model.Template;
import com.surveysystem.model.User;

public class Common {
	
	public static Date getCurrentDate(){
		return Calendar.getInstance().getTime();
	}

	public static Date dateFormart(Date date, String formart){
		try {
			SimpleDateFormat sDateFormat = new SimpleDateFormat(formart);
			date = sDateFormat.parse(date.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			return date;
		}
	}
	
	public static String dateFormartToSring(Date date, String formart){
		String dateString="";
		try {
			SimpleDateFormat sDateFormat = new SimpleDateFormat(formart);
			dateString = sDateFormat.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			return dateString;
		}
	}
	
	public static Date createDate(String value, String formart){
		SimpleDateFormat sDateFormat = new SimpleDateFormat(formart);
		Date date;
		try {
			date = sDateFormat.parse(value);
			return date;
		} catch (Exception e) {
			e.printStackTrace();
			return new Date();
		}
	}
	
	public static User executeUploadFile(User user, MultipartFile file) {

		BufferedOutputStream stream = null;
		File dest = new File("src/main/resources/static/img/avata");
		if (!dest.exists())
			dest.mkdirs();
		if (!file.isEmpty()) {
			String extension = getExtension(file.getOriginalFilename().split("\\."));
			String timeNow = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			String fileNameNew = user.getUsername() + "_" + timeNow + "." + extension;
			File avata = new File("src/main/resources/static/img/avata/" + fileNameNew);

			try {
				stream = new BufferedOutputStream(new FileOutputStream(avata));
				FileCopyUtils.copy(file.getInputStream(), stream);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					stream.close();
					user.setAvata(fileNameNew);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else
			user.setAvata("");
		return user;
	}
	
	public static Template executeUploadCover(Template template, MultipartFile file) {

		BufferedOutputStream stream = null;
		File dest = new File("src/main/resources/static/img/cover");
		if (!dest.exists())
			dest.mkdirs();
		if (!file.isEmpty()) {
			String extension = getExtension(file.getOriginalFilename().split("\\."));
			String timeNow = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			String fileNameNew = "Cover_" + timeNow + "." + extension;
			File cover = new File("src/main/resources/static/img/cover/" + fileNameNew);

			try {
				stream = new BufferedOutputStream(new FileOutputStream(cover));
				FileCopyUtils.copy(file.getInputStream(), stream);
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					stream.close();
					template.setCover(fileNameNew);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else
			template.setCover("");
		return template;
	}
	
	public static String addSurveyCoverByTemplate(String nameFileTemplateCover, User user){
		String cover = "";
		try {
			String timeNow = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss").format(Calendar.getInstance().getTime());
			String nameFileSurveyCover = "Cover_"+user.getUsername()+"_"+timeNow+"."+getExtension(nameFileTemplateCover.split("\\."));
			File dest = new File("src/main/resources/static/img/cover/survey-cover/");
			if(!dest.exists()) dest.mkdirs();
			else{
				File coverTemplate = new File("src/main/resources/static/img/cover/"+nameFileTemplateCover);
				File coverSurvey = new File("src/main/resources/static/img/cover/survey-cover/"+nameFileSurveyCover);
				FileCopyUtils.copy(coverTemplate, coverSurvey);
			}
			return nameFileSurveyCover;
		} catch (Exception e) {
			return "";
		}
		
		
	}

	private static String getExtension(String arr[]) {
		String extension = null;
		if (arr != null) {
			extension = arr[arr.length - 1];
		}
		return extension;
	}
	
	public static String hexToRGBA(String hex){
		String rgba = "";
		try {
			int r = Integer.valueOf(hex.substring(1, 3), 16);
			int g = Integer.valueOf(hex.substring(3, 5), 16);
			int b = Integer.valueOf(hex.substring(5, 7), 16);
			rgba = "rgba("+r+","+g+","+b+",0.2)";
			return rgba;
		} catch (Exception e) {
			e.printStackTrace();
			return "rgba(0,0,0,0.2)";
		}
		
	}
}
