package jackpot.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class voteBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	@RequestMapping("/Vform.jp")
	public String Vform(){
		
		
		return "/voate/Vform";
	}
	
	
	
}
