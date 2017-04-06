package jackpot.bean;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Work_yearBean {
	
	
	@RequestMapping("searchyear.jp")
	public String searchyear(Model model,HttpServletRequest request){
		
		String searchName = request.getParameter("searchName");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(searchName);
		System.out.println(searchValue);
		
		HashMap map = new HashMap();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		
	//	List list = sqlMap.queryForList("org.search", map);
			
	//	model.addAttribute("list", list);
				
		return "/emp/searchORG";
		
	}
	

}
