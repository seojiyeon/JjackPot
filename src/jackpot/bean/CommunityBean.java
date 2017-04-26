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
	public String content(HttpServletRequest request,Model model,HttpSession session,communityDTO dto){
		String emp_num=(String) session.getAttribute("memId");
		int com_num=Integer.parseInt(request.getParameter("com_num"));
	     
	    sqlMap.update("comm.readCount",com_num);
	    
	    dto=(communityDTO)sqlMap.queryForObject("comm.content", com_num);
	    dto.setCom_num(com_num);
	    dto.setEmp_num(emp_num);
		model.addAttribute("dto",dto);
		voteDTO ddto=(voteDTO)sqlMap.queryForObject("comm.emp", emp_num);
		model.addAttribute("ddto",ddto);
		
		
		int ref=Integer.parseInt(request.getParameter("com_num"));
		List articleList = null;
		articleList =sqlMap.queryForList("comm.reply", ref);
		model.addAttribute("articleList",articleList);
		
		
		int check=(Integer)sqlMap.queryForObject("comm.count", ref);
		model.addAttribute("check",check);
		
		
		
		return "/community/content";
		
	}
	
	@RequestMapping("/like.jp")
	public String like(Model model, HttpServletRequest request){
	     int com_num=Integer.parseInt(request.getParameter("com_num"));
	     sqlMap.update("comm.recommend",com_num);
	     
	     model.addAttribute("com_num",com_num);
		 
		return "/community/like";
       }
	
	@RequestMapping("/comment.jp")
	public String comment(Model model, HttpServletRequest request,HttpSession session,communityDTO dto){
	     int ref=Integer.parseInt(request.getParameter("com_num"));
	     String re_num=(String) session.getAttribute("memId");
	     String content=request.getParameter("content");
	     String emp_name=request.getParameter("emp_name");
	    
	     System.out.println(emp_name);
	     
	     dto.setRe_num(re_num);
	     dto.setRef(ref);
	     dto.setContent(content);	     
	     dto.setEmp_name(emp_name);
	     
	     sqlMap.insert("comm.insertComment", dto);
	     
	     model.addAttribute("dto",dto);
	     model.addAttribute("com_num", ref);
	     	     
		return "/community/comment";
       }
	
	@RequestMapping("/CommentDEL.jp")
	public String CommentDEL(HttpServletRequest request,Model model,communityDTO dto){
	    int step_num=Integer.parseInt(request.getParameter("step_num"));	
	    int com_num=Integer.parseInt(request.getParameter("ref"));
	  
           sqlMap.delete("comm.deleteReply", step_num);
	    	
           model.addAttribute("com_num", com_num);
		return "/community/CommentDEL";
       }
	

	@RequestMapping("/reply2.jp")
	public String reply2(Model model, HttpServletRequest request,HttpSession session,communityDTO dto){
		 int ref=Integer.parseInt(request.getParameter("com_num"));
	     String re_num=(String) session.getAttribute("memId");
	     String content=request.getParameter("content");
	     int rep_num=Integer.parseInt(request.getParameter("rep_num"));
	     int step_num=Integer.parseInt(request.getParameter("step_num"));
	     	     
	     dto.setRe_num(re_num);
	     dto.setRef(ref);
	     dto.setStep_num(rep_num);
	     dto.setContent(content);
	    	     	    	    
	       sqlMap.insert("comm.reply2", dto);	     
	       sqlMap.update("comm.upreply", null);
	     System.out.println(ref);
	     model.addAttribute("dto",dto);
	     model.addAttribute("com_num", ref);
	     model.addAttribute("step_num", step_num);
	   
		return "/community/reply2";
       }
	
	@RequestMapping("/trash.jp")
	public String trash(HttpServletRequest request,Model model,communityDTO dto){	   
		 int rep_num=Integer.parseInt(request.getParameter("rep_num"));	
		 int com_num=Integer.parseInt(request.getParameter("com_num"));
	    System.out.println(rep_num);
	    
		 sqlMap.delete("comm.trash", rep_num);
		 
		 model.addAttribute("rep_num",rep_num);
		 model.addAttribute("com_num",com_num);
		 
		return "/community/trash";
       }
	
	
	
}
