package jackpot.bean;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.apDecDTO;
import jackpot.DTO.apListTodoDTO;
import jackpot.DTO.apStyleDTO;
import jackpot.DTO.approDTO;
import jackpot.DTO.empDTO;
import jackpot.DTO.msgDTO;
import jackpot.DTO.participantsDTO;
import jackpot.DTO.workDTO;

@Controller
public class ApproBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/listApproDoc.jp")
	public String listApproDoc(HttpServletRequest request, HttpSession session, Model model, approDTO dto){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			int stnum = (Integer.parseInt(request.getParameter("style_num")));
			String style_type = request.getParameter("style_type");
			String emp_num = (String) session.getAttribute("memId"); //session���� Id ���� �޾ƿͼ� emp_num�� ����.
			empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
			int emp_position = edto.getPosition();
			int emp_department = edto.getDepartment();
			int emp_branch = edto.getBranch();
			int count = (int)sqlMap.queryForObject("approSQL.approCnt", emp_num);
			List articleList = null;
			articleList = sqlMap.queryForList("msg.msgFind", emp_num);
			String position_name = (String) sqlMap.queryForObject("approSQL.position", emp_position);
			String department_name= (String) sqlMap.queryForObject("approSQL.department", emp_department);
			String branch_name= (String) sqlMap.queryForObject("approSQL.branch", emp_branch);
			String emp_name = edto.getEmp_name();
			
			model.addAttribute("doc_division", style_type);
			model.addAttribute("style_num",stnum);
			model.addAttribute("count",count);
			model.addAttribute("articleList",articleList);
			model.addAttribute("emp_num",emp_num);
			model.addAttribute("emp_name",emp_name);
			model.addAttribute("emp_position",emp_position);
			model.addAttribute("emp_department",emp_department);
			model.addAttribute("emp_branch",emp_branch);
			model.addAttribute("position_name",position_name);
			model.addAttribute("department_name",department_name);
			model.addAttribute("branch_name",branch_name);
			String temp_num = UUID.randomUUID().toString();
			
		    List<participantsDTO> participants = sqlMap.queryForList("calendar.getparticipants", null);
		    model.addAttribute("participants" , participants);
			workDTO workdto = new workDTO();
			workdto.setEmp_num(emp_num);
			request.setAttribute("temp_num", temp_num);
			request.setAttribute("workdto", workdto);
			request.setAttribute("edto", edto);
			
			return "/appro/work/listApproDoc";
		}
		
		return result;
	}
	
	@RequestMapping("/listApproDocPro.jp")
	public String listApproDocPro(MultipartHttpServletRequest request, HttpSession session,Model model) throws Exception {
		String result = "/emp/loginform";
		approDTO adto = new approDTO();
		apDecDTO ddto = new apDecDTO();
		if(session.getAttribute("memId") != null){
			int doc_state = Integer.parseInt(request.getParameter("doc_step"));
			String approver_num = request.getParameter("approver_num");
			String emp_name = request.getParameter("emp_name");
			int position = Integer.parseInt(request.getParameter("position"));
			int department = Integer.parseInt(request.getParameter("department"));
			int branch = Integer.parseInt(request.getParameter("branch"));
			String doc_title = request.getParameter("doc_title");
			String style_num = request.getParameter("style_num");
			String doc_division = request.getParameter("doc_division");
			String pendency = "미결";
			String emp_num = (String) session.getAttribute("memId"); //세션에 저장된 로그인한 아이디 값을 변수로 저장.
			String doc_content = request.getParameter("doc_content"); // ckeditor 작성한 부분을 변수로 저장.
			String doc_date = request.getParameter("doc_date"); //기안날짜 뷰에서 받아와서 저장.
			
			if(doc_state == 0){
				adto.setDoc_state(pendency);
			}
			
			participantsDTO pdto = (participantsDTO)sqlMap.queryForObject("approSQL.decision_info",approver_num);
			ddto.setDec_branch(pdto.getBranch());
			ddto.setDec_depart(pdto.getDepartment());
			ddto.setDec_empnum(pdto.getEmp_num());
			ddto.setDec_name(pdto.getEmp_name());
			ddto.setDec_position(pdto.getPosition());
			
			adto.setDoc_content(doc_content); //dto에 글 작성 부분 세팅
			adto.setAp_time(new Timestamp(System.currentTimeMillis())); // dto에 현재 시간 값 세팅.
			adto.setDoc_date(doc_date);
			adto.setEmp_num(emp_num);
			adto.setEmp_name(emp_name);
			adto.setDoc_title(doc_title);
			adto.setStyle_num(style_num);
			adto.setDoc_division(doc_division);
			adto.setDepartment(department);
			adto.setPosition(position);
			adto.setBranch(branch);

			sqlMap.insert("approSQL.approInsert", adto);
			int doc_num = (Integer)sqlMap.queryForObject("approSQL.doc_maxnum",null);
			ddto.setDoc_num(doc_num);
			ddto.setAppro_state(adto.getDoc_state());
			request.setAttribute("ddto",ddto);
			sqlMap.insert("approSQL.decision_insert", ddto);

			return "/appro/work/listApproDocPro";
		}
		
		return result;
	}
	
	@RequestMapping("/approverFind.jp")
	public @ResponseBody List approver_info(HttpServletRequest request,HttpServletResponse response ,empDTO edto){
		String approver = request.getParameter("ap");
		System.out.println(approver);
		List <empDTO> approver_info = (List<empDTO>)sqlMap.queryForList("approSQL.approver_find", approver);
	
		System.out.println(approver_info);
		return approver_info;
		
	}
	
	@RequestMapping("/viewApproDoc.jp")
	public String viewApproDoc(HttpServletRequest request, HttpSession session,Model model){
		String emp_num = (String)session.getAttribute("memId");
		model.addAttribute("emp_num",emp_num);
		int doc_num = Integer.parseInt(request.getParameter("doc_num"));
		String drafter_num = (String)request.getParameter("emp_num");
		approDTO adto = (approDTO)sqlMap.queryForObject("approSQL.TodoApproval",doc_num);
		System.out.println(adto);
		request.setAttribute("adto", adto);
		return "/appro/work/viewApproDoc";
	}
	
	@RequestMapping("/listApproTemp.jp")
	public String listApprTemp(){
		return "/appro/work/listApproTemp";
	}
	
	
	@RequestMapping("/listApproMyRequest.jp")
	public String listApproMyRequest(HttpSession session,Model model){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String)session.getAttribute("memId");
			model.addAttribute("emp_num",emp_num);
			System.out.println(emp_num);
			List articleList = new ArrayList();		
			articleList = sqlMap.queryForList("approSQL.listApproMy",emp_num);
			model.addAttribute("articleList",articleList);
			System.out.println(articleList);
			return "/appro/work/listApproMyRequest";
		}
		return result;
	}
	
	@RequestMapping("/listApproTodo.jp")
	public String listApproTodo(HttpSession session,Model model){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String) session.getAttribute("memId");
			model.addAttribute("emp_num",emp_num);
			List articleList = new ArrayList();
			System.out.println(emp_num);
			articleList = sqlMap.queryForList("approSQL.listApproTodo",emp_num);
			model.addAttribute("articleList",articleList);
			System.out.println(articleList);
			return "/appro/work/listApproTodo";
		}
		return result;
		
	}
	
	@RequestMapping("/listApproForm.jp")
	public String listApprForm(Model model,approDTO dto,apStyleDTO sdto){
		List articleList = new ArrayList();
		articleList = sqlMap.queryForList("approSQL.listAppro_style",sdto);
		int doc_count = (int)sqlMap.queryForObject("approSQL.doc_count", null);
		
		model.addAttribute("list",articleList);
		model.addAttribute("doc_count",doc_count);
		return "/appro/work/listApproForm";
	}

	@RequestMapping("/approAdminForm.jp")
	public String approAdminForm(){
		return "/appro/admin/approAdminForm";
	}

	
	@RequestMapping("/listApproComplete.jp")
	public String listApproComplete(Model model,HttpSession session){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String)session.getAttribute("memId");
			model.addAttribute("emp_num",emp_num);
			System.out.println(emp_num);
			List articleList = new ArrayList();		
			articleList = sqlMap.queryForList("approSQL.listApproCom",emp_num);
			model.addAttribute("articleList",articleList);
			System.out.println(articleList);
			return "/appro/work/listApproComplete";
		}
	return result;
	}
	
	@RequestMapping("/listApproAll.jp")
	public String listApproAll(Model model,HttpSession session){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String)session.getAttribute("memId");
			model.addAttribute("emp_num",emp_num);
			System.out.println(emp_num);
			List articleList = new ArrayList();		
			articleList = sqlMap.queryForList("approSQL.listApproAll",emp_num);
			model.addAttribute("articleList",articleList);
			System.out.println(articleList);
			return "/appro/work/listApproAll";
		}
	return result;
	}
	
	@RequestMapping("/listApproReturn.jp")
	public String listApproReturn(Model model,approDTO adto){
		/*List articleList = null;
		articleList = sqlMap.queryForList("", adto);
		
		model.addAttribute("list",articleList);*/
		
	return "/appro/work/listApproReturn";
	}
	
	@RequestMapping("/listApproRefer.jp")
	public String listApproRefer(Model model,approDTO adto){
		/*List articleList = null;
		articleList = sqlMap.queryForList("", adto);
		
		model.addAttribute("list",articleList);*/
		
	return "/appro/work/listApproRefer";
	}
	
	@RequestMapping("/listApproCoop.jp")
	public String listApproCoop(HttpServletRequest request, HttpSession session, Model model, approDTO dto, msgDTO mdto){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String) session.getAttribute("memId"); //session���� Id ���� �޾ƿͼ� emp_num�� ����.
			empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
			int emp_position = edto.getPosition();
			int emp_department = edto.getDepartment();
			int count = (int)sqlMap.queryForObject("approSQL.approCnt", emp_num);
			
		
			List articleList = null;
			articleList = sqlMap.queryForList("msg.msgFind", emp_num);
			String position_name = (String) sqlMap.queryForObject("approSQL.position", emp_position);
			String department_name= (String) sqlMap.queryForObject("approSQL.department", emp_department);
			String emp_name = edto.getEmp_name();
			model.addAttribute("count",count);
			model.addAttribute("articleList",articleList);
			model.addAttribute("emp_num",emp_num);
			model.addAttribute("emp_name",emp_name);
			model.addAttribute("emp_position",emp_position);
			model.addAttribute("emp_department",emp_department);
			model.addAttribute("position_name",position_name);
			model.addAttribute("department_name",department_name);
			String temp_num = UUID.randomUUID().toString();
			
		      List<participantsDTO> participants = sqlMap.queryForList("calendar.getparticipants", null);
		      model.addAttribute("participants" , participants);
			

			//int doc_num = Integer.parseInt(request.getParameter("doc_num"));
			
			//int id = (Integer)session.getAttribute("memId"); 
			//String workPlace = (String)session.getAttribute("workplace");
			
			workDTO workdto = new workDTO();
			
			workdto.setEmp_num(emp_num);
			
			//dto = (apDocDTO) sqlMap.queryForObject("approSQL.docu_content",doc_num);
			//workdto = (workDTO)sqlMap.queryForObject("approSQL.workInfo",workdto);
			
			request.setAttribute("temp_num", temp_num);
			//request.setAttribute("doc_num", doc_num);
			request.setAttribute("workdto", workdto);
			request.setAttribute("edto", edto);
			
			
			return "/appro/work/listApproCoop";
		}
		
		return result;
	}
	
	@RequestMapping("/listApproOfficial.jp")
	public String listApproOfficial(HttpServletRequest request, HttpSession session, Model model, approDTO dto, msgDTO mdto){
		String result = "/emp/loginform";
		if(session.getAttribute("memId") != null){
			String emp_num = (String) session.getAttribute("memId"); //session���� Id ���� �޾ƿͼ� emp_num�� ����.
			empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
			int emp_position = edto.getPosition();
			int emp_department = edto.getDepartment();
			int count = (int)sqlMap.queryForObject("approSQL.approCnt", emp_num);
		
			List articleList = null;
			articleList = sqlMap.queryForList("msg.msgFind", emp_num);
			String position_name = (String) sqlMap.queryForObject("approSQL.position", emp_position);
			String department_name= (String) sqlMap.queryForObject("approSQL.department", emp_department);
			String emp_name = edto.getEmp_name();
			model.addAttribute("count",count);
			model.addAttribute("articleList",articleList);
			model.addAttribute("emp_num",emp_num);
			model.addAttribute("emp_name",emp_name);
			model.addAttribute("emp_position",emp_position);
			model.addAttribute("emp_department",emp_department);
			model.addAttribute("position_name",position_name);
			model.addAttribute("department_name",department_name);
			String temp_num = UUID.randomUUID().toString();
			
		      List<participantsDTO> participants = sqlMap.queryForList("calendar.getparticipants", null);
		      model.addAttribute("participants" , participants);
			

			//int doc_num = Integer.parseInt(request.getParameter("doc_num"));
			
			//int id = (Integer)session.getAttribute("memId"); 
			//String workPlace = (String)session.getAttribute("workplace");
			
			workDTO workdto = new workDTO();
			
			workdto.setEmp_num(emp_num);
			
			//dto = (apDocDTO) sqlMap.queryForObject("approSQL.docu_content",doc_num);
			//workdto = (workDTO)sqlMap.queryForObject("approSQL.workInfo",workdto);
			
			request.setAttribute("temp_num", temp_num);
			//request.setAttribute("doc_num", doc_num);
			request.setAttribute("workdto", workdto);
			request.setAttribute("edto", edto);
			
			
			return "/appro/work/listApproOfficial";
		}
		
		return result;
	}
}
