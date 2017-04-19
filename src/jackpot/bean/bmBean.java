package jackpot.bean;

import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import jackpot.DTO.bmDTO;
import jackpot.DTO.orgDTO;


@Controller

public class bmBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	/*모든업무리스트보기*/
	@RequestMapping("/bmList.jp")
	public String bmList(bmDTO bmdto, HttpSession session, Model model){
		
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBusiness", bmList);		
		model.addAttribute("bmList", bmList);		
		
		return "/bm/bmList";

	}
	
/*-------------------------------------업무요청-----------------------------------------*/	
	/*나의 업무요청리스트보기*/
	@RequestMapping("/JackPot/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/myBmYCHList";
		
	}
	
	
	/*수신업무요청리스트보기*/
	@RequestMapping("/JackPot/SSBmYCHList.jp")
	public String SSBmYCHList(){
		
		return "/bm/SSBmYCHList";
		
	}
	
	/*참조업무요청리스트보기*/
	@RequestMapping("/JackPot/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(){
		
		return "/bm/ChZBGBmYCHList";
		
	}

/*------------------------------------------------------------------------------------------*/	

/*----------------------------업무보고--------------------------------------------------------------*/
	
	/*내가 한 업무보고리스트보기*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/myBmBGList";

	}
	

	/*수신 업무보고리스트보기*/
	@RequestMapping("/JackPot/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/SSBGBmList";

	}
	

	/*참조 업무보고리스트보기*/
	@RequestMapping("/JackPot/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/ChZBGBmList";

	}
	
/*------------------------------------------------------------------------------------------*/	
/*-----------------------------업무일지-------------------------------------------------------------*/		
	
	/*내가 작성 한 업무일지리스트보기*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/myBmWriteList";

	}

	/*수신  업무 일지*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/SSBmList";

	}
	
	/*참조  업무 일지*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/ChZBmList";

	}
	
/*------------------------------------------------------------------------------------------*/		
	
	
	/*업무등록*/
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getemp_name", null);		
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);


		return "/bm/bmForm";

	}	
	
	/*업무FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(bmDTO bmdto, MultipartHttpServletRequest multi,HttpSession session){
		
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		sqlMap.insert("bm.insertBusiness", bmdto);

		return "/bm/bmFormPro";

	}
	
	/*담당자userPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(orgDTO odto,Model model,HttpSession session){
		
		List emp_d = sqlMap.queryForList("org.bm_org_department",null);
		System.out.println(emp_d);
		model.addAttribute("emp_d",emp_d);
		return "/bm/incharPop";

	}
	
	
	
}