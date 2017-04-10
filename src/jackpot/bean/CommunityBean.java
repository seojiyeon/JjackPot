package jackpot.bean;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class CommunityBean {

	@Autowired
	private SqlMapClientTemplate sqlMap;  
	
	@RequestMapping("/community.jp")
	public String community(){
		return "/community/community";
	}

	@RequestMapping("/boardinsert.jp")
	public String insert(MultipartHttpServletRequest multi){
		MultipartFile mf = multi.getFile("files");
		System.out.println(mf);
		return "/community/community";
	}
	
}
