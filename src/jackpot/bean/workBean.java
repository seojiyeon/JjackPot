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

		Date date = new Date();
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		Calendar cal = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date를 캘린더시간에 넣어준다.

		if (ip == null) {
			ip = req.getRemoteAddr();
		}

		wdto = (workDTO)sqlMap.queryForObject("work.getDay", null);   //해당날짜만 불러오기
		model.addAttribute("sys",sys);//시간 불러오기
		model.addAttribute("wdto",wdto);
		model.addAttribute("date", date);
		model.addAttribute("ip",ip);

		return"/work/work";
		
	 }
	
	@RequestMapping("/workday.jp")
	public String workday(String day, Model model,String dateFormatStr){

		day = day.replace("-", "/");
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
		workDTO wdto = null;
		wdto = (workDTO)sqlMap.queryForObject("work.getDayChagne", day);  //해당날짜만 불러오기
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
/*		 
		monthsh = sqlMap.queryForList("work.getMonth", wdto);   //해당날짜만 불러오기
		model.addAttribute("sys",sys);//시간 불러오기
		model.addAttribute("month",month);
		model.addAttribute("monthsh",monthsh);*/
		model.addAttribute("wdto",wdto);
		model.addAttribute("date", date);
		model.addAttribute("ip",ip);

		
		return"/work/work_all";
	 }
	
	@RequestMapping("/workMonth.jp")
	public String workMonth(HttpSession session, String day, Model model,String dateFormatStr){
		
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		day = day.replace("-", "/");
		wdto.setDay(day);
		
		
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM-dd");
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string을 date로 하기위한 것
	
//		wdto = (workDTO)sqlMap.queryForObject("work.getMonthChagne", day); 
		int count = (int) sqlMap.queryForObject("work.monthCount",wdto );
		List monthsh = sqlMap.queryForList("work.getMonthChagne",wdto);  //해당월만 불러오기
		model.addAttribute("count", count);
		model.addAttribute("monthsh",monthsh);
		System.out.println(count);
		System.out.println();
		model.addAttribute("month",month);
		model.addAttribute("wdto",wdto);
		model.addAttribute("sys",sys);//시간 불러오기
		
		return "/work/workMonth";
	}
	
	
	@RequestMapping("/work_on.jp")
	public String work_on(HttpSession session,HttpServletRequest request,String dateFormatStr) {
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();// ip주소 가져오기
		wdto.setEmp_num(emp_num);
		wdto.setIp(ip);
		sqlMap.insert("work.insertWork", wdto); //출근시간 구하기
		
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
			

		
	
	/*	//휴일근무 
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		private static String[] solarArr = new String[]{"0101", "0301", "0505", "0606", "0815", "1225"};
	    private static String[] lunarArr = new String[]{"0101", "0102", "0408", "0814", "0815", "0816"};
	    
	    *//**
	     * 해당일자가 법정공휴일, 대체공휴일, 토요일, 일요일인지 확인
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 법정공휴일, 대체공휴일, 일요일이면 true, 오류시 false
	     *//*
	    public static boolean isHoliday(String date) {
	        try {
	            return isHolidaySolar(date) || isHolidayLunar(date) || isHolidayAlternate(date) || isWeekend(date);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 
	    *//**
	     * 토요일 또는 일요일이면 true를 리턴한다.
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 일요일인지 여부
	     * @throws ParseException
	     *//*
	    private static boolean isWeekend(String date) throws ParseException {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(sdf.parse(date));
	        return cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY || cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY;
	    }
	    
	    *//**
	     * 해당일자가 대체공휴일에 해당하는 지 확인
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 대체 공휴일이면 true
	     *//*
	    private static boolean isHolidayAlternate(String date) {
	        
	        String[] altHoliday = new String[] {
	                "20150929", "20160210", "20170130", "20180926", 
	                "20180507", "20190506", "20200127", "20220912", 
	                "20230124", "20240212", "20240506", "20251008", 
	                "20270209", "20290924", "20290507"}; 
	        
	        return Arrays.asList(altHoliday).contains(date); 
	        */
	        /*
	        int year = Integer.parseInt(date.substring(0, 4));
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        
	        // 설날
	        String dayFirst2 = convertLunarToSolar(year + "0101");
	        String dayFirst3 = convertLunarToSolar(year + "0102");
	        String dayFirst1 = String.valueOf(Integer.parseInt(dayFirst2) - 1);     
	        
	        // 추석
	        String dayThanks1 = convertLunarToSolar(year + "0814");
	        String dayThanks2 = convertLunarToSolar(year + "0815");
	        String dayThanks3 = convertLunarToSolar(year + "0816");
	        
	        // 어린이날
	        String dayChild = year + "0505";
	        
	        // 해당 년도의 대체휴일 목록
	        List<String> altHolyday = new ArrayList<String>();
	        
	        if(getDayOfWeek(dayFirst1) == Calendar.SUNDAY || getDayOfWeek(dayFirst2) == Calendar.SUNDAY || getDayOfWeek(dayFirst3) == Calendar.SUNDAY || isHolidaySolar(dayFirst1) || isHolidaySolar(dayFirst2) || isHolidaySolar(dayFirst3)) {
	            int y = Integer.parseInt(dayFirst3.substring(0, 4));
	            int m = Integer.parseInt(dayFirst3.substring(4, 6)) - 1;
	            int d = Integer.parseInt(dayFirst3.substring(6)) + 1;
	            Calendar c = Calendar.getInstance();
	            c.set(y, m, d);
	            altHolyday.add(sdf.format(c.getTime()));
	        }
	            
	        if(getDayOfWeek(dayThanks1) == Calendar.SUNDAY || getDayOfWeek(dayThanks2) == Calendar.SUNDAY || getDayOfWeek(dayThanks3) == Calendar.SUNDAY || isHolidaySolar(dayThanks1) || isHolidaySolar(dayThanks2) || isHolidaySolar(dayThanks3)) {
	            int y = Integer.parseInt(dayThanks3.substring(0, 4));
	            int m = Integer.parseInt(dayThanks3.substring(4, 6)) - 1;
	            int d = Integer.parseInt(dayThanks3.substring(6)) + 1;
	            Calendar c = Calendar.getInstance();
	            c.set(y, m, d);
	            altHolyday.add(sdf.format(c.getTime()));
	        }
	        
	        int childWeek = getDayOfWeek(dayChild); 
	        
	        if(childWeek == Calendar.SATURDAY) {
	            int y = Integer.parseInt(dayChild.substring(0, 4));
	            int m = Integer.parseInt(dayChild.substring(4, 6)) - 1;
	            int d = Integer.parseInt(dayChild.substring(6)) + 2;
	            Calendar c = Calendar.getInstance();
	            c.set(y, m, d);
	            altHolyday.add(sdf.format(c.getTime()));
	        }
	            
	        if(childWeek == Calendar.SUNDAY) {
	            int y = Integer.parseInt(dayChild.substring(0, 4));
	            int m = Integer.parseInt(dayChild.substring(4, 6)) - 1;
	            int d = Integer.parseInt(dayChild.substring(6)) + 1;
	            Calendar c = Calendar.getInstance();
	            c.set(y, m, d);
	            altHolyday.add(sdf.format(c.getTime()));
	        }
	        
	        return altHolyday.contains(date); 
	        
	    }
	 */
	 
	    /**
	     * 해당일자가 음력 법정공휴일에 해당하는 지 확인
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 음력 공휴일이면 true
	     *//*
	    private static boolean isHolidayLunar(String date) {
	        try {
	            Calendar cal = Calendar.getInstance();
	            ChineseCalendar chinaCal = new ChineseCalendar();
	            
	            cal.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
	            cal.set(Calendar.MONTH, Integer.parseInt(date.substring(4, 6)) - 1);
	            cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date.substring(6)));
	            
	            chinaCal.setTimeInMillis(cal.getTimeInMillis());
	            
	            // 음력으로 변환된 월과 일자
	            int mm = chinaCal.get(ChineseCalendar.MONTH) + 1;
	            int dd = chinaCal.get(ChineseCalendar.DAY_OF_MONTH);
	            
	            StringBuilder sb = new StringBuilder();
	            sb.append(String.format("%02d", mm));
	            sb.append(String.format("%02d", dd));
	                        
	            // 음력 12월의 마지막날 (설날 첫번째 휴일)인지 확인
	            if (mm == 12) {
	                int lastDate = chinaCal.getActualMaximum(ChineseCalendar.DAY_OF_MONTH);
	                if (dd == lastDate) {
	                    return true;
	                }
	            }
	 
	            // 음력 휴일에 포함되는지 여부 리턴
	            return Arrays.asList(lunarArr).contains(sb.toString()); 
	        } catch(Exception ex) {
	            System.out.println(ex.getStackTrace());
	            return false;
	        }
	    }
	 
	 
	    *//**
	     * 해당일자가 양력 법정공휴일에 해당하는 지 확인
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 양력 공휴일이면 true
	     *//*
	    private static boolean isHolidaySolar(String date) {
	        try {
	            // 공휴일에 포함 여부 리턴 
	            return Arrays.asList(solarArr).contains(date.substring(4));
	        } catch(Exception ex) {
	            System.out.println(ex.getStackTrace());
	            return false;
	        }
	    }
	    
	    
	    *//**
	     * 음력날짜를 양력날짜로 변환
	     * @param 음력날짜 (yyyyMMdd)
	     * @return 양력날짜 (yyyyMMdd)
	     *//*
	    private static String convertLunarToSolar(String yyyymmdd) {
	        ChineseCalendar cc = new ChineseCalendar();
	        Calendar cal = Calendar.getInstance();
	 
	        if (yyyymmdd == null)
	            return "";
	 
	        String date = yyyymmdd.trim();
	        if (date.length() != 8) {
	            if (date.length() == 4)
	                date = date + "0101";
	            else if (date.length() == 6)
	                date = date + "01";
	            else if (date.length() > 8)
	                date = date.substring(0, 8);
	            else
	                return "";
	        }
	 
	        cc.set(ChineseCalendar.EXTENDED_YEAR, Integer.parseInt(date.substring(0, 4)) + 2637);
	        cc.set(ChineseCalendar.MONTH, Integer.parseInt(date.substring(4, 6)) - 1);
	        cc.set(ChineseCalendar.DAY_OF_MONTH, Integer.parseInt(date.substring(6)));
	        
	        cal.setTimeInMillis(cc.getTimeInMillis());
	 
	        int y = cal.get(Calendar.YEAR);
	        int m = cal.get(Calendar.MONTH) + 1;
	        int d = cal.get(Calendar.DAY_OF_MONTH);
	 
	        StringBuffer ret = new StringBuffer();
	        ret.append(String.format("%04d", y));
	        ret.append(String.format("%02d", m));
	        ret.append(String.format("%02d", d));
	 
	        return ret.toString();
	    }
	    
	    *//**
	     * 양력날짜의 요일을 리턴
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 요일(int)
	     *//*
	    private static int getDayOfWeek(String day) {
	        int y = Integer.parseInt(day.substring(0, 4));
	        int m = Integer.parseInt(day.substring(4, 6)) - 1;
	        int d = Integer.parseInt(day.substring(6));
	        Calendar c = Calendar.getInstance();
	        c.set(y, m, d);
	        return c.get(Calendar.DAY_OF_WEEK);
	    }
	 
	 
	    public static void main(String[] args) {
	        System.out.println("20150217        : " + HolidayUtil.isHoliday("20150217"));       
	        System.out.println("20150218 (음력) : " + HolidayUtil.isHoliday("20150218")); // 설날 - 전날
	        System.out.println("20150219 (음력) : " + HolidayUtil.isHoliday("20150219")); // 설날       
	        System.out.println("20150220 (음력) : " + HolidayUtil.isHoliday("20150220")); // 설날 - 다음날
	        System.out.println("20150221        : " + HolidayUtil.isHoliday("20150221"));       
	        System.out.println("20151225 (양력) : " + HolidayUtil.isHoliday("20151225")); // 크리스마스
	        System.out.println("20151226        : " + HolidayUtil.isHoliday("20151226"));
	        System.out.println("20150929 (대체) : " + HolidayUtil.isHoliday("20150929")); // 대체 휴일
	    }   */
		return "/work/work_off";
	}
}


	
	
	
