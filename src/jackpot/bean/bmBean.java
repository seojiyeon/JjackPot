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
import jackpot.DTO.empDTO;
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
	
/*-----------------------------todo-------------------------------------------------------------*/		
	
	/*나의 할일*/
	@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model){
	
		return "/bm/mytodoList";
	}	

	
/*-------------------------------------업무요청-----------------------------------------*/	
	/*나의 업무요청리스트보기*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(Model model,HttpSession session,bmDTO bdto){
		String emp_num = (String)session.getAttribute("memId");
		System.out.println(emp_num);
		return "/bm/BmYCHList/myBmYCHList";
		
	}
	
	
	/*수신업무요청리스트보기*/
	@RequestMapping("/SSBmYCHList.jp")
	public String SSBmYCHList(){
		
		return "/bm//BmYCHList/SSBmYCHList";
		
	}
	
	/*참조업무요청리스트보기*/
	@RequestMapping("/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(){
		
		return "/bm//BmYCHList/ChZBGBmYCHList";
		
	}

/*------------------------------------------------------------------------------------------*/	

/*----------------------------업무보고--------------------------------------------------------------*/
	
	/*내가 한 업무보고리스트보기*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto, HttpSession session, Model model){

		return "/bm/BmBGList/myBmBGList";

	}
	

	/*수신 업무보고리스트보기*/
	@RequestMapping("/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmBGList/SSBGBmList";

	}
	

	/*참조 업무보고리스트보기*/
	@RequestMapping("/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmBGList/ChZBGBmList";

	}
	
/*------------------------------------------------------------------------------------------*/	
/*-----------------------------업무일지-------------------------------------------------------------*/		
	
	/*내가 작성 한 업무일지리스트보기*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto, HttpSession session, Model model){
	
		return "/bm/BmList/myBmWriteList";

	}

	/*수신  업무 일지*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmList/SSBmList";

	}
	
	/*참조  업무 일지*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmList/ChZBmList";

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
	
	/*담당자incharPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(Model model){
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		System.out.println(emp_d);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);
		return "/bm/incharPop";

	}
	
	
	
}