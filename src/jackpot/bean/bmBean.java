package jackpot.bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import jackpot.DTO.bmDTO;
import jackpot.DTO.empDTO;
import jackpot.DTO.orgDTO;
import jackpot.DTO.workDTO;


@Controller

public class bmBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	/*����������Ʈ����*/
	@RequestMapping("/bmList.jp")
	public String bmList(bmDTO bmdto, Model model){
		
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBusiness", bmdto);
		int bmcount = (int) sqlMap.queryForObject("bm.bmcount", bmdto);
		
		model.addAttribute("bmList", bmList);		
		model.addAttribute("bmcount", bmcount);		
		
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
	
	
	/*��������� */
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session,String dateFormatStr ){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		
		Date date = new Date();
		if(dateFormatStr == null) dateFormatStr = "yyyy-MM-dd"; // string�� date�� �ϱ����� ��
		Calendar cal = Calendar.getInstance();   //Ķ������ date�� ��ȯ
		DateFormat stringForma = new SimpleDateFormat(dateFormatStr); 
		cal.setTime(date);     //date�� Ķ�����ð��� �־��ش�.
		System.out.println(date);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getDay", null);   //�ش糯¥�� �ҷ�����
		
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getEmp_name", null);	
		model.addAttribute("date", date);
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);
		


		return "/bm/bmForm";

	}	
	
	/*����FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(bmDTO bmdto, MultipartHttpServletRequest multi,HttpSession session){
		
		String emp_num =(String)session.getAttribute("memId");
		String name = (String) sqlMap.queryForObject("bm.getEmp_name", emp_num);
		String Inchar = bmdto.getInchar_name();
	

		bmdto.setEmp_num(emp_num);
		sqlMap.insert("bm.insertBusiness", bmdto);
		int bmNum = (int)sqlMap.insert("bm.showBmNum", null);
		bmdto.setBm_num(bmNum);
		
		/*�����*/
		String inchar_name[] = multi.getParameterValues("inchar_name");
		for(int i=0; i<inchar_name.length; i++ ) {
			bmdto.setInchar_name(inchar_name[i]);
			sqlMap.insert("bm.insertIncharge", bmdto);
		}

		/*������*/
		String Bm_ref = bmdto.getRef_name();
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bmNum);
		String ref_name[] = multi.getParameterValues("ref_name");
		for(int i=0; i<ref_name.length; i++ ) {
			bmdto.setRef_name(ref_name[i]);
			sqlMap.insert("bm.insertBm_ref", bmdto);
		}
		
		
		
		/*������*/
		String Bms_ref = bmdto.getRec_name();
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bmNum);
		String rec_name[] = multi.getParameterValues("rec_name");
		for(int i=0; i<inchar_name.length; i++ ) {
			bmdto.setRec_name(rec_name[i]);
			sqlMap.insert("bm.insertBms_rec", bmdto);
		}
		
		/*�������� ���*/
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertHistory", bmdto);
		
		/*�������� ���*/
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.inserBm_file", bmdto);
		
		/*�������� ���*/
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertBm_form", bmdto);
		
		/*���������� ���*/
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertBns_box", bmdto);
		
		
		
		

		return "/bm/bmFormPro";

	}
	
	/*�����incharPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(Model model,empDTO dto,HttpSession session){
		String emp_num = (String) session.getAttribute("memId");
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		List dp = sqlMap.queryForList("bm.emp_department",null);
		int count = (int) sqlMap.queryForObject("bm.bm_empCount",emp_num);
		
		model.addAttribute("count", count);
		model.addAttribute("dp",dp);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);
		return "/bm/incharPop";

	}
	
	/*�����incharPop*/
	
	@RequestMapping("/bms_recPop.jp")
	public String bms_recPop(Model model,empDTO dto,HttpSession session){
		String emp_num = (String) session.getAttribute("memId");
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		List dp = sqlMap.queryForList("bm.emp_department",null);
		int count = (int) sqlMap.queryForObject("bm.bm_empCount",emp_num);
		
		model.addAttribute("count", count);
		model.addAttribute("dp",dp);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);
		
		return "/bm/bms_recPop";

	}
	
	
	
	
	
	
}