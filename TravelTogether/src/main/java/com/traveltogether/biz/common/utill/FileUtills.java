package com.traveltogether.biz.common.utill;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileUtills {

//	private static final String FILE_UPLOAD_PATH = "/Users/kimbyeongju/Desktop/prejectTT/TravelTogether/src/main/webapp"; 내 컴에서
//	private static final String FILE_STATIC_PATH = "/resources/upload";
	private static final String FILE_UPLOAD_PATH = "C:\\Users\\admin\\Desktop\\TravelTogether\\TravelTogether\\src\\main\\webapp";
	private static final String FILE_STATIC_PATH = "\\resources\\upload";
	
    public static String serverUploadFile(MultipartFile multipartFile) throws IOException {
        if (multipartFile.isEmpty()) {
            return null;
        }
        
        String fileDir = FILE_UPLOAD_PATH + FILE_STATIC_PATH;
        
        String originalFilename = multipartFile.getOriginalFilename();
        String serverUploadFileName = createServerFileName(originalFilename);
        
        String realPath = fileDir + File.separator + serverUploadFileName;
        File file = new File(realPath);
        multipartFile.transferTo(file);
        
        return file.getPath().substring(file.getPath().indexOf(FILE_STATIC_PATH), file.getPath().length());
    }

    public static String createServerFileName(String originalFilename) {
        String uuid = UUID.randomUUID().toString();
        String ext = extractExt(originalFilename);
        return uuid + "." + ext;
    }

    public static String extractExt(String originalFilename) {
        int pos = originalFilename.lastIndexOf(".");
        return originalFilename.substring(pos + 1);
    }
}
