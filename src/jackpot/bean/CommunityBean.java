package jackpot.bean;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.communityDTO;
import jackpot.DTO.voteDTO;

@Controller
public class CommunityBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;  
	
	@RequestMapping("/community.jp")
	public String community(Model model,communityDTO dto){
		
		List articleList = null;
		articleList =sqlMap.queryForList("comm.commList", dto);
		
		model.addAttribute("list",articleList);
		
		
		return "/community/community";
	}

	@RequestMapping("/commInsert.jp")
	public String commInsert(HttpSession session,communityDTO dto){
		String emp_num=(String) session.getAttribute("memId");
		System.out.println(emp_num);
		dto.setEmp_num(emp_num);
		
		sqlMap.insert("comm.insertComm", dto);
		
	
		return "/community/commInsert";
	}
	
	
	@RequestMapping("/content.jp")
	public String content(HttpServletRequest request,Model model){
	     int com_num=Integer.parseInt(request.getParameter("com_num"));
	     System.out.println(com_num);
	     
	     
	    sqlMap.update("comm.readCount",com_num);
	    
	    communityDTO dto=(communityDTO)sqlMap.queryForObject("comm.content", com_num);
	    dto.setCom_num(com_num);	    
		model.addAttribute("dto",dto);

		 
		return "/community/content";
		
	}
	
	@RequestMapping("/like.jp")
	public String like(Model model, HttpServletRequest request){
	     int com_num=Integer.parseInt(request.getParameter("com_num"));
	     System.out.println(com_num);
	     
	     sqlMap.update("comm.recommend",com_num);
	     
	     model.addAttribute("com_num",com_num);

		 
		return "/community/like";
       }
}
