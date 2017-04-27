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
	
	/*모든업무리스트보기*/
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
	
	/*나의 할일*/
	@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		List mytodoList = null;
		mytodoList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		

		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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

	
/*-------------------------------------업무요청-----------------------------------------*/	
	/*나의 업무요청리스트보기*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
	
		List myBmYCHList = null;
		

		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	
	
	/*수신업무요청리스트보기*/
	@RequestMapping("/SSBmYCHList.jp")
	public String SSBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List SSBmYCHList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	
	/*참조업무요청리스트보기*/
	@RequestMapping("/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List ChZBGBmYCHList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBGBmYCHList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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

/*----------------------------업무보고--------------------------------------------------------------*/
	
	/*내가 한 업무보고리스트보기*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List myBmBGList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmBGList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	

	/*수신 업무보고리스트보기*/
	@RequestMapping("/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List SSBGBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBGBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	

	/*참조 업무보고리스트보기*/
	@RequestMapping("/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");
		List ChZBGBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBGBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
/*-----------------------------업무일지-------------------------------------------------------------*/		
	
	/*내가 작성 한 업무일지리스트보기*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List myBmWriteList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		myBmWriteList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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

	/*수신  업무 일지*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List SSBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SSBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	
	/*참조  업무 일지*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");
		List ChZBmList = null;
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", emp_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		ChZBmList = sqlMap.queryForList("bm.getMytodoList", bmdto);
		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	
	
	/*업무등록폼 */
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session,String dateFormatStr ){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		int countBns_box = (int) sqlMap.queryForObject("bm.countBns_box",bmdto);
		List ListBns_box = sqlMap.queryForList("bm.ListBns_box", bmdto);
		
	
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getEmp_name", null);	
	
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);
		model.addAttribute("countBns_box", countBns_box);
		model.addAttribute("ListBns_box", ListBns_box);
		


		return "/bm/bmForm";

	}	
	
	/*업무FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(Model model,bmDTO bmdto, HttpServletRequest request ,HttpSession session){
		
		String emp_num =(String)session.getAttribute("memId");
		String bm_name = (String) sqlMap.queryForObject("bm.getEmp_name", emp_num);
		
	
//		int bm_num = 0;
//
//		int countBm_num = (int) sqlMap.queryForObject("bm.showBmNum", bm_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_title(request.getParameter("bm_title"));
		bmdto.setBm_content(request.getParameter("bm_content"));
		bmdto.setBm_form(Integer.parseInt(request.getParameter("bm_form")));
		
//		bmdto.setBm_content(request.getParameter("enrollment"));
		
		bmdto.setReg_notice(request.getParameter("reg_notice"));
		bmdto.setCmp_notice(request.getParameter("cmp_notice"));
		String related_bns = request.getParameter("related_bns");
		
		if(related_bns == null) {
			bmdto.setRelated_bns(0);
		} else if(related_bns != null) {
			bmdto.setRelated_bns(Integer.parseInt(related_bns));
		}
		
		bmdto.setBns_box(Integer.parseInt(request.getParameter("bns_box")));
		
		String important = request.getParameter("important");
		if(important == null) {
			bmdto.setImportant(1);
		} else if(important != null) {
			bmdto.setImportant(Integer.parseInt(important));
		}
			
		bmdto.setBm_state(1); // 기본값 : 미완료
		
		/*시작 끝 날짜 */
		bmdto.setBm_start(request.getParameter("bm_start"));
		bmdto.setBm_end(request.getParameter("bm_end"));
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_name(bm_name);
		sqlMap.insert("bm.insertBusiness", bmdto);
		int maxBmNum = (int) sqlMap.queryForObject("bm.showBmNum", null);
		
	
		
		
		/*담당자*/
		
		String Inchar = bmdto.getInchar_name();
		String inchar_name[] = request.getParameterValues("inchar_name");
		for(int i=0; i<inchar_name.length; i++ ) {
			bmdto.setInchar_name(inchar_name[i]);
			sqlMap.insert("bm.insertIncharge", bmdto);
		}

		/*참조자*/
		String Bm_ref = bmdto.getRef_name();
		bmdto.setEmp_num(emp_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		String ref_name[] = request.getParameterValues("ref_name");
		for(int i=0; i<ref_name.length; i++ ) {
			bmdto.setRef_name(ref_name[i]);
			sqlMap.insert("bm.insertBm_ref", bmdto);
		}
		
		
		
		/*수신자*/
		String Bms_ref = bmdto.getRec_name();
		bmdto.setEmp_num(emp_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		String rec_name[] = request.getParameterValues("rec_name");
		for(int i=0; i<inchar_name.length; i++ ) {
			bmdto.setRec_name(rec_name[i]);
			sqlMap.insert("bm.insertBms_rec", bmdto);
		}
		
		/*업무내역 등록*/
		String his_process = bmdto.getHis_process();
		String his_content = bmdto.getHis_content();
		bmdto.setEmp_num(emp_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setHis_process(his_process);
		bmdto.setHis_content(his_content);
		sqlMap.insert("bm.insertHistory", bmdto);
		
		/*업무파일 등록*/
		String org_file = bmdto.getOrg_file();
		String sys_file = bmdto.getSys_file();
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setOrg_file(org_file);
		bmdto.setSys_file(sys_file);
		sqlMap.insert("bm.inserBm_file", bmdto);
		
		/*업무형태 등록*/
		int bm_form = bmdto.getBm_form();
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setBm_form(bm_form);
		sqlMap.insert("bm.insertBusiness", bmdto);
		
/*		업무보관함 등록
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertBns_box", bmdto);*/
		

		
//		model.addAttribute("bm_num", bm_num);
		

		return "/bm/bmFormPro";

	}
	
	/*담당자incharPop*/
	
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
	
	/*담당자incharPop*/
	
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