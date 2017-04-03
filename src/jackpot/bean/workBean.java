package jackpot.bean;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import jackpot.DTO.workDTO;


@Controller
public class workBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/work.jp")
	public String work(HttpServletRequest request,workDTO wdto,Model model,HttpSession session){
		
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip불러오기
		List items = null;
	
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		items = sqlMap.queryForList("work.getItem", wdto);
		
		model.addAttribute("ip",ip);
		model.addAttribute("sys",sys);//시간 불러오기
		model.addAttribute("item",items);//list불러오기

		return"/work/work";
		
	 }
	
	@RequestMapping("/work_on.jp")
	public String work_on(HttpSession session,HttpServletRequest request,String dateFormatStr) {
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();// ip주소 가져오기
		wdto.setEmp_num(emp_num);
		wdto.setIp(ip);
		sqlMap.insert("work.insertWork", wdto); //출근시간 구하기
		
		//지각 시간 구하기
		workDTO ladto = (workDTO)sqlMap.queryForObject("work.getWork", wdto); //지각시간계산의위해 리스트불러오기
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar calendar = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 
		
		try{
			LocalTime lateTime = LocalTime.parse("09:30:59"); 
			calendar.setTime(lateTime);
			long lt = calendar.getTimeInMillis(); 
			Date work_on = ladto.getWork_on();  //work_on을 불러온다.
			calendar.setTime(work_on);     //work_off를 캘린더시간에 넣어준다.
			long won = calendar.getTimeInMillis();  //work_off 시간을 초단위로 바꿔준다.
			

					long late_time1 = lateTime - won;    //lateTime-work_on을 하여 1000초를 기준으로 초를 구해준다.
					long hour_late_time = late_time1;  // 시간으로 지정
					long minute_late_time = late_time1;		//분으로 지정
					hour_late_time = (late_time1/1000)/60/60;    // 각각의 시간을 구해준다
					minute_late_time = (late_time1 / 1000)/60;   //각각의 분을 구해준다.
					System.out.println(hour_late_time);
					System.out.println(minute_late_time);
					String lateNess = minute_late_time+":"+minute_late_time;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
					ladto.setLateNess(lateNess);  //구한값을 넣어준다.
					System.out.println(lateNess);
					sqlMap.update("work.updateLateNess", ladto);  
					
		}catch(ParseException e){
			e.printStackTrace();
		}	
		return "/work/work_on";
	}
	
	

	@RequestMapping("/work_off.jp")
	public String work_off(String dateFormatStr, HttpSession session,HttpServletRequest request,workDTO wdto){
		String emp_num=(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		workDTO rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		sqlMap.update("work.updateWork", rdto);    //퇴근시간 update
	
		
		//근무시간 구하기
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);   //근무시간계산을 위해 다시 리스트를 불러온다.
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar calendar = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 
		
		try{
			Date work_on = rdto.getWork_on();  //work_on을 불러온다.
			Date work_off = rdto.getWork_off();   //work_off를 불러온다.
			
			calendar.setTime(work_off);     //work_off를 캘린더시간에 넣어준다.
			long woff = calendar.getTimeInMillis();  //work_off 시간을 초단위로 바꿔준다.

			calendar.setTime(work_on);			//work_on를 캘린더시간에 넣어준다.
			long won = calendar.getTimeInMillis();     //work_on 시간을 초단위로 바꿔준다.
			
			
			long work_time1 = woff - won;    //work_off-work_on을 하여 1000초를 기준으로 초를 구해준다.
			long hourwork_time = work_time1;  // 시간으로 지정
			long minutework_time = work_time1;		//분으로 지정
			hourwork_time = (work_time1/1000)/60/60;    // 각각의 시간을 구해준다
			minutework_time = (work_time1 / 1000)/60;   //각각의 분을 구해준다.
			String work_time = hourwork_time+":"+minutework_time;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
			
			rdto.setWork_time(work_time);  //구한값을 넣어준다.
			sqlMap.update("work.updateWorkTime", rdto);  
			
			
		}catch(ParseException e){
			e.printStackTrace();
		}	
			
		


		
		
		
		
		
		return "/work/work_off";
	}
}


	
	
	
