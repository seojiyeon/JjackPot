package jackpot.bean;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import jackpot.DTO.bmDTO;
import jackpot.DTO.empDTO;
import jackpot.DTO.memoDTO;
import jackpot.DTO.msgDTO;
import jackpot.DTO.orgDTO;
import jackpot.DTO.workDTO;


@Controller

public class bmBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	/*����������Ʈ����*/
	@RequestMapping("/bmList.jp")
	public String bmList( String pageNum,HttpSession session, bmDTO bmdto, Model model, HttpServletRequest request){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBmList", bmdto);
		int bmcount = (int) sqlMap.queryForObject("bm.bmcount", bmdto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		
		
		int pageSize = 10; // ���� �Ķ���͸� �޾Ƽ� �ؾ���.
	

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = bmcount / pageSize + ( bmcount % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		

		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("bmList", bmList);
		model.addAttribute("bmcount", bmcount);		
	
		
		return "/bm/bmList";

	}
	
/*-----------------------------todo-------------------------------------------------------------*/		
	
	/*���� ����*/
	@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		List mytodoList = null;
		mytodoList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);

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
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("mytodoList", mytodoList);
		model.addAttribute("count", count);			
		return "/bm/mytodoList";
	}	
	
	/*���� ������û ���� ����*/
	@RequestMapping("/mytodoContent.jp")
	public String mytodoContent(HttpServletRequest request, bmDTO bmdto,Model model,HttpSession session,bmDTO bdto){
		String emp_num = (String)session.getAttribute("memId");
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
	
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bm_num);
 
	/*	List myBmYCHList = null;*/

		bmdto = (bmDTO) sqlMap.queryForObject("bm.getBusinessCont", bmdto);
	/*	sqlMap.queryForObject("bm.getBns_box", bm_num);*/
		
		/*int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", bmdto);*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
		
		
/*		myBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);*/
		
/*		model.addAttribute("pageNum", pageNum);*/
		model.addAttribute("bmdto", bmdto);

		model.addAttribute("emp_num", emp_num);
		model.addAttribute("bm_num", bm_num);
		model.addAttribute("BusinessCont", bmdto);
	/*	model.addAttribute("myBmYCHList", myBmYCHList);*/
/*		model.addAttribute("count", count);		*/
		model.addAttribute("sdf", sdf);		
		return "/bm/BmYCHList/mytodoContent";
		
	}

	
/*-------------------------------------������û-----------------------------------------*/	
	/*���� ������û����Ʈ����*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
	
		List myBmYCHList = null;
		
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", bmdto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		/*������ �� */
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
		/*������ �� ������� */
		
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
	
	/*���� ������û ���� ����*/
	@RequestMapping("/myBmYCHContent.jp")
	public String myBmYCHcontent(HttpServletRequest request, bmDTO bmdto,Model model,HttpSession session,bmDTO bdto){
		
		String emp_num = (String)session.getAttribute("memId");
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
		
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bm_num);
 
	/*	List myBmYCHList = null;*/

		
		bmdto = (bmDTO) sqlMap.queryForObject("bm.getBusinessCont", bmdto);
	/*	sqlMap.queryForObject("bm.getBns_box", bm_num);*/
		
		/*int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", bmdto);*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
		
/*		myBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);*/
		
/*		model.addAttribute("pageNum", pageNum);*/
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("bm_num", bm_num);
		model.addAttribute("BusinessCont", bmdto);
	/*	model.addAttribute("myBmYCHList", myBmYCHList);*/
