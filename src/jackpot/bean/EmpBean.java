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
import jackpot.DTO.favDTO;
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
	public String orgChart(Model model,HttpSession session,HttpServletRequest request){
           
			String empfav=(String) session.getAttribute("memId");
			
			
			System.out.println(empfav);			
			int department = (int)sqlMap.queryForObject("org.emp_department", empfav);
			
			
			List articleList = null;
			articleList = sqlMap.queryForList("org.member2",department);
			model.addAttribute("articleList", articleList);
			
			List list=null;
			
			list=sqlMap.queryForList("org.favlike", empfav);
			model.addAttribute("list",list);
			
			
			
			
		return "/emp/orgChart";
	}
	
	@RequestMapping("orgChartPro.jp")
	public String orgChartPro(favDTO dto,Model model,HttpSession session,HttpServletRequest request){

		String empfav = (String)session.getAttribute("memId");
		String [] emp_num = request.getParameterValues("emp_num");
//					1,2


		for(String en : emp_num){
			dto.setEmp_num(en);
			dto.setEmpfav(empfav);
			
			if(empfav.equals(en)){
				model.addAttribute("check",new Integer(2));
				continue;
			}
			
			int check =(Integer)sqlMap.queryForObject("org.favcheck", dto);
			System.out.println("count="+check);
			
	        if(check==0){
	        	sqlMap.insert("org.insertfav",dto);
			}
	        model.addAttribute("check",new Integer(check));
	       
		}
                    
		return "/emp/orgChartPro";
	}
	
	
	@RequestMapping("addfav.jp")
	public String addfav(HttpServletRequest request,HttpSession session,Model model){


		return "/emp/addfav";
		
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
	
	
	@RequestMapping("orgChartDEL.jp")
	public String orgChartDEL(favDTO dto,HttpSession session,HttpServletRequest request){
		String empfav=(String) session.getAttribute("memId");
		String [] emp_num = request.getParameterValues("emp_num");
		
       for(String en : emp_num){
    		dto.setEmp_num(en);
			dto.setEmpfav(empfav);
			  sqlMap.delete("org.favdelete", dto);
       }
          
           
		return "/emp/orgChartDEL";
		
	}

	@RequestMapping("Allorg.jp")
	public String Allorg(Model model,HttpSession session,HttpServletRequest request){

			String empfav=(String) session.getAttribute("memId");
			String [] emp_num = request.getParameterValues("emp_num");

			System.out.println(empfav);		
		
			int department = (int)sqlMap.queryForObject("org.emp_department",empfav);
			
			System.out.println(emp_num);		
			
			List articleList = null;
			articleList = sqlMap.queryForList("org.allorg",department);
			
			List list=null;
			list=sqlMap.queryForList("org.allorg2",department);
			
			List list2=null;
			list2=sqlMap.queryForList("org.allorg3",department);
			
			List list3=null;
			list3=sqlMap.queryForList("org.allorg4",department);
			
			List list4=null;
			list4=sqlMap.queryForList("org.allorg5",department);
			
			List list5=null;
			list5=sqlMap.queryForList("org.allorg6",department);
			
			
			
			model.addAttribute("articleList", articleList);
			model.addAttribute("list", list);
			model.addAttribute("list2", list2);
			model.addAttribute("list3", list3);
			model.addAttribute("list4", list4);
			model.addAttribute("list5", list5);
			
			

			
		return "/emp/Allorg";
	}
	
}
