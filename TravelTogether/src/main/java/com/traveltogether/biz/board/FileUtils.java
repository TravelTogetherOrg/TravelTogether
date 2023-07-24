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
		//String[] path = Paths.get("").toAbsolutePath().toString().split("sts-bundle"); //(학원)  Spring(노트북)choongang
		//String path2 = "SpringSRC\\TT\\TravelTogether\\src\\main\\webapp\\resources\\image\\board\\boardImage\\";
		//노트북: TT\TravelTogether\src\main\webapp\resources\image\board\boardImage\
		//학원:SpringSRC\TT\TravelTogether\src\main\webapp\resources\image\board\boardImage\
		//System.out.println("path[0]: "+path[0]);
		//String basePath = path[0]+path2;
		String basePath = "C:\\Users\\user\\Desktop\\KCY\\spring\\SpringSRC\\TT\\TravelTogether\\src\\main\\webapp\\resources\\image\\board\\boardImage\\";
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
