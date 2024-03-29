package ptms.mvc.tpj.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.ui.Model;


public class ImageUploaderHandler {
	
	private String uploadPath;
	
    public void setUploadPath(String url) {
        
    	this.uploadPath = url;
    
    }
    
    public void imageUpload(HttpServletRequest req, Model model)
    		throws ServletException, IOException {
    	
    	req.setCharacterEncoding("utf-8");
    	
        File uploadDir = new File(uploadPath);
        
        // 업로드할 경로에 폴더가 없는 경우 폴더 생성
        
        if (!uploadDir.exists()) {
            
        	uploadDir.mkdir();
        
        }

        try {
            uploadDir.setWritable(true);
            uploadDir.setReadable(true);
            uploadDir.setExecutable(true);

            String fileName = "";
            
            for (Part part : req.getParts()) {
                
            	System.out.println(part.getHeader("content-disposition"));
                
                fileName = getFileName(part);
                
                if (fileName != null && !"".equals(fileName)) {
                    part.write(uploadPath + File.separator + fileName);
                    // form에서 받아온 이미지 값을 attribute 
                    req.setAttribute("fileName", fileName);
                }
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        
        // 주석 처리 안하면 alert 깨짐
        // res.setContentType("text/html");
        // res.getWriter().println("업로드 완료");
    }

    private String getFileName(Part part) {
        
    	
    	for (String content : part.getHeader("content-disposition").split(";")) {
            System.out.println("for문 시작");
    		if (content.trim().startsWith("filename")) {
    			System.out.println("filename 시작");
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null; // filename이 없는 경우 (폼필드 데이터인 경우):
    }

}
