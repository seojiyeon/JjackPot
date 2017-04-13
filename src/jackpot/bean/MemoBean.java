package jackpot.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jackpot.DTO.memoDTO;

@Controller
public class MemoBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memoList.jp")
	public String memoList(Model model, HttpSession session, String pageNum) {
		String emp_num = (String)session.getAttribute("memId");
		int pageSize = 10;
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		List memoCont = sqlMap.queryForList("memo.memoSh", emp_num);
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCont", memoCont);
		model.addAttribute("count", count);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("pageBlock", pageBlock);
		model.addAttribute("endPage", endPage);
		model.addAttribute("sdf", sdf);
		model.addAttribute("memoCateCount", memoCateCount);
		
		System.out.println(emp_num);
		return "/memo/memoList";
	}
	
	@RequestMapping("/memoInsert.jp")
	public String memoInsert(memoDTO dto, HttpSession session, Model model) {
		dto.setEmp_num((String)session.getAttribute("memId"));
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", dto.getEmp_num());
		
		model.addAttribute("memoCateList", memoCateList);
		
		return "/memo/memoInsert";
	}
	
	@RequestMapping("/memoInsertPro.jp")
	public String memoInsertPro(HttpSession session, MultipartHttpServletRequest request) {
		memoDTO dto = new memoDTO();
		dto.setMemo_cate(Integer.parseInt(request.getParameter("memo_cate")));
		dto.setMemo_title(request.getParameter("memo_title"));
		dto.setMemo_content(request.getParameter("memo_content"));
		dto.setEmp_num((String)session.getAttribute("memId"));
		String memoState = request.getParameter("memo_state");

		if(memoState == null) {
			dto.setMemo_state(1);
		} else if(memoState != null){
			dto.setMemo_state(2);
		}
		
		
		/* 이미지 업로드 */
		String pathImg = request.getRealPath("save"); // 업로드 경로
		System.out.println(pathImg);
		MultipartFile mf = request.getFile("org_img"); // 업로드 원본 파일
		String fileName = mf.getOriginalFilename();
		dto.setOrg_img(fileName);
		int extImg = fileName.lastIndexOf(".");
		System.out.println(extImg);
		fileName = fileName.substring(extImg+1);
		Date day = new Date();
		String fmImg = dto.getEmp_num()+"_"+day+"."+fileName;
		
		fmImg = fmImg.replace(" ", "");
		fmImg = fmImg.replace(":", "");
		File f = new File(pathImg+"//"+fmImg);
		
		try {
			mf.transferTo(f);
		} catch(Exception e) {
			e.printStackTrace();
		}
		dto.setSys_img(fmImg);
		
		sqlMap.insert("memo.memoInsert", dto);
		
		return "/memo/memoInsertPro";
	}
	
	@RequestMapping("/memoContent.jp")
	public String memoContent(memoDTO dto, Model model, String pageNum){
		dto = (memoDTO) sqlMap.queryForObject("memo.memoContent", dto);
		List img = sqlMap.queryForList("memo.memoImg", dto);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		model.addAttribute("dto", dto);
		model.addAttribute("img", img);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sdf", sdf);
		
		return "/memo/memoContent";
	}
	
	@RequestMapping("memoModify.jp")
	public String memoModify() {
		return "/memo/memoModify";
	}
	
	@RequestMapping("memoDeletePro.jp")
	public String memoDeletePro(int memo_num, String pageNum, Model model) {
		sqlMap.update("memo.memoDel", memo_num);
		
		model.addAttribute("pageNum", pageNum);
		
		return "/memo/memoDeletePro";
	}
	
	@RequestMapping("memoRemoveList.jp")
	public String memoRemoveList() {
		return "/memo/memoRemoveList";
	}
}