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

import jackpot.DTO.empDTO;
import jackpot.DTO.voteDTO;
import jackpot.DTO.voteProDTO;

@Controller
public class voteBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	@RequestMapping("/Vform.jp")
	public String Vform(HttpSession session,Model model){
		String emp_num = (String)session.getAttribute("memId");
		System.out.println(emp_num);
		empDTO dto = (empDTO)sqlMap.queryForObject("employee.member", emp_num);
		
		model.addAttribute("dto",dto);
		
		
		return "/vote/Vform";
	}
	
	
	@RequestMapping("/VformPro.jp")
	public String VformPro(MultipartHttpServletRequest multi){

		voteDTO dto= new voteDTO();
		dto.setJilmoon(multi.getParameter("jilmoon"));
		dto.setMonhang(multi.getParameter("monhang"));
		dto.setMonhang2(multi.getParameter("monhang2"));
		dto.setEmp_num(multi.getParameter("emp_num"));
		dto.setEmp_name(multi.getParameter("emp_name"));
		
		String path=multi.getRealPath("save");
		MultipartFile mf=multi.getFile("up_img");
		String orgname=mf.getOriginalFilename();
		String ext=orgname.substring(orgname.lastIndexOf("."));
		String savename="img_"+orgname+ext;
		File f=new File(path+"//"+savename);
		try{
			  mf.transferTo(f);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setUp_img(savename);
		
		  
		  
		  MultipartFile mf2 = multi.getFile("up_img2");
		  String orgname2=mf2.getOriginalFilename();
		  String ext2 = orgname2.substring(orgname2.lastIndexOf("."));
		  String savename2="img2_"+orgname2+ext2;
		  File f2=new File(path+"//"+savename2);
		  try{
			  mf2.transferTo(f2);
		  }catch(Exception e){
			  e.printStackTrace();
		  }
		  dto.setUp_img2(savename2);
		  
		  sqlMap.insert("vote.insertVote", dto);
		
		  return "/vote/VformPro";
	}
	
	
	
	@RequestMapping("/BeforeSuc.jp")
	public String BeforeSuc(HttpSession session,Model model,voteDTO dto,HttpServletRequest request){
		
		 String emp_num = (String)session.getAttribute("memId");

		 
		 List articleList = null;
		articleList=sqlMap.queryForList("vote.voteSelect", emp_num);

		
		     model.addAttribute("articleList", articleList);
	

		return "/vote/BeforeSuc";
	}
	
	
	@RequestMapping("/VoteSuc.jp")
	public String VoteSuc(HttpSession session,HttpServletRequest request){
		String emp_num = (String)session.getAttribute("memId");

	    int v_num=Integer.parseInt(request.getParameter("v_num"));
	    
	   
	    
	    sqlMap.update("vote.Vupdate", v_num);
	    
	 
		return "/vote/VoteSuc";
	}
	
	
	@RequestMapping("/voteDel.jp")
	public String voteDel(HttpSession session,HttpServletRequest request){
		   int v_num=Integer.parseInt(request.getParameter("v_num"));
		   
		   sqlMap.delete("vote.Vdel", v_num);
		
		return "/vote/voteDel";
	
	}
	
	
	@RequestMapping("/EndVote.jp")
	public String EndVote(HttpSession session,HttpServletRequest request){
		int v_num=Integer.parseInt(request.getParameter("v_num"));
		 sqlMap.update("vote.EndVote", v_num);
		return "/vote/EndVote";
		
	}
	
	@RequestMapping("/UpVote.jp")
	public String UpVote(HttpSession session,voteDTO dto,Model model,HttpServletRequest request){
			
		List articleList=null;
		articleList=sqlMap.queryForList("vote.UpVote", dto);
	 
		 model.addAttribute("articleList", articleList);
		 
		 
		 return "/vote/UpVote";
		
	}
	
	@RequestMapping("/UpVotePro.jp")
	public String UpVotePro(HttpSession session,Model model,HttpServletRequest request){
		String vote_num = (String)session.getAttribute("memId");
		int v_num=Integer.parseInt(request.getParameter("v_num"));

		voteDTO dto=(voteDTO)sqlMap.queryForObject("vote.UpVotePro", v_num);
		
		 model.addAttribute("dto",dto);
		 
		 return "/vote/UpVotePro";
	}
	
	@RequestMapping("/Success.jp")
	public String Success(HttpSession session,Model model,HttpServletRequest request,voteProDTO dto){
		String vote_num = (String)session.getAttribute("memId");

		int v_num=Integer.parseInt(request.getParameter("v_num"));
		String emp_num=request.getParameter("emp_num");
		
		dto.setV_num(v_num);
		dto.setVote_num(vote_num);
		
		int check =(Integer)sqlMap.queryForObject("vote.VoteSelect", dto);
		
		if(check==0){
		dto.setVote_num(vote_num);
		sqlMap.insert("vote.success", dto);
		
		}
		
	       model.addAttribute("check",new Integer(check));
		
		return "/vote/Success";
	}
	
	
	@RequestMapping("/VoteResult.jp")
	public String VoteResult(HttpServletRequest request,Model model,voteDTO dto){
		int v_num=Integer.parseInt(request.getParameter("v_num"));
		dto.setV_num(v_num);
		
		 dto=(voteDTO)sqlMap.queryForObject("vote.v_num", v_num);
		
		model.addAttribute("dto",dto);
		
		
		int check =(Integer)sqlMap.queryForObject("vote.Result", v_num);
		int check2 =(Integer)sqlMap.queryForObject("vote.Result2", v_num);
		int check3 =(Integer)sqlMap.queryForObject("vote.Allresult", v_num);
		
		   model.addAttribute("check",new Integer(check));
		   model.addAttribute("check2",new Integer(check2));
		   model.addAttribute("check3",new Integer(check3));
		
		   
		int ref=Integer.parseInt(request.getParameter("v_num"));
		List articleList=null;
		  articleList=sqlMap.queryForList("vote.commetList", ref);
		  
		  model.addAttribute("articleList",articleList);
				
		   
		return "/vote/VoteResult";
	}
	
	@RequestMapping("/reply.jp")
	public String reply(voteDTO dto,HttpServletRequest request,Model model){
		int v_num=Integer.parseInt(request.getParameter("v_num"));
		String emp_num=(String)request.getParameter("emp_num");
		String content=(String)request.getParameter("content");
		String emp_name=(String)request.getParameter("emp_name");
		
		System.out.println(v_num);
		System.out.println(emp_num);
		System.out.println(content);
		
		dto.setEmp_num(emp_num);
		dto.setRef(v_num);
		dto.setContent(content);
		dto.setEmp_name(emp_name);
		
		model.addAttribute("v_num", v_num);
		
		 sqlMap.insert("vote.comment", dto);
		 
		return "/vote/reply";
	}
	
}  //end
