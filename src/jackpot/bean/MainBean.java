package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.empDTO;
import jackpot.DTO.favDTO;
import jackpot.DTO.orgDTO;

@Controller
public class MainBean {
	@Autowired
	private SqlMapClientTemplate sqlMap;   
	@RequestMapping("/main.jp")

	
	public String main(HttpServletRequest request,HttpSession session,Model model){
		String empfav= (String)session.getAttribute("memId");
		String emp_num = request.getParameter("emp_num");
		String id = (String) session.getAttribute("memId");
		int count = (int) sqlMap.queryForObject("msg.msgAcnt2", id);
		int count2 = (int) sqlMap.queryForObject("msg.msgAcnt", id);		
		
		List favList = null;
		
		favList = sqlMap.queryForList("org.fav",empfav);
		model.addAttribute("favList", favList);
		model.addAttribute("memId", empfav);
		model.addAttribute("count", count);
		model.addAttribute("count2", count2);

		return "/main/main";
	}
	
}
