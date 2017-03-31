package jackpot.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.calendarDTO;
import jackpot.DTO.empDTO;

@Controller
public class CalendarBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   

	@RequestMapping("/calendar.jp")
	public String main(Model model){
		List cl_list = sqlMap.queryForList("calendar.calendarList", null);
		model.addAttribute("cl_list", cl_list);
		System.out.println(cl_list);
		return "/calendar/calendar";
	}
	
	@RequestMapping("/calendarcontents.jp")
	public String contents(){
		return "/calendar/calendarcontents";
	}
	
	@RequestMapping("/calendarinsert.jp")
	public String insert(){
		return "/calendar/calendarinsert";
	}
	
	@RequestMapping("/calendarPro.jp")
	public String insertPro(calendarDTO dto, MultipartHttpServletRequest multi, HttpSession session){
		
		  calendarDTO cdto = new calendarDTO();
		  int max = (Integer)sqlMap.queryForObject("calendar.maxnum", null);
		  MultipartFile mf = multi.getFile("file");
		  String path=multi.getRealPath("save");
		  String org=mf.getOriginalFilename();
		  String ext = org.substring(org.lastIndexOf("."));
		  String sys ="file_"+max+ext;
		  File f = new File(path+"//"+sys);
		  try{
			  mf.transferTo(f);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  cdto.setCl_sys(sys);
		  cdto.setCl_org(mf.getOriginalFilename());
	
		String emp_num = (String)session.getAttribute("memId");
		empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);

		  cdto.setCl_title(multi.getParameter("title"));
		  cdto.setCl_subject(multi.getParameter("subject"));
		  cdto.setCl_place(multi.getParameter("place"));
		  cdto.setCl_sdate(multi.getParameter("sdate"));
		  cdto.setCl_stime(multi.getParameter("stime"));
		  cdto.setCl_edate(multi.getParameter("edate"));
		  cdto.setCl_etime(multi.getParameter("etime"));
		  cdto.setCl_participants(edto.getBranch()+" "+edto.getEmp_name()+" "+edto.getPosition());
		  cdto.setCl_contents(multi.getParameter("contents" ));
		  cdto.setCl_writer(edto.getEmp_name());
		
		  sqlMap.insert("calendar.insertCalendar",cdto);
		  
		return "/calendar/calendarPro";
	}
}
