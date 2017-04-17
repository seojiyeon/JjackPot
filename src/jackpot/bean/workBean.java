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
		String ip = req.getHeader("X-FORWARDED-FOR");//ip�ҷ�����
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );

		Date date = new Date();
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string�� date�� �ϱ����� ��
		Calendar cal = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date�� Ķ�����ð��� �־��ش�.
		System.out.println(date);

		if (ip == null) {
			ip = req.getRemoteAddr();
		}

		wdto = (workDTO)sqlMap.queryForObject("work.getDay", null);   //�ش糯¥�� �ҷ�����
		model.addAttribute("sys",sys);//�ð� �ҷ�����
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
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string�� date�� �ϱ����� ��
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );
		wdto = (workDTO)sqlMap.queryForObject("work.getDayChagne", wdto);  //�ش糯¥�� �ҷ�����
	
		model.addAttribute("count", count);
		model.addAttribute("date",date);
		model.addAttribute("wdto",wdto);
		model.addAttribute("sys",sys);//�ð� �ҷ�����
		return "/work/workday";
		
	}
	
	/*���� ��ü������Ȳ����(����)*/
	@RequestMapping("/work_all.jp")
	public String work(HttpSession session,HttpServletRequest request,Model model,workDTO wdto,String dateFormatStr){
		
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM-dd");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip�ҷ�����
		List monthsh = null;
		Date date = new Date();
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string�� date�� �ϱ����� ��
		Calendar cal = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date�� Ķ�����ð��� �־��ش�.

		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		
		monthsh = sqlMap.queryForList("work.getMonth", wdto);   //�ش���� �ҷ�����
		model.addAttribute("sys",sys);//�ð� �ҷ�����
		model.addAttribute("month",month);
		model.addAttribute("monthsh",monthsh);
		model.addAttribute("wdto",wdto);
		model.addAttribute("date", date);
		model.addAttribute("ip",ip);

		
		return"/work/work_all";
	 }
	
	@RequestMapping("/workMonth.jp")//�ش���� ���°����ҷ����� 
	public String workMonth(HttpSession session, String day, Model model,String dateFormatStr){
		
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		day = day.replace("-", "/");
		wdto.setDay(day);
		
		SimpleDateFormat sys = new SimpleDateFormat("HH:mm");
		SimpleDateFormat month = new SimpleDateFormat("yyyy-MM-dd");
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string�� date�� �ϱ����� ��
		
		
		List monthsh = sqlMap.queryForList("work.getMonthChagne",wdto);  //�ش���� �ҷ�����
		model.addAttribute("monthsh",monthsh);
		model.addAttribute("month",month);
		model.addAttribute("wdto",wdto);
		model.addAttribute("sys",sys);//�ð� �ҷ�����
		
		return "/work/workMonth";
	}
	
	
	@RequestMapping("/work_on.jp")
	public String work_on(Model model,HttpSession session,HttpServletRequest request,String dateFormatStr) {
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();// ip�ּ� ��������
		int count = (int) sqlMap.queryForObject("work.dayCount",wdto );
		request.setAttribute("emp_num", emp_num);
		
		if(count == 0){
			wdto.setEmp_num(emp_num);
			wdto.setIp(ip);
			sqlMap.insert("work.insertWork", wdto); //��ٽð� ���ϱ�
		}
		System.out.println(count);
	/*========================================================================================================================*/

		//�����ð����ϱ� 
		workDTO ladto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		Timestamp wo = ladto.getWork_on();
		System.out.println(ladto.getWork_on());
		Date d = new Date();    //�ð���¥�ҷ�����
		d.setHours(9);			//���� �ð� ����
		d.setMinutes(30);		//���� ������
		d.setSeconds(0);		//�ð� ������
		
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string�� date�� �ϱ����� ��
		Calendar cal = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(wo);     //work_on�� Ķ�����ð��� �־��ش�.
		long won = cal.getTimeInMillis();  //work_on �ð��� �ʴ����� �ٲ��ش�.
		cal.setTime(d);
		long dd = cal.getTimeInMillis(); 
		
		
		if( won > dd ){
		long late =(wo.getTime() - d.getTime());    //��ٽð� - ���������ð�
		long hourlatework_time = late;  // ���� �ð����� ����
		long minutelatework_time = late;		//���� ������ ����
		hourlatework_time  = (late/1000)/60/60;    // ������ �ð��� �����ش�
		minutelatework_time = (late/ 1000)/60;   //������ ���� �����ش�.
		System.out.println((int)minutelatework_time);
		
		while((int)minutelatework_time > 59)
		{
			System.out.println(minutelatework_time);
			minutelatework_time = minutelatework_time - 60 ;
			
		}  //���� 59���� ũ�� �ڵ����� 60�� �����ش�.
		
		String lateNess = hourlatework_time+":"+minutelatework_time;  //lateNess���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
		ladto.setLateNess(lateNess);  //���Ѱ��� �־��ش�.
		sqlMap.update("work.updateLateNess", ladto);  //lateNess SQL�� �־��ش�.
		}
	
		
		return "/work/work_on";
	}
	
	

	@RequestMapping("/work_off.jp")
	public String work_off(String dateFormatStr, HttpSession session,HttpServletRequest request,workDTO wdto){
		String emp_num=(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		workDTO rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		sqlMap.update("work.updateWork", rdto);    //��ٽð� update
	
	/*========================================================================================================================*/	
	
		//�ٹ��ð� ���ϱ�
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);   //�ٹ��ð������ ���� �ٽ� ����Ʈ�� �ҷ��´�.
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string�� date�� �ϱ����� ��
		Calendar calendar = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 

		Date work_on = rdto.getWork_on();  //work_on�� �ҷ��´�.
		Date work_off = rdto.getWork_off();   //work_off�� �ҷ��´�.
		calendar.setTime(work_off);     //work_off�� Ķ�����ð��� �־��ش�.
		long woff = calendar.getTimeInMillis();  //work_off �ð��� �ʴ����� �ٲ��ش�.
		calendar.setTime(work_on);			//work_on�� Ķ�����ð��� �־��ش�.
		long won = calendar.getTimeInMillis();     //work_on �ð��� �ʴ����� �ٲ��ش�.
		long work_time1 = woff - won;    //work_off-work_on�� �Ͽ� 1000�ʸ� �������� �ʸ� �����ش�.
		long hourwork_time = work_time1;  // �ð����� ����
		long minutework_time = work_time1;		//������ ����
		hourwork_time = (work_time1/1000)/60/60;    // ������ �ð��� �����ش�
		minutework_time = (work_time1 / 1000)/60;   //������ ���� �����ش�.
				
		while((int)minutework_time > 59)
		{
			System.out.println(minutework_time);
			minutework_time = minutework_time - 60 ;
		} //���� 59���� ũ�� �ڵ����� 60�� �����ش�.
			
		String work_time = hourwork_time+":"+minutework_time;  //work_time���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
		rdto.setWork_time(work_time);  //���Ѱ��� �־��ش�.
		sqlMap.update("work.updateWorkTime", rdto);  
		
    /*========================================================================================================================*/
		
		//����ð����ϱ� 
		workDTO eadto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		Date wof = eadto.getWork_off();
		Date d = new Date();    //�ð���¥�ҷ�����
		d.setHours(17);			//���� �ð� ����
		d.setMinutes(30);		//���� ������
		d.setSeconds(0);		//�ð� ������
		
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string�� date�� �ϱ����� ��
		Calendar cal = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		calendar.setTime(wof);     //work_off�� Ķ�����ð��� �־��ش�.
		long wofff = calendar.getTimeInMillis();  //work_off �ð��� �ʴ����� �ٲ��ش�.
		calendar.setTime(d);
		long dd = calendar.getTimeInMillis(); 
		
		
		if(wofff < dd ){
		long EarlyTime =(d.getTime() - wof.getTime());    //��ٽð� - ���������ð�
		long hourEarlywork_time = EarlyTime;  // ���� �ð����� ����
		long minuteEarlywork_time = EarlyTime;		//���� ������ ����
		hourEarlywork_time  = (EarlyTime/1000)/60/60;    // ������ �ð��� �����ش�
		minuteEarlywork_time = (EarlyTime/ 1000)/60;   //������ ���� �����ش�.
		System.out.println((int)minuteEarlywork_time);
		
		while((int)minuteEarlywork_time > 59)
		{
			System.out.println(minuteEarlywork_time);
			minuteEarlywork_time = minuteEarlywork_time - 60 ;
			
		}  //���� 59���� ũ�� �ڵ����� 60�� �����ش�.
		
		String early = hourEarlywork_time+":"+minuteEarlywork_time;  //early���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
		eadto.setEarly(early);  //���Ѱ��� �־��ش�.
		sqlMap.update("work.updateEarly", eadto);  //early SQL�� �־��ش�.
		}
	
	/*========================================================================================================================*/
		
		//����ٹ��ð����ϱ�
		else if(wofff > dd){
		long outTime =(work_off.getTime() - d.getTime());    //��ٽð� - ��������ð�
		long houroutTime = outTime;  // ��� �ð����� ����
		long minuteoutTime = outTime;		//��� ������ ����
		houroutTime  = (outTime/1000)/60/60;    // ������ �ð��� �����ش�
		minuteoutTime = (outTime/ 1000)/60;   //������ ���� �����ش�.
		System.out.println((int)minuteoutTime);
		
		while((int)minuteoutTime > 59)
		{
			System.out.println(minuteoutTime);
			minuteoutTime = minuteoutTime - 60 ;
			
		}  //���� 59���� ũ�� �ڵ����� 60�� �����ش�.
		
		String workOut = houroutTime+":"+minuteoutTime;  //workOut���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
		eadto.setWorkOut(workOut);  //���Ѱ��� �־��ش�.
		sqlMap.update("work.updateWorkOut", eadto);  //workOut SQL�� �־��ش�.
		}
			

		return "/work/work_off";
	}
}


	
	
	
