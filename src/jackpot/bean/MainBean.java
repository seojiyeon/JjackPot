package jackpot.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBean {

	@RequestMapping("/main.jp")
	public String main(){
		return "/main/main";
	}
	
}
