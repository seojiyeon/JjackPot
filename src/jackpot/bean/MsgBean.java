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
import jackpot.DTO.msgDTO;

@Controller
public class MsgBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	
	@RequestMapping("/msgmain.jp")
	public String msgmain(msgDTO dto, HttpSession session, Model model){
		
		String id = (String) session.getAttribute("memId");
		int count = (int) sqlMap.queryForObject("msg.msgCnt", id);		
		
		List articleList = null;
		articleList = sqlMap.queryForList("msg.msgAll", id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgMain";
	}	
	
	
	@RequestMapping("/msgsmain.jp")
	public String msgsmain(msgDTO dto, HttpSession session, Model model){
		
		String id = (String) session.getAttribute("memId");
		int count = (int) sqlMap.queryForObject("msg.msgCnt", id);	
		
		List articleList = null;
		articleList = sqlMap.queryForList("msg.msgSend", id);	
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		return "/msg/msgSendMain";
	}	
	
	
	@RequestMapping("/msgWritePro.jp")
	public String msgWritePro(msgDTO dto, HttpSession session, Model model){
		String id = (String) session.getAttribute("memId");
		String name = (String) sqlMap.queryForObject("msg.msgMem", id);
		System.out.println(name);
		
		String receive = dto.getMsg_receive();
		System.out.println(receive);
		
		String rid = (String) sqlMap.queryForObject("msg.msgMem2", receive);
				
		dto.setMsg_rid(rid);
		dto.setMsg_send(name);
		dto.setEmp_num(id);
		sqlMap.insert("msg.sendmsg", dto);		
				
		
		return "/msg/msgWritePro";
	}	
	
	
	@RequestMapping("/msgcont.jp")
	public String msgcont(msgDTO dto, HttpSession session, Model model){
		
		int num = dto.getMsg_num();		
		
		
		
		dto = (msgDTO) sqlMap.queryForObject("msg.msgCont", num);
					   sqlMap.update("msg.msgChk",num);
		model.addAttribute("cDTO", dto);		
		
		return "/msg/msgContent";
	}	
	
	@RequestMapping("/msgcont2.jp")
	public String msgcont2(msgDTO dto, HttpSession session, Model model){
		
		int num = dto.getMsg_num();		
		
		
		
		dto = (msgDTO) sqlMap.queryForObject("msg.msgCont", num);
					   
		model.addAttribute("cDTO", dto);		
		
		return "/msg/msgContent2";
	}	
	
	
	
	
	
	
	
	@RequestMapping("/msgDel.jp")
	public String msgDel(msgDTO dto, HttpSession session, Model model, HttpServletRequest request){
						
		String[] RowCheck = request.getParameterValues("RowCheck");
		for(int i = 0; i<RowCheck.length ; i++){
			
			int a= Integer.parseInt( RowCheck[i]);						
			sqlMap.update("msg.msgRD", a);
			
		}
		sqlMap.delete("msg.msgDel", null);
		return "/msg/msgDelete";
	}
	
	@RequestMapping("/msgDel2.jp")
	public String msgDel2(msgDTO dto, HttpSession session, Model model, HttpServletRequest request){
						
		String[] RowCheck = request.getParameterValues("RowCheck");
		for(int i = 0; i<RowCheck.length ; i++){
			
			int a= Integer.parseInt( RowCheck[i]);						
			sqlMap.update("msg.msgSD", a);
			
		}
		sqlMap.delete("msg.msgDel", null);
		return "/msg/msgDelete2";
	}
	
	
	
	
	
	
	@RequestMapping("/msgFind.jp")
	public String msgFind(HttpServletRequest request,msgDTO dto, HttpSession session, Model model){
		
		String id = request.getParameter("id");
		int count = (int) sqlMap.queryForObject("msg.msgFindCnt", id);
		
		List articleList = null;
		articleList = sqlMap.queryForList("msg.msgFind",id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		
		return "/msg/msgFind";
	}	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/msgTest.jp")
	public String msgTest(msgDTO dto, HttpSession session, Model model){
						
		return "/msg/main";
	}
	
	@RequestMapping("/alarm.jp")
	public String msgTest2(msgDTO dto, HttpSession session, Model model){
		String a = null;
		String id = (String) session.getAttribute("memId");
		int count = (int) sqlMap.queryForObject("msg.msgAcnt", id);		
		System.out.println(count);
		
		if(count == 0){
		a = "false";
		}else{
	    model.addAttribute("count", count);
		a =  "/msg/msgAlarm";	
		}		
		return a;
		
	}	
	
	
	
	
}
