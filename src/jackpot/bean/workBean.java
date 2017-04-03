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
		String ip = req.getHeader("X-FORWARDED-FOR");//ip�ҷ�����
		List items = null;
	
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		items = sqlMap.queryForList("work.getItem", wdto);
		
		model.addAttribute("ip",ip);
		System.out.println(ip);
		model.addAttribute("sys",sys);//�ð� �ҷ�����
		System.out.println(sys);
		model.addAttribute("item",items);//list�ҷ�����

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
		sqlMap.update("work.updateWork", rdto);    //��ٽð� update
	
	
		//�ٹ��ð� ���ϱ�
		rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);   //�ٹ��ð������ ���� �ٽ� ����Ʈ�� �ҷ��´�.
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd HH:mm:ss"; // string�� date�� �ϱ����� ��
		Calendar calendar = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringFormat = new SimpleDateFormat(dateFormatStr); 
		
		try{
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
			minutework_time = (work_time1 / 1000)/60  ;   //������ ���� �����ش�.
			String work_time = hourwork_time+":"+minutework_time;  //work_time���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
			
			rdto.setWork_time(work_time);  //���Ѱ��� �־��ش�.
			sqlMap.update("work.updateWorkTime", rdto);  
			
			
		}catch(ParseException e){
			e.printStackTrace();
		}	
			
		//����ð� ���ϱ�
		try{
			Date work_on = rdto.getWork_on();  //work_on�� �ҷ��´�.
			Date work_off = rdto.getWork_off();   //work_off�� �ҷ��´�.
			
			calendar.setTime(work_off);     //work_off�� Ķ�����ð��� �־��ش�.
			long woff = calendar.getTimeInMillis();  //work_off �ð��� �ʴ����� �ٲ��ش�.

			calendar.setTime(work_on);			//work_on�� Ķ�����ð��� �־��ش�.
			long won = calendar.getTimeInMillis();     //work_on �ð��� �ʴ����� �ٲ��ش�.
			
			
			long early1 = woff - won;    //work_off-work_on�� �Ͽ� 1000�ʸ� �������� �ʸ� �����ش�.
			long hourearly = early1;  // �ð����� ����
			long minuteearly = early1;		//������ ����
			hourearly = (early1/1000)/60/60;    // ������ �ð��� �����ش�
			minuteearly = (early1 / 1000)/60  ;   //������ ���� �����ش�.
			String work_time = hourearly+":"+minuteearly;  //work_time���� Ÿ���� �°� ����Ǿ� ���Ѱ��� �־��ش�.
			
			rdto.setWork_time(work_time);  //���Ѱ��� �־��ش�.
			
			sqlMap.update("work.updateEarly", rdto); 
		}catch(ParseException e){
			e.printStackTrace();
		}
		
		
		
		
		
		return "/work/work_off";
	}
}


	
	
	
