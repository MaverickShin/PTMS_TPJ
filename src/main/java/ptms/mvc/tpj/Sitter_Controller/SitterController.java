package ptms.mvc.tpj.Sitter_Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ptms.mvc.tpj.Sitter_Service.SitterServiceImpl;

@RequestMapping("/sitter")
@Controller
public class SitterController {
	
	 private static final Logger log = LoggerFactory.getLogger(SitterController.class);

	 @Autowired
	 SitterServiceImpl sitterSer;
	 /*
	 @RequestMapping("index")
	  public String main(HttpServletRequest req, Model model) {
	     log.info("url ==> index");
	       
	     return "main/index";
	  }	 
	  */ 
	 @RequestMapping("sitter")
	   public String sitter(HttpServletRequest req, Model model) {
	      log.info("url ==> sitter");
	      
	      return "customer/sitter/sitter";
	   }   
	   
	 @RequestMapping("sitterMatching")
	 public String sitterMatching(HttpServletRequest req, Model model) {
		 log.info("url ==> sitterMatching");
      
		 return "customer/sitter/sitterMatching";
	 } 
}
