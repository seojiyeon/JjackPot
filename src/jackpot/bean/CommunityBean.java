package jackpot.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;  
	
	@RequestMapping("/community.jp")
	public String community(){
		return "/community/community";
	}

	@RequestMapping("/boardinsert.jp.jp")
	public String insert(){
		return "/community/community";
	}
	
}
