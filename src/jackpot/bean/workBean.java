package jackpot.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.ParseException;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
	/*	//지각 시간 구하기
		workDTO ladto = (workDTO)sqlMap.queryForObject("work.getWork", wdto); //지각시간계산의위해 리스트불러오기
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string을 date로 하기위한 것
		Calendar calendar = Calendar.getInstance();   //캘린더를 date로 변환
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 
		
		try{
			LocalTime lateTime = LocalTime.parse("09:31:00");
			long nano = lateTime.toNanoOfDay()*1000000;
			nano= nano *1000000 = nano.getTimeInMillis(); 
			System.out.println("nano==>>"+nano);
			
			Date work_on = ladto.getWork_on();  //work_on을 불러온다.
			calendar.setTime(work_on);     //work_off를 캘린더시간에 넣어준다.
			long won = calendar.getTimeInMillis();  //work_off 시간을 초단위로 바꿔준다.
			

					long late_time1 = nano - won;    //lateTime-work_on을 하여 1000초를 기준으로 초를 구해준다.
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
		}	*/
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
			System.out.println((int)minutework_time);
			
			while((int)minutework_time > 59)
			{
				System.out.println(minutework_time);
				minutework_time = minutework_time - 60 ;
				
			}
			
			System.out.println("hourwork_time="+hourwork_time);
			System.out.println("minutework_time="+minutework_time);
			String work_time = hourwork_time+":"+minutework_time;  //work_time으로 타입을 맞게 변경되어 구한값을 넣어준다.
			
			rdto.setWork_time(work_time);  //구한값을 넣어준다.
			sqlMap.update("work.updateWorkTime", rdto);  
			
			
		}catch(ParseException e){
			e.printStackTrace();
		}	
		
	
		//휴일근무 
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		private static String[] solarArr = new String[]{"0101", "0301", "0505", "0606", "0815", "1225"};
	    private static String[] lunarArr = new String[]{"0101", "0102", "0408", "0814", "0815", "0816"};
	    
	    /**
	     * 해당일자가 법정공휴일, 대체공휴일, 토요일, 일요일인지 확인
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 법정공휴일, 대체공휴일, 일요일이면 true, 오류시 false
	     */
	    public static boolean isHoliday(String date) {
	        try {
	            return isHolidaySolar(date) || isHolidayLunar(date) || isHolidayAlternate(date) || isWeekend(date);
	        } catch (ParseException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 
	    /**
	     * 토요일 또는 일요일이면 true를 리턴한다.
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 일요일인지 여부
	     * @throws ParseException
	     */
	    private static boolean isWeekend(String date) throws ParseException {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(sdf.parse(date));
	        return cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY || cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY;
	    }
	    
	    /**
	     * 해당일자가 대체공휴일에 해당하는 지 확인
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 대체 공휴일이면 true
	     */
	    private static boolean isHolidayAlternate(String date) {
	        
	        String[] altHoliday = new String[] {
	                "20150929", "20160210", "20170130", "20180926", 
	                "20180507", "20190506", "20200127", "20220912", 
	                "20230124", "20240212", "20240506", "20251008", 
	                "20270209", "20290924", "20290507"}; 
	        
	        return Arrays.asList(altHoliday).contains(date); 
	        
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
	        */
	    }
	 
	 
	    /**
	     * 해당일자가 음력 법정공휴일에 해당하는 지 확인
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 음력 공휴일이면 true
	     */
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
	 
	 
	    /**
	     * 해당일자가 양력 법정공휴일에 해당하는 지 확인
	     * @param date 양력날짜 (yyyyMMdd)
	     * @return 양력 공휴일이면 true
	     */
	    private static boolean isHolidaySolar(String date) {
	        try {
	            // 공휴일에 포함 여부 리턴 
	            return Arrays.asList(solarArr).contains(date.substring(4));
	        } catch(Exception ex) {
	            System.out.println(ex.getStackTrace());
	            return false;
	        }
	    }
	    
	    
	    /**
	     * 음력날짜를 양력날짜로 변환
	     * @param 음력날짜 (yyyyMMdd)
	     * @return 양력날짜 (yyyyMMdd)
	     */
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
	    
	    /**
	     * 양력날짜의 요일을 리턴
	     * @param 양력날짜 (yyyyMMdd)
	     * @return 요일(int)
	     */
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
	    }   
		return "/work/work_off";
	}
}


	
	
	
