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

import com.ibm.icu.util.ChineseCalendar;

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
		
		
		Calendar cal = Calendar.getInstance();
		//* 변수를 선언하고 음력 및 양력에 해당하는 값을 배열로 저장한다.
		ChineseCalendar chinaCal = null;
		String[] solarArr = new String[]{"0101", "0301", "0505", "0606", "0815", "1225"};
		String[] lunarArr= new String[]{"0101", "0102", "0408", "0814", "0815", "0816"};
		cal = Calendar.getInstance();
		chinaCal = new ChineseCalendar();
				



		/**

		 * 해당일자가 음력 법정공휴일에 해당하는 지 확인

		 * @param date

		 * @return

		 */

		String date = null;
		boolean result = null;
		result =false;	
		
		cal.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));
		cal.set(Calendar.MONTH, Integer.parseInt(date.substring(4, 6)) - 1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date.substring(6)));
		chinaCal.setTimeInMillis(cal.getTimeInMillis());

			
		/** 음력으로 변환된 월과 일자 **/

		int mm = chinaCal.get(ChineseCalendar.MONTH) + 1;
		int dd = chinaCal.get(ChineseCalendar.DAY_OF_MONTH);

		StringBuilder sb = new StringBuilder();

		if (mm < 10)    sb.append("0");
			sb.append(mm);

		if (dd < 10)    sb.append("0");
			sb.append(dd);

			
		/** 음력 12월의 마지막날 (설날 첫번째 휴일)인지 확인 **/

			if (mm == 12) {
				int lastDate = chinaCal.getActualMaximum(ChineseCalendar.DAY_OF_MONTH);

				if (dd == lastDate) {
					return true;

				}

			}

			

			for (String d : lunarArr) {

				if (sb.toString().equals(d)) {

					return true;

				}

			}

			

			return result;

		}



		/**

		 * 해당일자가 양력 법정공휴일에 해당하는 지 확인

		 * @param date

		 * @return

		 */

		private boolean isHolidaySolar (String date) {

			boolean result = false;



			if (StringUtil.nvl(date).equals("") || 

					StringUtil.nvl(date).length() > 8) {

				date = new java.text.SimpleDateFormat("MMdd").format(cal.getTime());

			} else {

				date = date.substring(4);

			}

			

			for (String d : solarArr) {

				if (date.equals(d)) {

					return true;

				}

			}

			

			return result;

		}

		/**

		 * 해당일자가 일요일인지 확인

		 * @param date

		 * @return

		 */

		private boolean isSunday (String date) {

			boolean result = false;

			cal.set(Calendar.YEAR, Integer.parseInt(date.substring(0, 4)));

			cal.set(Calendar.MONTH, Integer.parseInt(date.substring(4, 6)) - 1);

			cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date.substring(6)));

			if (cal.get ( Calendar.DAY_OF_WEEK ) == 1) {

				result = true;

			}

			

			return result;

		}



		public String getDelvDate () {

			int addDay = 1;

			String date = "";

			cal.setTime(new java.util.Date(System.currentTimeMillis())); 

			cal.add(Calendar.DATE, addDay);

			date = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());



			boolean result = true;

			/** 양력 법정공휴일부터 확인 **/

			result = isHolidaySolar(date);

			/** 양력 법정공휴일에 해당하지 않으면 **/

			if (!result) {

				/** 음력 법정공휴일에 해당하는 지 확인 **/

				result = isHolidayLunar(date);

				/** 음력 공휴일에 해당하면 **/

				if (result) {

					/** 재조정된 값이 음력, 양력 공휴일 및 일요일에 해당하지 않을 때까지 루프 **/

					while (result) {

						cal.add(Calendar.DATE, addDay);

						date = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());

						result = isHolidayLunar(date);

						

						/** 음력 공휴일에도 해당하지 않을 경우 

						 * 이 때의 date가 일요일 및 양력 공휴일에 해당하는 지 한번 더 확인하고 일요일인지도 확인

						 *  **/

						if (!result) {

							result = isHolidaySolar(date);

						}

						

						if (!result) {

							result = isSunday(date);

						}

					}

				/** 양력 및 음력 공휴일에 해당하지 않으면 **/

				} else {

					/** 양력 및 음력 공휴일에 해당하지 않으므로 일요일인지 확인 **/

					result = isSunday(date);

					if (result) {

						/** 재조정된 값이 음력, 양력 공휴일 및 일요일에 해당하지 않을 때까지 루프 **/

						while (result) {

							cal.add(Calendar.DATE, addDay);

							date = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());

							result = isSunday(date);

							/** 재조정된 값이 양력 및 음력 공휴일에 해당하는 지 확인 **/

							if (!result) {

								result = isHolidaySolar(date);

							}

							if (!result) {

								result = isHolidayLunar(date);

							}

						}

					}

				}

			} else {	// 양력 공휴일에 해당하면 

				/** 재조정된 값이 음력, 양력 공휴일 및 일요일에 해당하지 않을 때까지 루프 **/

				while (result) {

					cal.add(Calendar.DATE, addDay);

					date = new java.text.SimpleDateFormat("yyyyMMdd").format(cal.getTime());

					result = isHolidaySolar(date);

					

					if (!result) {

						result = isHolidaySolar(date);

					}

					

					if (!result) {

						result = isSunday(date);

					}

				}

			}

			

			return date;

		}



		public static void main(String[] args) {

			DateUtil du = new DateUtil();

			du.getDelvDate();



		}



		출처: http://darkhorizon.tistory.com/312 [너머]

		return "/work/work_off";
	}
}


	
	
	
