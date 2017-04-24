package jackpot.bean;

import java.io.File;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

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
	      String color = "";
	      String allDay = "false";
	      result2 = sqlMap.queryForList("calendar.calendarList", null);
	         for(int i=0; i<result2.size(); i++){   
	            Map<String, Object> map = new HashMap<String, Object>();
	            title = ((calendarDTO) result2.get(i)).getCl_title();
	            start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	            end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	            if(title.equals("회사일정")){color="#F78088";}
	            if(title.equals("지점일정")){color="#FFAE28";}
	            if(title.equals("부서일정")){color="#CDA8FF";}
	            if(title.equals("개인업무")){color="#82E898";}
	            if(title.equals("출장")){color="#FFA1D4";}
	            if(title.equals("연차")){color="#3498DB";}
	            
	            if(!end.equals("nullTnull")){ // end가 null이 아닐 때 실행
		            SimpleDateFormat mydate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		            String st = ((calendarDTO) result2.get(i)).getCl_sdate()+" "+((calendarDTO) result2.get(i)).getCl_stime();
		            String en = ((calendarDTO) result2.get(i)).getCl_edate()+" "+((calendarDTO) result2.get(i)).getCl_etime();
		            try {
						Date sdate = mydate.parse(st);
						Date edate = mydate.parse(en);
						int check = (int) ((long) (edate.getTime() - sdate.getTime()) / ((long)24*60*60*1000));
						if(check>=1){
							allDay="true";
							map.put("allDay", allDay);
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
	            }
	            
	            map.put("title", title);
	            map.put("start", start);
	            map.put("end", end);
	            map.put("color", color);
	            map.put("id",((calendarDTO) result2.get(i)).getCl_num());
	            result.add(map);           
	            }
		return result;
	}

	@RequestMapping("/calendarcontents.jp")
	public @ResponseBody calendarDTO contents(HttpServletRequest request,HttpServletResponse response ,calendarDTO cdto){
		String id = request.getParameter("id");
		calendarDTO contents = (calendarDTO) sqlMap.queryForObject("calendar.getcontents", id);
		return contents;
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
		  if(!(mf.getSize()==0)){
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
		  	  }
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
		  
		return "/calendar/calendar";
	}
	@RequestMapping("/calendardelete.jp")
	public String delete(HttpServletRequest request){
		String cl_num= request.getParameter("id");
		String path = request.getRealPath("save");
		String cl_sys = (String) sqlMap.queryForObject("calendar.getSysname", cl_num);

		try {
			File f = new File(path+"\\"+cl_sys);
			if(f.exists()) {
				f.delete();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		sqlMap.delete("calendar.delete", cl_num);
		return "/calendar/calendar";
	}
	
	@RequestMapping("/calendarFiledown.jp")
	public ModelAndView filedown(String fileName, HttpServletRequest request){
		String dir = request.getRealPath("save");
		File f = new File(dir+"//"+fileName);
		ModelAndView mv = new ModelAndView("down", "downloadFile", f);
		return mv;
	}
}
