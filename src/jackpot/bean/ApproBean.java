package jackpot.bean;

import java.util.List;

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
	public String listApproDoc(HttpSession session, Model m){
		long emp_num = (Long) session.getAttribute("id");
		empDTO edto = (empDTO) sqlMap.queryForObject("emp.select_emp", emp_num);
		List<empDTO> emp_name = sqlMap.queryForList("emp.emp_name", null);
		m.addAttribute("nameList",emp_name);
		m.addAttribute("edto", edto);		
		
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
