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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	/*모든업무리스트보기*/
	@RequestMapping("/bmList.jp")
	public String bmList( String pageNum,HttpSession session, bmDTO bmdto, Model model, HttpServletRequest request){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBmList", bmdto);
		int bmcount = (int) sqlMap.queryForObject("bm.bmcount", bmdto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

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
	
	/*삭제 */
	@RequestMapping("bm_delete1.jp")
	public String bm_delete1(bmDTO bmdto, String pageNum,  Model model, HttpServletRequest request) { 
		String bm_num[] = request.getParameterValues("bm_num");
		String path = request.getRealPath("save");
		 System.out.println(bm_num);
		for(int i=0; i<bm_num.length; i++) {
			bmdto.setBm_num(Integer.parseInt(bm_num[i]));

			
			/* 파일 삭제 */
			List sys_file = sqlMap.queryForList("bm.Bm_file", bmdto);
			for(int b=0; b<sys_file.size(); b++) {
				try {
					bmDTO bmdto2 = (bmDTO)sys_file.get(b);
					File fileF = new File(path+"\\"+bmdto2.getSys_file());
					
					if(fileF.exists()) {
						fileF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			sqlMap.delete("bm.bmdelete_file", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_incharge", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bms_rec", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bm_ref", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete", bmdto.getBm_num());
		}
		
		
		return "/bm/bm_delete1";
	}
	
/*-----------------------------todo-------------------------------------------------------------*/		
	
	/*나의 할일*/
@RequestMapping("/mytodoList.jp")
	public String mytodoList(bmDTO bmdto, HttpSession session, Model model,String pageNum){

		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		int count = (int) sqlMap.queryForObject("bm.getMytodoListcount", bm_name);
		
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
	

		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount =0;
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("bm_name", bm_name);

		List mytodoList = null;
		mytodoList = sqlMap.queryForList("bm.getMytodoList", bm_name);

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

		return "/bm/mytodo/mytodoList";
		
	}	
	
	/*나의 업무요청 내용 보기*/
@RequestMapping("/mytodoContent.jp")
	public String mytodoContent(HttpServletRequest request, bmDTO bmdto,Model model,HttpSession session,bmDTO bdto){
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bm_num);

		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		bmdto = (bmDTO) sqlMap.queryForObject("bm.getBusinessCont", bm_num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*  파일 불러오기 */
		List Bm_file = sqlMap.queryForList("bm.Bm_file", bmdto);
		int fileCount = (int)sqlMap.queryForObject("bm.Bm_filecount", bmdto);
	
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("bm_num", bm_num);
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("sdf", sdf);		
		model.addAttribute("Bm_file", Bm_file);		
		model.addAttribute("fileCount", fileCount);	
		
		return "/bm/mytodo/mytodoContent";
		
	}
	/*나의할일 삭제 */
	@RequestMapping("my_bm_delete.jp")
	public String my_bm_delete(bmDTO bmdto, String pageNum,  Model model, HttpServletRequest request) { 
		String bm_num[] = request.getParameterValues("bm_num");
		String path = request.getRealPath("save");
		 System.out.println(bm_num);
		for(int i=0; i<bm_num.length; i++) {
			bmdto.setBm_num(Integer.parseInt(bm_num[i]));

			/* 파일 삭제 */
			List sys_file = sqlMap.queryForList("bm.Bm_file", bmdto);
			for(int b=0; b<sys_file.size(); b++) {
				try {
					bmDTO bmdto2 = (bmDTO)sys_file.get(b);
					File fileF = new File(path+"\\"+bmdto2.getSys_file());
					
					if(fileF.exists()) {
						fileF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			sqlMap.delete("bm.bmdelete_file", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_incharge", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bms_rec", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bm_ref", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete", bmdto.getBm_num());
		}
		
		return "/bm/mytodo/my_bm_delete";
	}
	
/*-------------------------------------업무요청-----------------------------------------*/	
	/*내가 한 업무요청리스트보기*/
	@RequestMapping("/myBmYCHList.jp")
	public String myBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List MyBmYchList = null;
		MyBmYchList = sqlMap.queryForList("bm.getMyBmYchList", bm_name);
		int count = (int) sqlMap.queryForObject("bm.getBmYchListcount", bm_name);
	
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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("MyBmYchList", MyBmYchList);
		model.addAttribute("count", count);			
	
	
		return "/bm/BmYCHList/myBmYCHList";
		
	}
	
	/*나의 업무요청 내용 보기*/
	@RequestMapping("/myBmYCHContent.jp")
	public String myBmYCHcontent(HttpServletRequest request, bmDTO bmdto,Model model,HttpSession session,bmDTO bdto){
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		bmdto.setBm_num(bm_num);
	
		bmdto = (bmDTO) sqlMap.queryForObject("bm.getBmYchcont", bm_num);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		/*  파일 불러오기 */
		List Bm_file = sqlMap.queryForList("bm.Bm_file", bmdto);
		int fileCount = (int)sqlMap.queryForObject("bm.Bm_filecount", bmdto);
	
		
		
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("bm_num", bm_num);
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("bmdto", bmdto);
		model.addAttribute("sdf", sdf);		
		model.addAttribute("Bm_file", Bm_file);		
		model.addAttribute("fileCount", fileCount);	
		
		
		
		return "/bm/BmYCHList/myBmYCHContent";
		
	}
	/*나의할일 삭제 */
	@RequestMapping("my_bmYCHDel.jp")
	public String my_bmYCHDel(bmDTO bmdto, String pageNum,  Model model, HttpServletRequest request) { 
		String bm_num[] = request.getParameterValues("bm_num");
		String path = request.getRealPath("save");
		 System.out.println(bm_num);
		for(int i=0; i<bm_num.length; i++) {
			bmdto.setBm_num(Integer.parseInt(bm_num[i]));

			/* 파일 삭제 */
			List sys_file = sqlMap.queryForList("bm.Bm_file", bmdto);
			for(int b=0; b<sys_file.size(); b++) {
				try {
					bmDTO bmdto2 = (bmDTO)sys_file.get(b);
					File fileF = new File(path+"\\"+bmdto2.getSys_file());
					
					if(fileF.exists()) {
						fileF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			sqlMap.delete("bm.bmdelete_file", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_incharge", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bms_rec", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_bm_ref", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete", bmdto.getBm_num());
			sqlMap.delete("bm.bmdelete_History", bmdto.getBm_num());
		}
		
		return "/bm/BmYCHList/my_bmYCHDel";
	}
	
	/*수신업무요청리스트보기*/
	@RequestMapping("/SSBmYCHList.jp")
	public String SSBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String rec_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List SBmYCHList = null;
		SBmYCHList = sqlMap.queryForList("bm.getSSBmYCHList", rec_name);
		int count = (int) sqlMap.queryForObject("bm.getSSBmYCHListcount", rec_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SBmYCHList", SBmYCHList);
		model.addAttribute("count", count);			
	
		return "/bm/BmYCHList/SSBmYCHList";
		
	}
	
	/*참조업무요청리스트보기*/
	@RequestMapping("/ChZBGBmYCHList.jp")
	public String ChZBGBmYCHList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String ref_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List ChZBGBmYCHList = null;
		ChZBGBmYCHList = sqlMap.queryForList("bm.getChZBGBmYCHList", ref_name);
		int count = (int) sqlMap.queryForObject("bm.getChZBGBmYCHListcount", ref_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBGBmYCHList", ChZBGBmYCHList);
		model.addAttribute("count", count);	
		
		return "/bm/BmYCHList/ChZBGBmYCHList";
		
	}

/*----------------------------업무보고--------------------------------------------------------------*/
	
	/*내가 한 업무보고리스트보기*/
	@RequestMapping("/myBmBGList.jp")
	public String myBmBGList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List MyBmBgList = null;
		MyBmBgList = sqlMap.queryForList("bm.getMyBmBgList", bm_name);
		int count = (int) sqlMap.queryForObject("bm.getMyBmBgListcount", bm_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("MyBmBgList", MyBmBgList);
		model.addAttribute("count", count);	
		
		return "/bm/BmBGList/myBmBGList";

	}
	

	/*수신 업무보고리스트보기*/
	@RequestMapping("/SSBGBmList.jp")
	public String SSBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String rec_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List SSBmBgList = null;
		SSBmBgList = sqlMap.queryForList("bm.getSSBmBgList", rec_name);
		int count = (int) sqlMap.queryForObject("bm.getSSBmBgListcount", rec_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SSBmBgList", SSBmBgList);
		model.addAttribute("count", count);	
		
		return "/bm/BmBGList/SSBGBmList";

	}
	

	/*참조 업무보고리스트보기*/
	@RequestMapping("/ChZBGBmList.jp")
	public String ChZBGBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String ref_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List ChZBGBmList = null;
		ChZBGBmList = sqlMap.queryForList("bm.getChZBGBmList", ref_name);
		int count = (int) sqlMap.queryForObject("bm.getChZBGBmListcount", ref_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBGBmList", ChZBGBmList);
		model.addAttribute("count", count);	
		
		return "/bm/BmBGList/ChZBGBmList";

	}
	
/*-----------------------------업무일지-------------------------------------------------------------*/		
	
	/*내가 작성 한 업무일지리스트보기*/
	@RequestMapping("/myBmWriteList.jp")
	public String myBmWriteList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List MyBmIjList = null;
		MyBmIjList = sqlMap.queryForList("bm.getMyBmIjList", bm_name);
		int count = (int) sqlMap.queryForObject("bm.getBmIjListcount", bm_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("MyBmIjList", MyBmIjList);
		model.addAttribute("count", count);	
		
		return "/bm/BmList/myBmWriteList";

	}

	/*수신  업무 일지*/
	@RequestMapping("/SSBmList.jp")
	public String SSBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String rec_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List SSBmIjList = null;
		SSBmIjList = sqlMap.queryForList("bm.getSSBmIjList", rec_name);
		int count = (int) sqlMap.queryForObject("bm.getChZBGBmListcount", rec_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("SSBmIjList", SSBmIjList);
		model.addAttribute("count", count);	
		
		
		return "/bm/BmList/SSBmList";

	}
	
	/*참조  업무 일지*/
	@RequestMapping("/ChZBmList.jp")
	public String ChZBmList(bmDTO bmdto,Model model,HttpSession session,bmDTO bdto,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String ref_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List ChZBGBmIjList = null;
		ChZBGBmIjList = sqlMap.queryForList("bm.getChZBGBmIjList", ref_name);
		int count = (int) sqlMap.queryForObject("bm.getChZBGBmIjListcount", ref_name);

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
	
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("ChZBGBmIjList", ChZBGBmIjList);
		model.addAttribute("count", count);	
		
		return "/bm/BmList/ChZBmList";

	}
	
/*------------------------------------------------------------------------------------------*/		
	
	
	/*업무등록폼 */
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session,String dateFormatStr,HttpServletRequest request){
		int countBns_box = (int) sqlMap.queryForObject("bm.countBns_box",bmdto);
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List ListBns_box = sqlMap.queryForList("bm.ListBns_box", null);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getEmp_name2", emp_num);	
	
		model.addAttribute("bm_name",bm_name);
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);
		model.addAttribute("countBns_box", countBns_box);
		model.addAttribute("ListBns_box", ListBns_box);
		


		return "/bm/bmForm";

	}	
	
	/*업무FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(Model model,HttpSession session, MultipartHttpServletRequest request){
		
		bmDTO bmdto = new bmDTO();
		empDTO edto2 = new empDTO();
		String emp_num =(String)session.getAttribute("memId");
		
		empDTO edto1 = (empDTO)sqlMap.queryForObject("bm.empInf",emp_num);

		
		bmdto.setEmp_num((String)session.getAttribute("memId"));   //emp_num 불러와서 저장
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
			
		bmdto.setBm_state(1); // 기본값 : 미완료
		/*시작 끝 날짜 */
		bmdto.setBm_start(request.getParameter("bm_start"));
		bmdto.setBm_end(request.getParameter("bm_end"));
		sqlMap.insert("bm.insertBusiness", bmdto);

		int maxBmNum = (int) sqlMap.queryForObject("bm.showBmNum", null);
		
	
		
		
		/*담당자*//*각각 배열로 지정해주며 불러온다 (여러값이 들어가기 위한 것 )*/
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
				bmdto.setEmp_num(edto.getEmp_num());
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
		


		/*참조자*/
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
			bmdto.setEmp_num(edto.getEmp_num());
			bmdto.setRef_branch(edto.getBranch2());
			bmdto.setRef_depart(edto.getDepartment2());
			bmdto.setRef_position(edto.getPosition2());
			
			sqlMap.insert("bm.insertBm_ref", bmdto);
		}
	}
		
		
		
		/*수신자*/

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
			bmdto.setEmp_num(edto.getEmp_num());
			bmdto.setRec_branch(edto.getBranch2());
			bmdto.setRec_depart(edto.getDepartment2());
			bmdto.setRec_position(edto.getPosition2());
			sqlMap.insert("bm.insertBms_rec", bmdto);
		}
	}
/*	
		업무내역 등록
		String his_process = bmdto.getHis_process();
		String his_content = bmdto.getHis_content();
		bmdto.setEmp_num(emp_num);
//		bmdto.setBm_num(bm_num);
		bmdto.setBm_num(maxBmNum);
		bmdto.setHis_process(his_process);
		bmdto.setHis_content(his_content);
		sqlMap.insert("bm.insertHistory", bmdto);
		*/
		
		
		/*업무파일 등록*/
		bmdto.setBm_num(maxBmNum);
		String path = request.getRealPath("save"); // 업로드 경로
		System.out.println("1");
		List<MultipartFile> fileMf = request.getFiles("org_file");
		System.out.println("2");
		for(MultipartFile multiFile : fileMf) {
			String fileName = multiFile.getOriginalFilename();
			
			if(fileName != "") {
				bmdto.setOrg_file(fileName);
				int extFile = fileName.lastIndexOf(".");
				fileName = fileName.substring(extFile+1);
				String fmFile ="_"+bmdto.getBm_num()+"."+fileName;
			
				fmFile = fmFile.replace(" ", "");
				fmFile = fmFile.replace(":", "");
				File ff = new File(path+"//"+fmFile);
		
				try {
					multiFile.transferTo(ff);
				} catch(Exception e) {
					e.printStackTrace();
				}//서버에 파일 저장
				bmdto.setSys_file(fmFile);
			
				sqlMap.insert("bm.inserBm_file", bmdto);
			}
			
		}


/*		업무보관함 등록
		bmdto.setBm_num(bmNum);
		sqlMap.insert("bm.insertBns_box", bmdto);*/


		return "/bm/bmFormPro";

	}
	
	/*담당자incharPop*/
	
	@RequestMapping("/incharPop.jp")
	public String incharPop(HttpServletRequest request, HttpSession session, Model model){
		String id = request.getParameter("id");
		int count = (int) sqlMap.queryForObject("bm.empFindCnt", id);
		
		List articleList = null;
		articleList = sqlMap.queryForList("bm.empFind",id);
		model.addAttribute("count", count);
		model.addAttribute("articleList", articleList);		
		
		
		return "/bm/incharPop";

	}
	
	/*수신자 rec_Pop*/
	
	@RequestMapping("/bms_recPop.jp")
	public String bms_recPop(HttpServletRequest request,HttpSession session, Model model){
		
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
	
/*참조자 ref_Pop*/
	
	@RequestMapping("/refPop.jp")
	public String refPop(HttpServletRequest request, HttpSession session, Model model){

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
	
	/*관련업무 */
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
/*	삭제(휴지통)
	@RequestMapping("/bm_delete1.jp")
	public String bm_delete1(Model model,empDTO dto,HttpSession session){
		return "/bm/bm_delete1";
	}

	삭제(완전삭제)
	@RequestMapping("/bm_delete2.jp")
	public String bm_delete2(Model model,empDTO dto,HttpSession session){
		
		return "/bm/bm_delete2";
	}
*/
/*--------------파일다운----------------------------------------------------------------------------*/
	@RequestMapping(value={"/bmFileDown.jp"})
	public ModelAndView bmFileDown(String fileName, HttpServletRequest request) {
		String dir = request.getRealPath("save");
		File f = new File(dir+"//"+fileName);
		ModelAndView mv = new ModelAndView("down", "downloadFile", f);
		return mv;
	}
	/*--------------나의 업무완료로 수정  ----------------------------------------------------------------------------*/
	@RequestMapping("/mytodo_state_update.jp")
	public String mytodo_state_update(bmDTO bmdto, HttpServletRequest request) {
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
/*		bmdto.setBm_num(bm_num);*/
		sqlMap.update("bm.mytodo_state_update",bm_num);
		
		return "/bm/mytodo/mytodo_state_update";
	}
	
	/*나의업무 완료 리스트 */
	@RequestMapping("/mytodook.jp")
	public String mytodook(bmDTO bmdto, HttpSession session, Model model,String pageNum){
		
		String emp_num = (String)session.getAttribute("memId");	
		bmdto.setEmp_num(emp_num);
		String bm_name = (String)sqlMap.queryForObject("bm.getEmp_name1", emp_num);
		List mytodook = null;
		mytodook = sqlMap.queryForList("bm.mytodook", bm_name);
		int count = (int) sqlMap.queryForObject("bm.getmytodookcount", bm_name);

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
		
		System.out.println(mytodook);
		model.addAttribute("emp_num", emp_num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("mytodook", mytodook);
		model.addAttribute("count", count);			
		return "/bm/mytodo/mytodook";
	}	
	
/*--------------업무중요체크----------------------------------------------------------------------------*/
	
	/*나의업무*/
	@RequestMapping("MybmImportantChange.jp")
	public @ResponseBody int Imp(HttpServletRequest request, bmDTO bmdto, Model model) {
		
		/*String pageNum = request.getParameter("pageNum");*/
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
		int important = (int)sqlMap.queryForObject("bm.getimp",bm_num);
		System.out.println(bm_num);
		System.out.println(important);
		
		
			sqlMap.update("bm.bmImportantChange1", bm_num);
		
		

		/*model.addAttribute("pageNum", pageNum);*/

				
		return bm_num;
	}		
	

	/*업무요청*/
	@RequestMapping("bmYCHImportantChange.jp")
	public String bmYCHImportantChange(HttpServletRequest request, bmDTO bmdto, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		int important = Integer.parseInt(request.getParameter("important"));
		if(important == 1) {
			bmdto.setImportant(2);
		} else if(important == 2) {
			bmdto.setImportant(1);
		}
		
		sqlMap.update("bm.bmStateChange", bmdto);
		
		model.addAttribute("pageNum", pageNum);

				
		return "/bm/BmYCHList/bmYCHImportantChange";
	}
	
	/*업무일지*/
	@RequestMapping("bmIjImportantChange.jp")
	public String bmIjImportantChange(HttpServletRequest request, bmDTO bmdto, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		int important = Integer.parseInt(request.getParameter("important"));
		if(important == 1) {
			bmdto.setImportant(2);
		} else if(important == 2) {
			bmdto.setImportant(1);
		}
		
		sqlMap.update("bm.bmStateChange", bmdto);
		
		model.addAttribute("pageNum", pageNum);

				
		return "/bm/BmList/bmIjImportantChange";
	}	
	
	/*업무보고*/
	@RequestMapping("bmBgImportantChange.jp")
	public String bmBgImportantChange(HttpServletRequest request, bmDTO bmdto, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		int bm_num=Integer.parseInt(request.getParameter("bm_num"));
		int important = Integer.parseInt(request.getParameter("important"));
		if(important == 1) {
			bmdto.setImportant(2);
		} else if(important == 2) {
			bmdto.setImportant(1);
		}
		
		sqlMap.update("bm.bmStateChange", bmdto);
		
		model.addAttribute("pageNum", pageNum);

				
		return "/bm/BmBGList/MybmImportantChange";
	}		

	
}

