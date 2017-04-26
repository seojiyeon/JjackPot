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
	public String bmList(bmDTO bmdto, Model model, HttpServletRequest request){
	
		List bmList = null;
		
		
		bmList = sqlMap.queryForList("bm.getBmList", bmdto);
		int bmcount = (int) sqlMap.queryForObject("bm.bmcount", bmdto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		System.out.println(bmList);
		System.out.println(bmcount);
		model.addAttribute("bmList", bmList);
		model.addAttribute("bmcount", bmcount);		
		model.addAttribute("sdf", sdf);		
		
		return "/bm/bmList";

	}
	
/*-----------------------------todo-------------------------------------------------------------*/		
	
	/*���� ����*/
	@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		List mytodoList = null;
		mytodoList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		

		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		System.out.println(mytodoList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("mytodoList", mytodoList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm/mytodoList";
	}	

	
/*-------------------------------------������û-----------------------------------------*/	
	/*���� ������û����Ʈ����*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
	
		List myBmYCHList = null;
		

		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("myBmYCHList", myBmYCHList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm/BmYCHList/myBmYCHList";
		
	}
	
	
	/*���ž�����û����Ʈ����*/
	@RequestMapping("/SSBmYCHList.jp")
	public String SSBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List SSBmYCHList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SSBmYCHList", SSBmYCHList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm//BmYCHList/SSBmYCHList";
		
	}
	
	/*����������û����Ʈ����*/
	@RequestMapping("/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List ChZBGBmYCHList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBGBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBGBmYCHList", ChZBGBmYCHList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm//BmYCHList/ChZBGBmYCHList";
		
	}

/*----------------------------��������--------------------------------------------------------------*/
	
	/*���� �� ����������Ʈ����*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List myBmBGList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmBGList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("myBmBGList", myBmBGList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm/BmBGList/myBmBGList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List SSBGBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBGBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SSBGBmList", SSBGBmList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		return "/bm/BmBGList/SSBGBmList";

	}
	

	/*���� ����������Ʈ����*/
	@RequestMapping("/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List ChZBGBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBGBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBGBmList", ChZBGBmList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		
		return "/bm/BmBGList/ChZBGBmList";

	}
	
/*------------------------------------------------------------------------------------------*/	
/*-----------------------------��������-------------------------------------------------------------*/		
	
	/*���� �ۼ� �� ������������Ʈ����*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List myBmWriteList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmWriteList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("myBmWriteList", myBmWriteList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		
		
		return "/bm/BmList/myBmWriteList";

	}

	/*����  ���� ����*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List SSBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SSBmList", SSBmList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		
		
		return "/bm/BmList/SSBmList";

	}
	
	/*����  ���� ����*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List ChZBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBmList", ChZBmList);
		model.addAttribute("count", count);		
		model.addAttribute("sdf", sdf);		
		
		
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