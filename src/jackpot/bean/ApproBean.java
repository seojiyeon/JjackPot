package jackpot.bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApproBean {

	@RequestMapping("/listApprForm.jp")
	public String listApprForm(){
		return "/appro/work/listApprForm";
	}
	
	@RequestMapping("/listApprMyRequest.jp")
	public String listApprMyRequest(){
		return "/appro/work/listApprMyRequest";
	}
	
	@RequestMapping("/listApprTemp.jp")
	public String listApprTemp(){
		return "/appro/work/listApprTemp";
	}
	
	@RequestMapping("/listApprTodo.jp")
	public String listApprTodo(){
		return "/appro/work/listApprTodo";
	}

	@RequestMapping("/NewFile.jp")
	public String NewFile(){
		return "/appro/NewFile";
	}
	@RequestMapping("/NewFile1.jp")
	public String NewFile1(){
		return "/appro/NewFile1";
	}
	@RequestMapping("/NewFile2.jp")
	public String NewFile2(){
		return "/appro/NewFile2";
	}
	
}
