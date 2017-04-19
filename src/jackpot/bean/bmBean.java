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
	
	/*����������Ʈ����*/
	@RequestMapping("/bmList.jp")
	public String bmList(bmDTO bmdto, HttpSession session, Model model){
		
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBusiness", bmList);		
		model.addAttribute("bmList", bmList);		
		
		return "/bm/bmList";

	}
	
/*-------------------------------------������û-----------------------------------------*/	
	/*���� ������û����Ʈ����*/
	@RequestMapping("/JackPot/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/myBmYCHList";
		
	}
	
	
	/*���ž�����û����Ʈ����*/
	@RequestMapping("/JackPot/SSBmYCHList.jp")
	public String SSBmYCHList(){
		
		return "/bm/SSBmYCHList";
		
	}
	
	/*����������û����Ʈ����*/
	@RequestMapping("/JackPot/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(){
		
		return "/bm/ChZBGBmYCHList";
		
	}

/*------------------------------------------------------------------------------------------*/	

/*----------------------------��������--------------------------------------------------------------*/
	
	/*���� �� ����������Ʈ����*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/myBmBGList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/JackPot/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/SSBGBmList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/JackPot/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto, HttpSession session, Model model){
		
		return "/bm/ChZBGBmList";

	}
	
/*------------------------------------------------------------------------------------------*/	
/*-----------------------------��������-------------------------------------------------------------*/		
	
	/*���� �ۼ� �� ������������Ʈ����*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/myBmWriteList";

	}

	/*����  ���� ����*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto, HttpSession session, Model model){
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("date", date);
		model.addAttribute("myBmList", myBmList);		
		return "/bm/SSBmList";

	}
	
	/*����  ���� ����*/
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
	
	/*�����userPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(orgDTO odto,Model model,HttpSession session){
		
		List emp_d = sqlMap.queryForList("org.bm_org_department",null);
		System.out.println(emp_d);
		model.addAttribute("emp_d",emp_d);
		return "/bm/incharPop";

	}
	
	
	
}