package test.bean;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class TestBean {

	@Autowired
	SqlMapClientTemplate sqlMap;

	
	@RequestMapping("form.jp")
	public String test(){
		return "/test/form";
	}
	
	@RequestMapping("formPro.jp")
	public String testPro2(MultipartHttpServletRequest request , FormDTO dto){
		String id = request.getParameter("id");
		MultipartFile mf = request.getFile("save");  // 업로드 원본 파일 
		String path = request.getRealPath("save");	 // 업로드 경로
		System.out.println(path);
		String fileName = mf.getOriginalFilename();  // test.jpg
		int index = fileName.lastIndexOf(".");		 //  4
		fileName = fileName.substring(index+1);      // jpg
		Date day = new Date();						 // 날짜 
		
		String fm = id+"_"+day+"."+fileName;
		fm = fm.replace(" ", "");
		fm = fm.replace(":", "");					 //치환
		File f = new File(path+"//"+fm); 				 // kh_0330.jpg
		
		
		try {
			mf.transferTo(f);						 // 원본 --> 복사본     file_kh.jpg 
		} catch (Exception e) {
			e.printStackTrace();
		} 							
		
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		
		sqlMap.insert("form.formInsert", dto);
		return "/test/formPro";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("list.jp")
	public String list(Model model){
		List list = sqlMap.queryForList("form.allList", null);
		model.addAttribute("list", list);
		return "/test/list";
	}
	
	
	
	/*@RequestMapping("formPro3.jp")
	public String testPro3(String id, String pw){
		// DI 방식 		
		System.out.println("=33=="+id);
		System.out.println(pw);
		return "/test/formPro";
	}
	
	@RequestMapping("formPro.jp")
	public String testPro(HttpServletRequest request){
		// JSP 방식 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		return "/test/formPro";
	}*/
}