/*		model.addAttribute("count", count);		*/
		model.addAttribute("sdf", sdf);		
		return "/bm/BmYCHList/myBmYCHContent";
		
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
		
			
		model.addAttribute("pageNum", pageNum);  //page �ѱ� �� 
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
		
		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
		
		
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
		
		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
		
		
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
		
		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
		
		
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
		
		/* �޸� ���� �ҷ����� */
		List file = sqlMap.queryForList("memo.memoFile", bmdto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", bmdto);
				
		
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
	public String bmForm(bmDTO bmdto,Model model,HttpSession session,String dateFormatStr,HttpServletRequest request){
		int countBns_box = (int) sqlMap.queryForObject("bm.countBns_box",bmdto);
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		List ListBns_box = sqlMap.queryForList("bm.ListBns_box", null);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getEmp_name2", emp_num);	
	
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);
		model.addAttribute("countBns_box", countBns_box);
		model.addAttribute("ListBns_box", ListBns_box);
		


		return "/bm/bmForm";

	}	
	
	/*����FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(Model model,empDTO empdto,bmDTO bmdto,HttpSession session, MultipartHttpServletRequest request){
		
		String emp_num =(String)session.getAttribute("memId");
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		empDTO edto1 = (empDTO)sqlMap.queryForObject("bm.empInf",emp_num);


		
		bmdto.setEmp_num(request.getParameter("emp_num"));
		bmdto.setBm_name(edto1.getEmp_name());
		bmdto.setBm_title(request.getParameter("bm_title"));
		bmdto.setBm_content(request.getParameter("bm_content"));
		bmdto.setBm_form(Integer.parseInt(request.getParameter("bm_form")));
		bmdto.setReg_notice(request.getParameter("reg_notice"));
		bmdto.setCmp_notice(request.getParameter("cmp_notice"));
		
		/*String related_bns = request.getParameter("related_bns");
		
		if(related_bns == null) {
			bmdto.setRelated_bns(0);
		} else if(related_bns != null) {
			bmdto.setRelated_bns(Integer.parseInt(related_bns));
		}*/
		
		
		bmdto.setBns_box(Integer.parseInt(request.getParameter("bns_box")));
		
		String important2 = request.getParameter("important2");
		if(important2 == null) {
			bmdto.setImportant(1);
		} else if(important2 != null) {
			bmdto.setImportant(Integer.parseInt(important2));
		}
			
		bmdto.setBm_state(1); // �⺻�� : �̿Ϸ�
		/*���� �� ��¥ */
		bmdto.setBm_start(request.getParameter("bm_start"));
		bmdto.setBm_end(request.getParameter("bm_end"));
		sqlMap.insert("bm.insertBusiness", bmdto);
		
		
		int maxBmNum = (int) sqlMap.queryForObject("bm.showBmNum", null);
		
	
		
		
		/*�����*//*���� �迭�� �������ָ� �ҷ��´� (�������� ���� ���� �� )*/
		bmdto.setBm_num(maxBmNum);
		String inchar_name[] = request.getParameterValues("inchar_name");
/*		System.out.println("===inchar_name !==========="+inchar_name.length);*/
		
		if(inchar_name.length > 0){
			for(String s : inchar_name){
/*				System.out.println("--->"+s);*/
			}
		}
		
/*		String inchar_depart[] = request.getParameterValues("inchar_depart");
		String inchar_position[] = request.getParameterValues("inchar_position");
*/
		if(!inchar_name[0].equals("")){
			
			for(int i=0; i<inchar_name.length; i++ ) {
				bmdto.setInchar_name(inchar_name[i]);
				empDTO edto = (empDTO)sqlMap.queryForObject("bm.empInfpop",emp_num);
				System.out.println(inchar_name[i]);
				bmdto.setInchar_branch(edto.getBranch2());
				System.out.println(edto.getBranch2());
				bmdto.setInchar_depart(edto.getDepartment2());
				bmdto.setInchar_position(edto.getPosition2());
				
				sqlMap.insert("bm.insertIncharge", bmdto);
			}
		}
		
/*			bmdto.setInchar_name("");
			bmdto.setInchar_brunch("");
			bmdto.setInchar_depart("");
			bmdto.setInchar_position("");*/
		


		/*������*/
		bmdto.setBm_num(maxBmNum);
		String ref_name[] = request.getParameterValues("ref_name");
		
		if(ref_name.length > 0){
			for(String s : ref_name){
				System.out.println("--->"+s);
			}
		}
		if(!ref_name[0].equals("")){
		for(int i=0; i<ref_name.length; i++ ) {
			bmdto.setRef_name(ref_name[i]);
			empDTO edto = (empDTO)sqlMap.queryForObject("bm.empInfpop",emp_num);
			bmdto.setRef_branch(edto.getBranch2());
			bmdto.setRef_depart(edto.getDepartment2());
			bmdto.setRef_position(edto.getPosition2());
			
			sqlMap.insert("bm.insertBm_ref", bmdto);
		}
	}
		
		
		
		/*������*/

		bmdto.setBm_num(maxBmNum);
		String rec_name[] = request.getParameterValues("rec_name");
		
		if(rec_name.length > 0){
			for(String s : rec_name){
				System.out.println("--->"+s);
			}
		}
		if(!rec_name[0].equals("")){
		for(int i=0; i<rec_name.length; i++ ) {
			bmdto.setRec_name(rec_name[i]);
			empDTO edto = (empDTO)sqlMap.queryForObject("bm.empInfpop",emp_num);
			bmdto.setRec_branch(edto.getBranch2());
			bmdto.setRec_depart(edto.getDepartment2());
			bmdto.setRec_position(edto.getPosition2());
			sqlMap.insert("bm.insertBms_rec", bmdto);
		}
	}
