package jackpot.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



import jackpot.DTO.workDTO;
import oracle.sql.DATE;


@Controller
public class workBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;

	@RequestMapping("/work.jp")
	public String work(HttpServletRequest request,workDTO wdto,Model model,HttpSession session,String dateFormatStr ){
		
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip불러오기
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );

		Date date = new Date();
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		Calendar cal = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date를 캘린더시간에 넣어준다.
		System.out.println(date);

		if (ip == null) {
			ip = req.getRemoteAddr();
		}

		wdto = (workDTO)sqlMap.queryForObject("work.getDay", null);   //해당날짜만 불러오기
		model.addAttribute("sys",sys);//시간 불러오기
		model.addAttribute("wdto",wdto);
		model.addAttribute("date", date);
		model.addAttribute("ip",ip);
		model.addAttribute("count",count);

		return"/work/work";
		
	 }
	
	@RequestMapping("/workday.jp")
	public String workday(String day, HttpSession session, Model model,String dateFormatStr){
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		day = day.replace("-", "/");
		wdto.setDay(day);

		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );
		wdto = (workDTO)sqlMap.queryForObject("work.getDayChagne", wdto);  //해당날짜만 불러오기
	
		model.addAttribute("count", count);
		model.addAttribute("date",date);
		model.addAttribute("wdto",wdto);
		model.addAttribute("sys",sys);//시간 불러오기
		return "/work/workday";
		
	}
	
	/*나의 전체근태현황보기(월별)*/
	@RequestMapping("/work_all.jp")
	public String work(HttpSession session,HttpServletRequest request,Model model,workDTO wdto,String dateFormatStr){
		
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM-dd");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip불러오기
		List monthsh = null;
		Date date = new Date();
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		Calendar cal = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date를 캘린더시간에 넣어준다.

		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		
		monthsh = sqlMap.queryForList("work.getMonth", wdto);   //해당월만 불러오기
		model.addAttribute("sys",sys);//시간 불러오기
		model.addAttribute("month",month);
		model.addAttribute("monthsh",monthsh);
		model.addAttribute("wdto",wdto);
		model.addAttribute("date", date);
		model.addAttribute("ip",ip);

		
		return"/work/work_all";
	 }
	
	@RequestMapping("/workMonth.jp")//해당달의 근태관리불러오기 
	public String workMonth(HttpSession session, String day, Model model,String dateFormatStr){
		
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		day = day.replace("-", "/");
		wdto.setDay(day);
		
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM-dd");
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		
		
		List monthsh = sqlMap.queryForList("work.getMonthChagne",wdto);  //해당월만 불러오기
		model.addAttribute("monthsh",monthsh);
		model.addAttribute("month",month);
		model.addAttribute("wdto",wdto);
		model.addAttribute("sys",sys);//시간 불러오기
		
		return "/work/workMonth";
	}
	
	
	@RequestMapping("/work_on.jp")
	public String work_on(Model model,HttpSession session,HttpServletRequest request,String dateFormatStr) {
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();// ip주소 가져오기
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );
		request.setAttribute("emp_num", emp_num);
		
		if(count == 0){
			wdto.setEmp_num(emp_num);
			wdto.setIp(ip);
			sqlMap.insert("work.insertWork", wdto); //출근시간 구하기
		}
		System.out.println(count);
	/*========================================================================================================================*/

		//지각시간구하기 
		workDTO ladto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		Timestamp wo = ladto.getWork_on();
		System.out.println(ladto.getWork_on());
		Date d = new Date();    //시간날짜불러오기
		d.setHours(9);			//지각 시간 지정
		d.setMinutes(30);		//지각 분지정
		d.setSeconds(0);		//시각 초지정
		
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar cal = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(wo);     //work_on를 캘린더시간에 넣어준다.
		long won = cal.getTimeInMillis();  //work_on 시간을 초단위로 바꿔준다.
		cal.setTime(d);
		long dd = cal.getTimeInMillis(); 
		
		
		if( won > dd ){
		long late =(wo.getTime() - d.getTime());    //출근시간 - 지각지정시간
		long hourlatework_time = late;  // 지각 시간으로 지정
		long minutelatework_time = late;		//지각 분으로 지정
		hourlatework_time  = (late/1000)/60/60;    // 각각의 시간을 구해준다
		minutelatework_time = (late/ 1000)/60;   //각각의 분을 구해준다.
		System.out.println((int)minutelatework_time);
		
		while((int)minutelatework_time > 59)
		{
			System.out.println(minutelatework_time);
			minutelatework_time = minutelatework_time - 60 ;
			
		}  //분이 59보다 크면 자동으로 60을 지켜준다.
		
		String lateNess = hourlatework_time+":"+minutelatework_time;  //lateNess으로 타입을 맞게 변경되어 구한값을 넣어준다.
		ladto.setLateNess(lateNess);  //구한값을 넣어준다.
		sqlMap.update("work.updateLateNess", ladto);  //lateNess SQL에 넣어준다.
		}
	
		
		return "/work/work_on";
	}
	
	

	@RequestMapping("/work_off.jp")
	public String work_off(String dateFormatStr, HttpSession session,HttpServletRequest request,workDTO wdto){
		String emp_num=(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		workDTO rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		sqlMap.update("work.updateWork", rdto);    //퇴근시간 update
	
	/*========================================================================================================================*/	
	
		//근무시간 구하기
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);   //근무시간계산을 위해 다시 리스트를 불러온다.
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar calendar = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 

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
				
		while((int)minutework_time > 59)
		{
			System.out.println(minutework_time);
			minutework_time = minutework_time - 60 ;
		} //분이 59보다 크면 자동으로 60을 지켜준다.
			
		String work_time = hourwork_time+":"+minutework_time;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
		rdto.setWork_time(work_time);  //구한값을 넣어준다.
		sqlMap.update("work.updateWorkTime", rdto);  
		
    /*========================================================================================================================*/
		
		//조퇴시간구하기 
		workDTO eadto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		Date wof = eadto.getWork_off();
		Date d = new Date();    //시간날짜불러오기
		d.setHours(17);			//지각 시간 지정
		d.setMinutes(30);		//지각 분지정
		d.setSeconds(0);		//시각 초지정
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar cal = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		calendar.setTime(wof);     //work_off를 캘린더시간에 넣어준다.
		long wofff = calendar.getTimeInMillis();  //work_off 시간을 초단위로 바꿔준다.
		calendar.setTime(d);
		long dd = calendar.getTimeInMillis(); 
		
		
		if(wofff < dd ){
		long EarlyTime =(d.getTime() - wof.getTime());    //퇴근시간 - 조퇴지정시간
		long hourEarlywork_time = EarlyTime;  // 지각 시간으로 지정
		long minuteEarlywork_time = EarlyTime;		//조퇴 분으로 지정
		hourEarlywork_time  = (EarlyTime/1000)/60/60;    // 각각의 시간을 구해준다
		minuteEarlywork_time = (EarlyTime/ 1000)/60;   //각각의 분을 구해준다.
		System.out.println((int)minuteEarlywork_time);
		
		while((int)minuteEarlywork_time > 59)
		{
			System.out.println(minuteEarlywork_time);
			minuteEarlywork_time = minuteEarlywork_time - 60 ;
			
		}  //분이 59보다 크면 자동으로 60을 지켜준다.
		
		String early = hourEarlywork_time+":"+minuteEarlywork_time;  //early으로 타입을 맞게 변경되어 구한값을 넣어준다.
		eadto.setEarly(early);  //구한값을 넣어준다.
		sqlMap.update("work.updateEarly", eadto);  //early SQL에 넣어준다.
		}
	
	/*========================================================================================================================*/
		
		//연장근무시간구하기
		else if(wofff > dd){
		long outTime =(work_off.getTime() - d.getTime());    //퇴근시간 - 퇴근지정시간
		long houroutTime = outTime;  // 퇴근 시간으로 지정
		long minuteoutTime = outTime;		//퇴근 분으로 지정
		houroutTime  = (outTime/1000)/60/60;    // 각각의 시간을 구해준다
		minuteoutTime = (outTime/ 1000)/60;   //각각의 분을 구해준다.
		System.out.println((int)minuteoutTime);
		
		while((int)minuteoutTime > 59)
		{
			System.out.println(minuteoutTime);
			minuteoutTime = minuteoutTime - 60 ;
			
		}  //분이 59보다 크면 자동으로 60을 지켜준다.
		
		String workOut = houroutTime+":"+minuteoutTime;  //workOut으로 타입을 맞게 변경되어 구한값을 넣어준다.
		eadto.setWorkOut(workOut);  //구한값을 넣어준다.
		sqlMap.update("work.updateWorkOut", eadto);  //workOut SQL에 넣어준다.
		}
			

		return "/work/work_off";
	}
}


	
	
	
