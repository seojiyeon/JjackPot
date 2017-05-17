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
import java.util.StringTokenizer;

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
import jackpot.DTO.participantsDTO;

@Controller
public class CalendarBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   

	@RequestMapping("/calendar.jp")
	public String main(Model model){
		List<participantsDTO> participants = sqlMap.queryForList("calendar.getparticipants", null);
		model.addAttribute("participants" , participants);
		return "/calendar/calendar";
	}
	
	@RequestMapping("/fullcalendar.jp")
	public String fullcalendar(){
		return "/calendar/FullCalendar";
	}
	
	@RequestMapping("/fullcalendar2.jp")
	public String fullcalendar2(){
		return "/calendar/FullCalendar2";
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
	      String emp_num = (String)session.getAttribute("memId");
		  empDTO edto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
	      result2 = sqlMap.queryForList("calendar.calendarList", null);
	      
	         for(int i=0; i<result2.size(); i++){ 
	           if(((calendarDTO)result2.get(i)).getCl_private()!=null){ 
	        	   String participants = ((calendarDTO)result2.get(i)).getCl_participants();
	        	   if(participants.contains(edto.getEmp_num())){
	        		   Map<String, Object> map = new HashMap<String, Object>();
	        		   title = ((calendarDTO) result2.get(i)).getCl_title();
	        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	        		   if(title.equals("개인업무")){color="#82E898";}
	        		   if(!end.equals("nullTnull")){ 
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
	            }  
	         }
	         
	         for(int i=0; i<result2.size(); i++){  // 遺��꽌�씪�젙
		           if(((calendarDTO)result2.get(i)).getDepartment()!=0){
		        	   int department = ((calendarDTO)result2.get(i)).getDepartment();
		        	   int edtoEdpartment = edto.getDepartment();
		        	   if(department == edtoEdpartment) {
		        		   Map<String, Object> map = new HashMap<String, Object>();
		        		   title = ((calendarDTO) result2.get(i)).getCl_title();
		        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
		        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
		        		   if(title.equals("부서일정")){color="#CDA8FF";}
		        		   if(!end.equals("nullTnull")){
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
		            }  
		         }
	         
	         for(int i=0; i<result2.size(); i++){  // 吏��젏�씪�젙
		           if(((calendarDTO)result2.get(i)).getBranch()!=0){
		        	   int branch = ((calendarDTO)result2.get(i)).getBranch();
		        	   int edtobranch = edto.getBranch();
		        	   if(branch == edtobranch) {
		        		   Map<String, Object> map = new HashMap<String, Object>();
		        		   title = ((calendarDTO) result2.get(i)).getCl_title();
		        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
		        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
		        		   if(title.equals("지점일정")){color="#FFAE28";}
		        		   if(!end.equals("nullTnull")){ // end媛� null�씠 �븘�땺 �븣 �떎�뻾
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
		            }  
		         }
	         
	            for(int i=0; i<result2.size(); i++){ // �쉶�궗�씪�젙�� 紐⑤몢 異붽�
		           if(((calendarDTO)result2.get(i)).getCl_title().equals("회사일정")){
		        		   Map<String, Object> map = new HashMap<String, Object>();
		        		   title = ((calendarDTO) result2.get(i)).getCl_title();
		        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
		        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
		        		   if(title.equals("회사일정")){color="#F78088";}
		        		   if(!end.equals("nullTnull")){ // end媛� null�씠 �븘�땺 �븣 �떎�뻾
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
	            	}
	            
	            for(int i=0; i<result2.size(); i++){ // 연차
	 	           if(((calendarDTO)result2.get(i)).getCl_title().equals("연차")){
	 	        	   String participants = ((calendarDTO)result2.get(i)).getCl_participants();
	 	        	   if(participants.contains(edto.getEmp_num())){
	 	        		   Map<String, Object> map = new HashMap<String, Object>();
	 	        		   title = ((calendarDTO) result2.get(i)).getCl_title();
	 	        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	 	        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	 	        		   if(title.equals("연차")){color="#3498DB";}
	 	        		   if(!end.equals("nullTnull")){
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
	 	            }  
	 	         }
	            
	            for(int i=0; i<result2.size(); i++){ // 출장
	 	           if(((calendarDTO)result2.get(i)).getCl_title().equals("출장")){
	 	        	   String participants = ((calendarDTO)result2.get(i)).getCl_participants();
	 	        	   if(participants.contains(edto.getEmp_num())){
	 	        		   Map<String, Object> map = new HashMap<String, Object>();
	 	        		   title = ((calendarDTO) result2.get(i)).getCl_title();
	 	        		   start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	 	        		   end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	 	        		   if(title.equals("출장")){color="#FFA1D4";}
	 	        		   if(!end.equals("nullTnull")){
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
	 	            }  
	 	         }
		return result;
	}

	@RequestMapping("/calendarcontents.jp")
	public @ResponseBody calendarDTO contents(HttpServletRequest request,HttpServletResponse response ,calendarDTO cdto){
		String id = request.getParameter("id");
		calendarDTO contents = (calendarDTO) sqlMap.queryForObject("calendar.getcontents", id);
		String participants ="";
		StringTokenizer st = new StringTokenizer(contents.getCl_participants(), ",");
		while(st.hasMoreTokens()){
			participants = participants + sqlMap.queryForObject("calendar.getparticipantsname", st.nextToken()) +", ";
		};
		contents.setCl_participants(participants);
		return contents;
	}

	@RequestMapping("/calendarPro.jp")
	public String insertPro(calendarDTO dto, MultipartHttpServletRequest multi, HttpSession session,HttpServletRequest request){
		  String cl_num = multi.getParameter("num");
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
		  cdto.setCl_participants(multi.getParameter("participants"));
		  cdto.setCl_contents(multi.getParameter("contents" ));
		  cdto.setCl_writer(edto.getEmp_num());
		  cdto.setBranch(Integer.parseInt(multi.getParameter("branch")));
		  cdto.setDepartment(Integer.parseInt(multi.getParameter("department")));
		  cdto.setCl_private(multi.getParameter("private"));
		  if(cl_num==null){
			  sqlMap.insert("calendar.insertCalendar",cdto);
		  }
		  if(cl_num!=null){
			  cdto.setCl_num(Integer.parseInt(cl_num));
			  if(cdto.getCl_sys()!=null){
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
			  sqlMap.update("calendar.updateCalendar", cdto);
			  }
			  if(cdto.getCl_sys()==null){
		      sqlMap.update("calendar.updateCalendar2", cdto);	  
			  }
		  }
		return "/calendar/calendarReFresh";
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
		return "/calendar/calendarReFresh";
	}
	
	@RequestMapping("/calendarFiledown.jp")
	public ModelAndView filedown(String fileName, HttpServletRequest request){
		String dir = request.getRealPath("save");
		File f = new File(dir+"//"+fileName);
		ModelAndView mv = new ModelAndView("down", "downloadFile", f);
		return mv;
	}
	
	@RequestMapping("/addparticipants.jp")
	public @ResponseBody List<participantsDTO> addparticipants(HttpServletResponse response ,participantsDTO dto){
		List<participantsDTO> participants = sqlMap.queryForList("calendar.getparticipants", null);
		return participants;
	}
	
	@RequestMapping("/leftmenu-department.jp")
	public @ResponseBody List<Map<String, Object>> calendardepartment(calendarDTO cdto, HttpServletRequest request, HttpServletResponse response, ModelMap modelMap){
		String id = (String) sqlMap.queryForObject("calendar.departmentTransform", request.getParameter("id"));
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
	      List result2 = new ArrayList();
	      String title = "";
	      String start = "";
	      String end = "";
	      String color = "";
	      String allDay = "false";
	      result2 = sqlMap.queryForList("calendar.departmentList", id);
	      for(int i=0; i<result2.size(); i++){
	        Map<String, Object> map = new HashMap<String, Object>();
	        title = ((calendarDTO) result2.get(i)).getCl_title();
	        start = ((calendarDTO) result2.get(i)).getCl_sdate()+"T"+((calendarDTO) result2.get(i)).getCl_stime();
	        end = ((calendarDTO) result2.get(i)).getCl_edate()+"T"+((calendarDTO) result2.get(i)).getCl_etime();
	        if(title.equals("부서일정")){color="#CDA8FF";}
	        if(!end.equals("nullTnull")){ 
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
}
