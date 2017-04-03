package jackpot.bean;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
		SimpleDateFormat sys = new SimpleDateFormat("hh:mm");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip불러오기
		List items = null;
	
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		items = sqlMap.queryForList("work.getItem", wdto);
		
		model.addAttribute("ip",ip);
		System.out.println(ip);
		model.addAttribute("sys",sys);//시간 불러오기
		System.out.println(sys);
		model.addAttribute("item",items);//list불러오기

		return"/work/work";
		
	 }
	
	@RequestMapping("/work_on.jp")
	public String work_on(HttpSession session,HttpServletRequest request){
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();
		wdto.setEmp_num(emp_num);
		wdto.setIp(ip);
		sqlMap.insert("work.insertWork", wdto);
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
			minutework_time = (work_time1 / 1000)/60  ;   //각각의 분을 구해준다.
			String work_time = hourwork_time+":"+minutework_time;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
			
			rdto.setWork_time(work_time);  //구한값을 넣어준다.
			sqlMap.update("work.updateWorkTime", rdto);  
			
			
		}catch(ParseException e){
			e.printStackTrace();
		}	
			
		//조퇴시간 구하기
		try{
			Date work_on = rdto.getWork_on();  //work_on을 불러온다.
			Date work_off = rdto.getWork_off();   //work_off를 불러온다.
			
			calendar.setTime(work_off);     //work_off를 캘린더시간에 넣어준다.
			long woff = calendar.getTimeInMillis();  //work_off 시간을 초단위로 바꿔준다.

			calendar.setTime(work_on);			//work_on를 캘린더시간에 넣어준다.
			long won = calendar.getTimeInMillis();     //work_on 시간을 초단위로 바꿔준다.
			
			
			long early1 = woff - won;    //work_off-work_on을 하여 1000초를 기준으로 초를 구해준다.
			long hourearly = early1;  // 시간으로 지정
			long minuteearly = early1;		//분으로 지정
			hourearly = (early1/1000)/60/60;    // 각각의 시간을 구해준다
			minuteearly = (early1 / 1000)/60  ;   //각각의 분을 구해준다.
			String work_time = hourearly+":"+minuteearly;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
			
			rdto.setWork_time(work_time);  //구한값을 넣어준다.
			
			sqlMap.update("work.updateEarly", rdto); 
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		
		
		
		
		return "/work/work_off";
	}
}


	
	
	
