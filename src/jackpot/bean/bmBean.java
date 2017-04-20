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
	
	/*����������Ʈ����*/
	@RequestMapping("/bmList.jp")
	public String bmList(bmDTO bmdto, HttpSession session, Model model){
		
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBusiness", bmList);		
		model.addAttribute("bmList", bmList);		
		
		return "/bm/bmList";

	}
	
/*-----------------------------todo-------------------------------------------------------------*/		
	
	/*���� ����*/
	@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model){
	
		return "/bm/mytodoList";
	}	

	
/*-------------------------------------������û-----------------------------------------*/	
	/*���� ������û����Ʈ����*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(Model model,HttpSession session,bmDTO bdto){
		String emp_num = (String)session.getAttribute("memId");
		System.out.println(emp_num);
		return "/bm/BmYCHList/myBmYCHList";
		
	}
	
	
	/*���ž�����û����Ʈ����*/
	@RequestMapping("/SSBmYCHList.jp")
	public String SSBmYCHList(){
		
		return "/bm//BmYCHList/SSBmYCHList";
		
	}
	
	/*����������û����Ʈ����*/
	@RequestMapping("/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(){
		
		return "/bm//BmYCHList/ChZBGBmYCHList";
		
	}

/*------------------------------------------------------------------------------------------*/	

/*----------------------------��������--------------------------------------------------------------*/
	
	/*���� �� ����������Ʈ����*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto, HttpSession session, Model model){

		return "/bm/BmBGList/myBmBGList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmBGList/SSBGBmList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmBGList/ChZBGBmList";

	}
	
/*------------------------------------------------------------------------------------------*/	
/*-----------------------------��������-------------------------------------------------------------*/		
	
	/*���� �ۼ� �� ������������Ʈ����*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto, HttpSession session, Model model){
	
		return "/bm/BmList/myBmWriteList";

	}

	/*����  ���� ����*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmList/SSBmList";

	}
	
	/*����  ���� ����*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/BmList/ChZBmList";

	}
	
/*------------------------------------------------------------------------------------------*/		
	
	
	/*�������*/
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getemp_name", null);		
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);


		return "/bm/bmForm";

	}	
	
	/*����FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(bmDTO bmdto, MultipartHttpServletRequest multi,HttpSession session){
		
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		sqlMap.insert("bm.insertBusiness", bmdto);

		return "/bm/bmFormPro";

	}
	
	/*�����incharPop*/
	
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