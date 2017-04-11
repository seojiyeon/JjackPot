package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.empDTO;
import jackpot.DTO.msgDTO;

@Controller
public class MsgBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	
	@RequestMapping("/msgmain.jp")
	public String msgmain(msgDTO dto, HttpSession session, Model model){
		
		List articleList = null;
		articleList = sqlMap.queryForList("msg.msgAll", articleList);		
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgMain";
	}	
	
	
	@RequestMapping("/msgsmain.jp")
	public String msgsmain(msgDTO dto, HttpSession session, Model model){
		
		List articleList = null;
		articleList = sqlMap.queryForList("msg.msgAll", articleList);		
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgSendMain";
	}	
	
	
	
	
	

	
	@RequestMapping("/msgWritePro.jp")
	public String msgWritePro(msgDTO dto, HttpSession session, Model model){
		
		
		sqlMap.insert("msg.sendmsg", dto);		
				
		
		return "/msg/msgWritePro";
	}	
	
	@RequestMapping("/msgTest.jp")
	public String msgTest(msgDTO dto, HttpSession session, Model model){
						
		return "/msg/msgTest";
	}
	
	@RequestMapping("/msgTest2.jp")
	public String msgTest2(msgDTO dto, HttpSession session, Model model){
						
		return "/msg/msgTest2";
	}	
	
	
	
	
}