/*	
		�������� ���
		String his_process = bmdto.getHis_process();
		String his_content = bmdto.getHis_content();
		bmdto.setEmp_num(emp_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setHis_process(his_process);
		bmdto.setHis_content(his_content);
		sqlMap.insert("bm.insertHistory", bmdto);
		*/
		
		
		/*�������� ���*/
		bmdto.setBm_num(maxBmNum);
		String path = request.getRealPath("save"); // ���ε� ���
		System.out.println("1");
		List<MultipartFile> fileMf = request.getFiles("org_file");
		System.out.println("2");
		for(MultipartFile multiFile : fileMf) {
			String fileName = multiFile.getOriginalFilename();
			
			if(fileName != "") {
				bmdto.setOrg_file(fileName);
				int extFile = fileName.lastIndexOf(".");
				fileName = fileName.substring(extFile+1);
				String fmFile = bmdto.getEmp_num()+"_"+bmdto.getBm_num()+"."+fileName;
			
				fmFile = fmFile.replace(" ", "");
				fmFile = fmFile.replace(":", "");
				File ff = new File(path+"//"+fmFile);
		
				try {
					multiFile.transferTo(ff);
				} catch(Exception e) {
					e.printStackTrace();
				}//������ ���� ����
				bmdto.setSys_file(fmFile);
			
				sqlMap.insert("bm.inserBm_file", bmdto);
			}
			
		}
		System.out.println("3");
		
		
/*		String org_file = bmdto.getOrg_file();
		String sys_file = bmdto.getSys_file();
		bmdto.setOrg_file(org_file);
		bmdto.setSys_file(sys_file);
		sqlMap.insert("bm.inserBm_file", bmdto);*/
/*		
		�������� ���
		int bm_form = bmdto.getBm_form();
		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setBm_form(bm_form);
		sqlMap.insert("bm.insertBusiness", bmdto);

/*		���������� ���
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertBns_box", bmdto);*/
		

		
//		model.addAttribute("bm_num", bm_num);
		

		return "/bm/bmFormPro";

	}
	
	/*�����incharPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(HttpServletRequest request,msgDTO dto, HttpSession session, Model model){
		String id = request.getParameter("id");
		int count = (int) sqlMap.queryForObject("bm.empFindCnt", id);
		
		List articleList = null;
		articleList = sqlMap.queryForList("bm.empFind",id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		
		return "/bm/incharPop";

	}
	
	/*����rec_Pop*/
	
	@RequestMapping("/bms_recPop.jp")
	public String bms_recPop(HttpServletRequest request,msgDTO dto, HttpSession session, Model model){
		
		String id = request.getParameter("id");
		int count = (int) sqlMap.queryForObject("bm.empFindCnt", id);
		
		List articleList = null;
		articleList = sqlMap.queryForList("bm.empFind",id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		
		
		/*String emp_num = (String) session.getAttribute("memId");
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		List dp = sqlMap.queryForList("bm.emp_department",null);
		int count = (int) sqlMap.queryForObject("bm.bm_empCount",emp_num);
		List articleList = null;
		articleList = sqlMap.queryForList("employee.memberAll", articleList);		
		model.addAttribute("articleList", articleList);	
		model.addAttribute("count", count);
		model.addAttribute("dp",dp);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);*/
		
		return "/bm/bms_recPop";

	}
	
/*�����ref_Pop*/
	
	@RequestMapping("/refPop.jp")
	public String refPop(HttpServletRequest request,msgDTO dto, HttpSession session, Model model){

		String id = request.getParameter("id");
		int count = (int) sqlMap.queryForObject("bm.empFindCnt", id);
		
		List articleList = null;
		articleList = sqlMap.queryForList("bm.empFind",id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		/*		String emp_num = (String) session.getAttribute("memId");
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		List dp = sqlMap.queryForList("bm.emp_department",null);
		int count = (int) sqlMap.queryForObject("bm.bm_empCount",emp_num);
		List articleList = null;
		articleList = sqlMap.queryForList("employee.memberAll", articleList);		
		model.addAttribute("articleList", articleList);	
		model.addAttribute("count", count);
		model.addAttribute("dp",dp);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);
*/		return "/bm/refPop";

	}
	
	/*���þ��� */
	@RequestMapping("/related_bns.jp")
	public String related_bns(Model model,empDTO dto,HttpSession session){

		
		String emp_num = (String) session.getAttribute("memId");
		List emp_d2 = sqlMap.queryForList("bm.bm_de_department",null);
		List emp_d = sqlMap.queryForList("bm.bm_org_department",null);
		List dp = sqlMap.queryForList("bm.emp_department",null);
		int count = (int) sqlMap.queryForObject("bm.bm_empCount",emp_num);
		
		model.addAttribute("count", count);
		model.addAttribute("dp",dp);
		model.addAttribute("emp_d2",emp_d2);
		model.addAttribute("emp_d",emp_d);

		return "/bm/related_bns";

	}	
	
/*------------------------------------------------------------------------------------------*/		
	/*����(������)*/
	@RequestMapping("/bm_delete1.jp")
	public String bm_delete1(Model model,empDTO dto,HttpSession session){
		return "/bm/bm_delete1";
	}

	/*����(��������)*/
	@RequestMapping("/bm_delete2.jp")
	public String bm_delete2(Model model,empDTO dto,HttpSession session){
		
		return "/bm/bm_delete2";
	}

	
}

