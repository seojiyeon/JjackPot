package jackpot.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.apDocDTO;
import jackpot.DTO.approDTO;
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
			String emp_num = (String) session.getAttribute("memId"); //session���� Id ���� �޾ƿͼ� emp_num�� ����. 
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
			System.out.println(temp_num);
			//int doc_num = Integer.parseInt(request.getParameter("doc_num"));
			
			//int id = (Integer)session.getAttribute("memId"); 
			//String workPlace = (String)session.getAttribute("workplace");
			
			apDocDTO dto = new apDocDTO();
			workDTO workdto = new workDTO();
			
			workdto.setEmp_num(emp_num);
			
			//dto = (apDocDTO) sqlMap.queryForObject("approSQL.docu_content",doc_num);
			//workdto = (workDTO)sqlMap.queryForObject("approSQL.workInfo",workdto);
			
			request.setAttribute("temp_num", temp_num);
			//request.setAttribute("doc_num", doc_num);
			request.setAttribute("workdto", workdto);
			request.setAttribute("dto", dto);
			
			
			return "/appro/work/listApproDoc";
		}
		
		return result;
	}
	@RequestMapping("/listApproDocPro.jp")
	public String listApproDocPro(MultipartHttpServletRequest request, approDTO dto, HttpSession session) throws Exception {
		String result = "main";
		if(session.getAttribute("memId") != null){
			///////�ݷ������� �߰��ǰ�, ���ε� ����� �ӽ����� ������ ����/////
			if(dto.getApprover_step() == 0){
				if(dto.getDoc_state() == "�ݷ�"){
					sqlMap.delete("approSQL.comment_delete", dto);
					sqlMap.delete("approSQL.return_delete", dto);
				}
			}
			if(dto.getTemp_num()!=null){
				int check=(Integer)sqlMap.queryForObject("approSQL.temp_check", dto);
				if(check != 0){
					sqlMap.delete("approSQL.temp_delete",dto);
				}
			}
			///////////////////////////////////////////
			
			//////////////////�Խñ� ���////////////////
			
			int approver_step = 1;
			Date now = new Date();
			SimpleDateFormat vans = new SimpleDateFormat("yyMMdd");
			SimpleDateFormat van = new SimpleDateFormat("yyyy-M-d");
			String ww = van.format(now);
			String wdate = vans.format(now);
			String seqNum = (String)sqlMap.queryForObject("approSQL.seqNum", null);
			String ap_Num = wdate + "-" + seqNum;
			
			dto.setDoc_date(ww);
			dto.setDoc_num(ap_Num);
			dto.setApprover_step(approver_step);
			dto.setAp_time(new Timestamp(System.currentTimeMillis()));
			sqlMap.insert("approSQL.approInsert", dto);
			
			/*if(dto.getCategorize().equals("���½�û��")){
				sqlMap.update("approvalSQL.ap_geuntaeUpdate",dto);
			}*/
			
			//////////////////////////////////////////////////////////////
			
			//	ù��° ������ڿ� ���������ڵ� �˶����̺� ���.///////////////////
			
			SimpleDateFormat vann = new SimpleDateFormat("yyyyMMdd");
			String www = vann.format(now);
			String aa = dto.getDoc_finish();
			String [] ee = aa.split("\\-");
			
			String bb = ""+ ee[0]+ee[1]+ee[2];
			int cc = Integer.parseInt(bb)-Integer.parseInt(www);
			if(cc>3){
				sqlMap.insert("approSQL.approalarm", dto);
			}else{
				sqlMap.insert("approSQL.impend_alramInsert1",dto);
			}
			
			//if(dto.getr)
			
			
		}
		
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
	public String test(){
		/*String emp_num = (String) session.getAttribute("memId"); //session���� Id ���� �޾ƿͼ� emp_num�� ����. 
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
	*/
		return "/appro/test";
	}
	
}
