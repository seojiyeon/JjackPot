package jackpot.bean;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.apDocDTO;
import jackpot.DTO.empDTO;
import jackpot.DTO.workDTO;

@Controller
public class ApproBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/listApproDoc.jp")
	public String listApproDoc(HttpServletRequest request, HttpSession session, Model model){
		String result = "main";
		if(session.getAttribute("memId") != null){
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
			String temp_num = UUID.randomUUID().toString();
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			//int id = (Integer)session.getAttribute("memId"); 
			String workPlace = (String)session.getAttribute("workplace");
			
			apDocDTO dto = new apDocDTO();
			workDTO workdto = new workDTO();
			
			workdto.setEmp_num(emp_num);
			
			dto = (apDocDTO) sqlMap.queryForObject("approSQL.docu_content",no);
			
			System.out.println(temp_num);
			return "/appro/work/listApproDoc";
		}
		
		return result;
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
	
	@RequestMapping("/apLine.jp")
	public String apLine(){
		/*String result = "main.jp";
		if(session.getAttribute("memId") != null){
			int no = Integer.parseInt(request.getParameter("no"));
			String temp_num = request.getParameter("temp_num");
			List Companydto = new ArrayList();
			
			int count = (Integer)sqlMap.queryForObject("jpSQL.CompanyCount");
			List[] wpdto = new ArrayList[count];
			Companydto = sqlMap.queryForList("jpSQL.getCompany");
			Object[] cpdto = Companydto.toArray();
			String[] code = new String[count];
			for (int i = 0; i < cpdto.length; i++) {
				code[i] = "%" + ((companyDTO) cpdto[i]).getCcode2();
				wpdto[i] = sqlMap.queryForList("jpSQL.getWorkplace", code[i]);
			}
			
			int wcount = 0;
			String[] Wcode = null;
			List wpcode = new ArrayList();
			for (int i = 0; i < wpdto.length; i++) {
				for (int j = 0; j < wpdto[i].size(); j++) {
					Wcode = new String[wpdto[i].size()];
					Wcode[j] = ((wpDTO) wpdto[i].get(j)).getWcode1();
					Wcode[j] += ((wpDTO) wpdto[i].get(j)).getWcode2();
					wpcode.add(Wcode[j]);
					wcount++;
				}
			}
			
			List[] dpdto = new ArrayList[wcount];
			for(int i = 0; i < wcount; i++){
				dpdto[i] = sqlMap.queryForList("jpSQL.getDp",wpcode.get(i).toString());
			}
			
			request.setAttribute("temp_num",temp_num);
			request.setAttribute("dpdto", dpdto);
			request.setAttribute("dto", Companydto);
			request.setAttribute("count", count);
			request.setAttribute("wpdto", wpdto);
			request.setAttribute("no", no);
			result = "/appro/apline.jsp";
		}
		
		return result;
		*/
		return "/appro/apLine";
	}
	
	@RequestMapping("/test.jp")
	public String test(HttpSession session, Model model){
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
	
		return "/appro/test";
	}
	
}
