package jackpot.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jackpot.DTO.memoDTO;

@Controller
public class MemoBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memoList.jp")
	public String memoList(Model model, HttpSession session, String pageNum) {
		/* 모든 메모 리스트 */
		String emp_num = (String)session.getAttribute("memId");
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);

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

		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("emp_num", emp_num);
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		List memoCont = sqlMap.queryForList("memo.memoSh", params);
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCont", memoCont);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
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
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", dto.getEmp_num());
		int count = (int) sqlMap.queryForObject("memo.memoCount", dto.getEmp_num());
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", dto.getEmp_num());
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCateCount", memoCateCount);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
		
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
		
		sqlMap.insert("memo.memoInsert", dto);
		int memoNum = (int)sqlMap.queryForObject("memo.memoNumSelect", dto);
		dto.setMemo_num(memoNum);
		
		Date day = new Date();
		
		/* 이미지 업로드 */
		String pathImg = request.getRealPath("save"); // 업로드 경로
		System.out.println(pathImg);
		List<MultipartFile> mf = request.getFiles("org_img"); // 업로드 원본 파일
		
		for(MultipartFile multiImg : mf) {
			String imgName = multiImg.getOriginalFilename();
			dto.setOrg_img(imgName);
			int extImg = imgName.lastIndexOf(".");
			System.out.println(extImg);
			imgName = imgName.substring(extImg+1);
			
			String fmImg = dto.getEmp_num()+"_"+day+"."+imgName;
			
			fmImg = fmImg.replace(" ", "");
			fmImg = fmImg.replace(":", "");
			File f = new File(pathImg+"//"+fmImg);
			
			try {
				multiImg.transferTo(f);
			} catch(Exception e) {
				e.printStackTrace();
			}
			dto.setSys_img(fmImg);
			
			sqlMap.insert("memo.memoInsImg", dto);
		}
		
		
		/* 파일 업로드 */
		String pathFile = request.getRealPath("save");
		System.out.println(pathFile);
		List<MultipartFile> fileMf = request.getFiles("org_file");
		
		for(MultipartFile multiFile : fileMf) {
			String fileName = multiFile.getOriginalFilename();
			dto.setOrg_file(fileName);
			int extFile = fileName.lastIndexOf(".");
			fileName = fileName.substring(extFile+1);
			String fmFile = dto.getEmp_num()+"_"+day+"."+fileName;
			
			fmFile = fmFile.replace(" ", "");
			fmFile = fmFile.replace(":", "");
			File ff = new File(pathFile+"//"+fmFile);
		
			try {
				multiFile.transferTo(ff);
			} catch(Exception e) {
				e.printStackTrace();
			}
			dto.setSys_file(fmFile);
			
			sqlMap.insert("memo.memoInsFile", dto);
		}
		
		return "/memo/memoInsertPro";
	}
	
	@RequestMapping("/memoContent.jp")
	public String memoContent(memoDTO dto, Model model, String pageNum){
		/* 메모 내용 불러오기 */
		dto = (memoDTO) sqlMap.queryForObject("memo.memoContent", dto);
		
		/* 메모 이미지 불러오기 */
		List img = sqlMap.queryForList("memo.memoImg", dto);
		int imgCount = (int)sqlMap.queryForObject("memo.memoImgCount", dto);
		
		/* 메모 파일 불러오기 */
		List file = sqlMap.queryForList("memo.memoFile", dto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", dto);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		/* 메모 폴더 개수, 내용 불러오기*/
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", dto.getEmp_num());
		List memoCateList = sqlMap.queryForList("memo.memoCate", dto.getEmp_num());
		
		/* 메모 내용 개수 */
		int count = (int) sqlMap.queryForObject("memo.memoCount", dto.getEmp_num());
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", dto.getEmp_num());
		
		/* 메모 상태 불러오기 */
		int memoState = (int) sqlMap.queryForObject("memo.memoState", dto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("img", img);
		model.addAttribute("imgCount", imgCount);
		model.addAttribute("file", file);
		model.addAttribute("fileCount", fileCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("sdf", sdf);
		model.addAttribute("memoCateCount", memoCateCount);
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("file", file);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
		model.addAttribute("memoState", memoState);
		
		return "/memo/memoContent";
	}
	
	@RequestMapping(value={"/memoFileDown.jp"})
	public ModelAndView memoFileDown(String fileName, HttpServletRequest request) {
		String dir = request.getRealPath("save");
		File f = new File(dir+"//"+fileName);
		ModelAndView mv = new ModelAndView("down", "downloadFile", f);
		return mv;
	}
	
	@RequestMapping("memoModify.jp")
	public String memoModify(Model model, HttpSession session, memoDTO dto, String pageNum) {
		/* 왼쪽 사이드바에 들어갈 내용 */
		String emp_num = (String)session.getAttribute("memId");
		
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);
		
		/* 저장된 내용 불러오기 */
		dto = (memoDTO) sqlMap.queryForObject("memo.memoContent", dto);
		int imgCount = (int)sqlMap.queryForObject("memo.memoImgCount", dto);
		List img = sqlMap.queryForList("memo.memoImg", dto);
		int fileCount = (int)sqlMap.queryForObject("memo.memoFileCount", dto);
		List file = sqlMap.queryForList("memo.memoFile", dto);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoCateCount", memoCateCount);
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("count", count);
		model.addAttribute("dto", dto);
		model.addAttribute("img", img);
		model.addAttribute("imgCount", imgCount);
		model.addAttribute("file", file);
		model.addAttribute("fileCount", fileCount);
		model.addAttribute("removeCount", removeCount);
		
		return "/memo/memoModify";
	}
	
	@RequestMapping("memoDeletePro.jp")
	public String memoDeletePro(int memo_num, String pageNum, Model model) {
		sqlMap.update("memo.memoDel", memo_num);
		
		model.addAttribute("pageNum", pageNum);
		
		return "/memo/memoDeletePro";
	}
	
	@RequestMapping("memoRemoveList.jp")
	public String memoRemoveList(Model model, HttpSession session, String pageNum) {
		/* 휴지통에 있는 메모 리스트 */
		String emp_num = (String)session.getAttribute("memId");
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);

		if(pageNum == null) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int pageCount = removeCount / pageSize + ( count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > pageCount) {
			endPage = pageCount;
		}

		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("emp_num", emp_num);
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		List memoCont = sqlMap.queryForList("memo.memoRemoveSh", params);
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCont", memoCont);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
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
		
		return "/memo/memoRemoveList";
	}
}