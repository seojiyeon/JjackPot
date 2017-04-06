package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.empDTO;

@Controller
public class MsgBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	
	@RequestMapping("/msgmain.jp")
	public String msgmain(empDTO dto, HttpSession session, Model model){
		
		List articleList = null;
		articleList = sqlMap.queryForList("employee.memberAll", articleList);		
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgMain";
	}	
	
	@RequestMapping("/msgwrite.jp")
	public String msgwrite(empDTO dto, HttpSession session, Model model){
		
		List articleList = null;
		articleList = sqlMap.queryForList("employee.memberAll", articleList);		
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgWrite";
	}	
	
	@RequestMapping("/msgWritePro.jp")
	public String msgWritePro(empDTO dto, HttpSession session, Model model){
		
		List articleList = null;
		articleList = sqlMap.queryForList("employee.memberAll", articleList);		
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgWritePro";
	}	
	
	
	
	
}
