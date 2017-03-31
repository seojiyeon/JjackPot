package jackpot.bean;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import jackpot.DTO.empDTO;
import jackpot.DTO.orgDTO;


@Controller
public class EmpBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	@RequestMapping("/inputForm.jp")
	public String inputForm(){
		return "/emp/inputForm";
	}
	
	@RequestMapping("/inputPro.jp")
	public String inputPro(MultipartHttpServletRequest multi){
		  empDTO dto = new empDTO();
		  dto.setEmp_num(multi.getParameter("emp_num"));
		  dto.setPw(multi.getParameter("pw"));
		  dto.setEmp_name(multi.getParameter("emp_name"));
		  dto.setAddress(multi.getParameter("address"));
		  dto.setPhone(multi.getParameter("phone"));
		  dto.setMail(multi.getParameter("mail"));
		  dto.setBirthday(multi.getParameter("birthday"));
		  dto.setHiredate(multi.getParameter("hiredate"));
		  dto.setEmp_point(Integer.parseInt(multi.getParameter("emp_point")));
		  dto.setDepartment(Integer.parseInt(multi.getParameter("department")));
		  dto.setRank(Integer.parseInt(multi.getParameter("rank" )));
		  dto.setBranch(Integer.parseInt(multi.getParameter("branch" )));
		  dto.setPosition(Integer.parseInt(multi.getParameter("position" )));
		  
		  
		  String path=multi.getRealPath("save");
		  MultipartFile mf = multi.getFile("profilephoto");
		  String orgname=mf.getOriginalFilename();
		  String ext = orgname.substring(orgname.lastIndexOf("."));
		  String savename="profile_"+dto.getEmp_num()+ext;
		  File f=new File(path+"//"+savename);
		  try{
			  mf.transferTo(f);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setProfilephoto(savename);
		  
		  
		  MultipartFile mf2 = multi.getFile("signimg");
		  String orgname2=mf.getOriginalFilename();
		  String ext2 = orgname2.substring(orgname2.lastIndexOf("."));
		  String savename2="sign_"+dto.getEmp_num()+ext2;
		  File f2=new File(path+"//"+savename2);
		  try{
			  mf2.transferTo(f2);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setSignimg(savename2);
		  
		  sqlMap.insert("employee.insertMember", dto);
		  
		return "/emp/inputPro";
	}
	
	@RequestMapping("loginform.jp")
	public String loginform(){
		
		return "/emp/loginform";
	}

	
	@RequestMapping(value="loginPro.jp",params={"emp_num","pw"})
	public String loginPro(empDTO dto , HttpSession session,Model model){
		
		int check = (Integer)sqlMap.queryForObject("employee.userCheck", dto);
		if(check==1){
			
			session.setAttribute("memId", dto.getEmp_num());
		}
		model.addAttribute("check" , new Integer(check));
		return "/emp/loginPro";
	}
	
	
	@RequestMapping("modifyForm.jp")
	public String modifyForm( HttpSession session,Model model){
		String emp_num = (String)session.getAttribute("memId");
		empDTO dto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
		
		model.addAttribute("dto" , dto);
		return "/emp/modifyForm";
	}
	
	@RequestMapping("modifyPro.jp")
	public String modifyPro(MultipartHttpServletRequest multi ,HttpSession session){
		
		String emp_num = (String)session.getAttribute("memId");
		System.out.println(emp_num);
		
		 empDTO dto = new empDTO();
		 dto.setEmp_num(multi.getParameter("emp_num"));
		 dto.setPw(multi.getParameter("pw"));
		 dto.setAddress(multi.getParameter("address"));
		 dto.setPhone(multi.getParameter("phone"));
		 dto.setMail(multi.getParameter("mail"));
		 dto.setBirthday(multi.getParameter("birthday"));
		 dto.setProfilephoto(multi.getParameter("profilephoto"));
		 dto.setSignimg(multi.getParameter("signimg"));
		
		 
		 String path=multi.getRealPath("save");
		 
			 
		  MultipartFile mf = multi.getFile("profilephoto");
		  String orgname=mf.getOriginalFilename();
		  
		      System.out.println(orgname);
		
		      if(orgname!=""){
		    	  System.out.println(orgname);
		  String ext = orgname.substring(orgname.lastIndexOf("."));
		  String savename="profile_"+dto.getEmp_num()+ext;
		  File f=new File(path+"//"+savename);
		  try{
			  mf.transferTo(f);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setProfilephoto(savename);
		  }
		  
		  
		  MultipartFile mf2 = multi.getFile("signimg");
		  String orgname2=mf2.getOriginalFilename();
		      System.out.println(orgname2);
		      
		  if(orgname2!= ""){
			  System.out.println(orgname2);
		  String ext2 = orgname2.substring(orgname2.lastIndexOf("."));
		  String savename2="sign_"+dto.getEmp_num()+ext2;
		  File f2=new File(path+"//"+savename2);
		  try{
			  mf2.transferTo(f2);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setSignimg(savename2);
		
		  }
		  
		  sqlMap.update("employee.updateMember",dto);
		return "/emp/modifyPro";
	}
	
	@RequestMapping("logout.jp")
	public String logout(HttpSession session){
		session.invalidate();
		return "/emp/logout";
	}
	
	@RequestMapping("delete.jp")
	public String deleteForm(){
		return "/emp/delete";
	}
	
	@RequestMapping("deletePro.jp")
	public String deletePro(empDTO dto,HttpSession session,Model model){
		String emp_num=(String) session.getAttribute("memId");
		dto.setEmp_num(emp_num);
		int check =(Integer)sqlMap.queryForObject("employee.userCheck", dto);
           if(check==1){
			
			  sqlMap.delete("employee.deletePro", dto);
			session.invalidate();
		}
           model.addAttribute("check",new Integer(check) );
           
		return "/emp/deletePro";
		
	}
	
	@RequestMapping("confirm.jp")
	public String confirm(empDTO dto,Model model){
		String IdCheck = (String)sqlMap.queryForObject("employee.comfirmCheck", dto);
		boolean check;
		
		if(IdCheck != null){
			check=true;
		}else{
			check=false;
		}
			model.addAttribute("check", check);
		
			model.addAttribute("emp_num", dto.getEmp_num());
		
		
		return "/emp/confirm";
	}
	
	
	
	@RequestMapping("orgChart.jp")
	public String orgChart(orgDTO dto,Model model,HttpSession session){
		String emp_num=(String) session.getAttribute("memId");
		System.out.println(emp_num);
	   int department = (int)sqlMap.queryForObject("org.emp_department", emp_num);
		System.out.println(department);
		List articleList = null;

		articleList = sqlMap.queryForList("org.member2",department);
		model.addAttribute("articleList", articleList);
		
		return "/emp/orgChart";
	}
	
	
	@RequestMapping("searchORG.jp")
	public String searchORG(Model model,HttpServletRequest request){
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(searchName);
		System.out.println(searchValue);
		
		HashMap map = new HashMap();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
		List list = sqlMap.queryForList("org.search", map);
		
		
		model.addAttribute("list", list);
		
		
		return "/emp/searchORG";
		
	}
	
	
	
}
