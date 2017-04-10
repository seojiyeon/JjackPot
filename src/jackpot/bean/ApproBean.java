package jackpot.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import jackpot.DTO.approDTO;

@Controller
public class ApproBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/listApproDoc.jp")
	public String listApproDoc(MultipartHttpServletRequest multi){
		approDTO dto = new approDTO();
		dto.setDoc_num(multi.getParameter("doc_num"));
		dto.setDoc_date(multi.getParameter("doc_date"));
		dto.setDoc_finish(multi.getParameter("doc_finish"));
		dto.setEmp_num(multi.getParameter("emp_num"));
		dto.setEmp_name(multi.getParameter("emp_name"));
		dto.setDoc_title(multi.getParameter("doc_title"));
		dto.setDoc_content(multi.getParameter("doc_content"));
		dto.setStyle_num(multi.getParameter("style_num"));
		dto.setDoc_division(multi.getParameter("doc_division"));
		dto.setStart_work(multi.getParameter("start_work"));
		dto.setEnd_work(multi.getParameter("end_work"));
		dto.setDoc_state(multi.getParameter("doc_state"));
		dto.setDoc_count(multi.getParameter("doc_count"));
		dto.setDoc_step(multi.getParameter("doc_step"));
		dto.setBranch(Integer.parseInt(multi.getParameter("branch")));
		dto.setDepartment(Integer.parseInt(multi.getParameter("department")));
		dto.setPosition(Integer.parseInt(multi.getParameter("position")));
		
		sqlMap.insert("approval.insertApproForm", dto);
		
		return "/appro/work/listApproDoc";
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
