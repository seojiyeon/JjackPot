package jackpot.bean;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.calendarDTO;
import jackpot.DTO.empDTO;

@Controller
public class CalendarBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   

	@RequestMapping("/calendar.jp")
	public String main(){
		return "/calendar/calendar";
	}
	
	@RequestMapping("/fullcalendar.jp")
	public String fullcalendar(){
		return "/calendar/FullCalendar";
	}
	@RequestMapping("/getfullcalendar.jp")
	public @ResponseBody List<Map<String, Object>> calendar(calendarDTO cdto, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, HttpSession session){

	      List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
	      List result2 = new ArrayList();
	      String title = "";
	      String start = "";
	      String end = "";
	      result2 = sqlMap.queryForList("calendar.calendarList", null);
	      System.out.println(result2);
	         for(int i=0; i<result2.size(); i++){   
	            Map<String, Object> map = new HashMap<String, Object>();
	            title = ((calendarDTO) result2.get(i)).getCl_title();
	            start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	            end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	            System.out.println(((calendarDTO) result2.get(i)).getCl_title());
	            System.out.println(((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime());
	            System.out.println(((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime());
	            map.put("title", title);
	            map.put("start", start);
	            map.put("end", end);
	            result.add(map);
	         	}
	         System.out.println(result);
		return result;
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
