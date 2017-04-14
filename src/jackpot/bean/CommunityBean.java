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
	
}
