package jackpot.bean;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
		System.out.println(emp_num);
		wdto.setEmp_num(emp_num);
		SimpleDateFormat sys = new SimpleDateFormat("hh:mm");
		HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = req.getHeader("X-FORWARDED-FOR");//ip불러오기
		List item = null;
		List work_list = null;
//		wdto.setWork_time(wdto.getWork_time());		
		if (ip == null) {
			ip = req.getRemoteAddr();
		}
		item = sqlMap.queryForList("work.getItem", emp_num);
		work_list = (List)sqlMap.queryForList("work.workTime", emp_num);
		System.out.println(wdto.getWork_time());		
		model.addAttribute("ip",ip);
		System.out.println(ip);
		model.addAttribute("sys",sys);//시간 불러오기
		System.out.println(sys);
		model.addAttribute("item",item);//list불러오기
		System.out.println(item);
		model.addAttribute("work_time",work_list);//work_time 계산불러오기
		return"/work/work";
	 }
	
	@RequestMapping("/work_on.jp")
	public String work_on(HttpSession session,HttpServletRequest request){
		workDTO wdto = new workDTO();
		String emp_num =(String)session.getAttribute("memId");
		String ip = request.getRemoteAddr();
		wdto.setEmp_num(emp_num);
		wdto.setIp(ip);
		//workDTO dto;
		sqlMap.insert("work.insertWork", wdto);
		return "/work/work_on";
	}
	
	

	@RequestMapping("/work_off.jp")
	public String work_off(HttpSession session,HttpServletRequest request,workDTO wdto){
		String emp_num=(String)session.getAttribute("memId");
		wdto.setEmp_num(emp_num);
		workDTO rdto = (workDTO)sqlMap.queryForObject("work.getWork", wdto);
		
		
		sqlMap.update("work.updateWork", rdto);
		return "/work/work_off";
	}
	
	
	
}
