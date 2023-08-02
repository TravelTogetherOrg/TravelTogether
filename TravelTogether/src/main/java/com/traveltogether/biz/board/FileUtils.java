package com.traveltogether.biz.board;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {
	
	private static final String format = "yyyy/MM/dd";
	private static final DateTimeFormatter dateTimeFormat = DateTimeFormatter.ofPattern(format);
	
	public static Path getPathToday() throws IOException{
		
		String basePath = "C:\\Users\\admin\\Desktop\\TravelTogether\\TravelTogether\\src\\main\\webapp\\resources\\image\\board\\boardImage";
		String todayPath = LocalDate.now().format(dateTimeFormat);
		Path pathToday = Paths.get(basePath, todayPath);
		
		if(Files.notExists(pathToday)) {
			Files.createDirectories(pathToday);
		}
		return pathToday;
	}
	
	public static Path getPathToday(String fileName) throws IOException {
		return Paths.get(getPathToday().toString(), fileName);
	}
	
	public static Path saveFile(MultipartFile multipartFile,String uuid) throws IOException {
		Path targetPath = getPathToday(uuid+"_"+multipartFile.getOriginalFilename());
		multipartFile.transferTo(targetPath.toFile());
		return targetPath;
	}

}
