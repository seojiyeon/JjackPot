package jackpot.bean;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.empDTO;

@Controller
public class ApproBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/listApproDoc.jp")
	public String listApproDoc(HttpSession session, Model model){
		String emp_num = (String) session.getAttribute("memId"); //session에서 Id 값을 받아와서 emp_num에 저장. 
		empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
		int emp_position = edto.getPosition();
		int emp_department = edto.getDepartment();
		String position = (String) sqlMap.queryForObject("approval.position", emp_position);
		String department= (String) sqlMap.queryForObject("approval.department", emp_department);
		String emp_name = edto.getEmp_name();
		model.addAttribute("emp_name",emp_name);
		model.addAttribute("emp_position",position);
		model.addAttribute("emp_department",department);
		System.out.println(department);
	
		
		return "/appro/work/listApproDoc";
	}
	@RequestMapping("/listApproDocPro.jp")
	public String listApproDocPro(HttpSession session, Model m){
	
		
		return "/appro/work/listApproDocPro";
	}
	
	@RequestMapping("/listApproMyRequest.jp")
	public String listApprMyRequest(){
		return "/appro/work/listApproMyRequest";
	}
	
	@RequestMapping("/listApproTemp.jp")
	public String listApprTemp(){
		return "/appro/work/listApproTemp";
	}
	
	@RequestMapping("/listApproTodo.jp")
	public String listApprTodo(){
		return "/appro/work/listApproTodo";
	}
	
	@RequestMapping("/listApproForm.jp")
	public String listApprForm(){
		return "/appro/work/listApproForm";
	}

	@RequestMapping("/approAdminForm.jp")
	public String approAdminForm(){
		return "/appro/admin/approAdminForm";
	}
	
	@RequestMapping("/test.jp")
	public String test(){
		return "/appro/test";
	}
	
}
