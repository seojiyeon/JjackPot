package jackpot.bean;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.voteDTO;

@Controller
public class voteBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	@RequestMapping("/Vform.jp")
	public String Vform(){
		
		return "/vote/Vform";
	}
	
	
	@RequestMapping("/VformPro.jp")
	public String VformPro(HttpSession session,MultipartHttpServletRequest multi){

		String emp_num = (String)session.getAttribute("memId");
		voteDTO dto= new voteDTO();
		
		dto.setJilmoon(multi.getParameter("jilmoon"));
		dto.setEmp_num(multi.getParameter("emp_num"));
		dto.setMonhang(multi.getParameter("monhang"));
		dto.setMonhang2(multi.getParameter("monhang2"));
		
		String path=multi.getRealPath("save");
		MultipartFile mf=multi.getFile("up_img");
		String orgname=mf.getOriginalFilename();
		String ext=orgname.substring(orgname.lastIndexOf("."));
		String savename="img_"+dto.getEmp_num()+ext;
		File f=new File(path+"//"+savename);
		try{
			  mf.transferTo(f);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setUp_img(savename);
		
		  
		  
		  MultipartFile mf2 = multi.getFile("up_img2");
		  String orgname2=mf.getOriginalFilename();
		  String ext2 = orgname2.substring(orgname2.lastIndexOf("."));
		  String savename2="img2_"+dto.getEmp_num()+ext2;
		  File f2=new File(path+"//"+savename2);
		  try{
			  mf2.transferTo(f2);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setUp_img2(savename2);
		  
		  sqlMap.insert("vote.insertVote", dto);
		
		  return "/vote/VformPro";
	}
}
