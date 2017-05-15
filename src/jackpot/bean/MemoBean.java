package jackpot.bean;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import jackpot.DTO.memoDTO;

@Controller
public class MemoBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memoList.jp")
	public String memoList(Model model, HttpSession session, memoDTO dto, HttpServletRequest request) {
		
		int memoGroup = Integer.parseInt(request.getParameter("memoGroup"));
		String pageNum = request.getParameter("pageNum");
		String emp_num = (String)session.getAttribute("memId");
		dto.setEmp_num(emp_num);
		int pageSize = 10; // 추후 파라미터를 받아서 해야함.
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);
		int impCount = (int) sqlMap.queryForObject("memo.memoImpCount", emp_num);
		int viewCount = (int) sqlMap.queryForObject("memo.memoViewCount", dto);

		if(pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*pageSize+1;
		int endRow = currentPage*pageSize;
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage+pageBlock-1;
		int pageCount = 0;
		
		if(memoGroup == 1) {
			pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		} else if(memoGroup == 2) {
			pageCount = impCount / pageSize + ( impCount % pageSize == 0 ? 0 : 1);
		} else if(memoGroup == 0) {
			pageCount = removeCount / pageSize + ( removeCount % pageSize == 0 ? 0 : 1);
		} else if(memoGroup == 3) {
			pageCount = viewCount / pageSize + ( viewCount % pageSize == 0 ? 0 : 1);
		}

		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("emp_num", emp_num);
		params.put("memo_cate", dto.getMemo_cate());
				
		/* 메모 카테고리 내용 */
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		
		/* 메모 상태에 따른 내용 불러오기 */
		System.out.println(memoGroup);
		List memoCont = null;
		
		if(memoGroup == 1) {
			memoCont = sqlMap.queryForList("memo.memoSh", params);
		} else if(memoGroup == 2) {
			memoCont = sqlMap.queryForList("memo.memoImp", params);
		} else if(memoGroup == 0) {
			memoCont = sqlMap.queryForList("memo.memoRemoveSh", params);
		} else if(memoGroup == 3) {
			memoCont = sqlMap.queryForList("memo.memoView", params);
		}
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		dto.setCate_num(dto.getMemo_cate());
		String memoCateName = (String) sqlMap.queryForObject("memo.memoCateName", dto);
		
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
		model.addAttribute("impCount", impCount);
		model.addAttribute("viewCount", viewCount);
		model.addAttribute("memoGroup", memoGroup);
		model.addAttribute("memoCateName", memoCateName);
		
		System.out.println(emp_num);
		return "/memo/memoList";
	}

	@RequestMapping("/memoInsert.jp")
	public String memoInsert(memoDTO dto, HttpSession session, Model model, int memoGroup) {
		dto.setEmp_num((String)session.getAttribute("memId"));
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", dto.getEmp_num());
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", dto.getEmp_num());
		int count = (int) sqlMap.queryForObject("memo.memoCount", dto.getEmp_num());
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", dto.getEmp_num());
		int impCount = (int) sqlMap.queryForObject("memo.memoImpCount", dto.getEmp_num());
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCateCount", memoCateCount);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
		model.addAttribute("impCount", impCount);
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoInsert";
	}
	
	@RequestMapping("/memoInsertPro.jp")
	public String memoInsertPro(HttpSession session, MultipartHttpServletRequest request, int memoGroup, Model model) {
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
		
		String path = request.getRealPath("save"); // 업로드 경로
		
		/* 이미지 업로드 */
		System.out.println("1 : "+path);
		List<MultipartFile> mf = request.getFiles("org_img"); // 업로드 원본 파일
		
		for(MultipartFile multiImg : mf) {
			String imgName = multiImg.getOriginalFilename();
			
			if(imgName != "") {
				dto.setOrg_img(imgName);
				System.out.println("2 : "+imgName);
				int extImg = imgName.lastIndexOf(".");
				System.out.println(extImg);
				imgName = imgName.substring(extImg+1);
			
				String fmImg = dto.getEmp_num()+"_"+dto.getMemo_num()+"."+imgName;
			
				File f = new File(path+"//"+fmImg);
			
				try {
					multiImg.transferTo(f);
				} catch(Exception e) {
					e.printStackTrace();
				}
				dto.setSys_img(fmImg);
			
				sqlMap.insert("memo.memoInsImg", dto);
			}
		}
		
		
		/* 파일 업로드 */
		List<MultipartFile> fileMf = request.getFiles("org_file");
		
		for(MultipartFile multiFile : fileMf) {
			String fileName = multiFile.getOriginalFilename();
			
			if(fileName != "") {
				dto.setOrg_file(fileName);
				int extFile = fileName.lastIndexOf(".");
				fileName = fileName.substring(extFile+1);
				String fmFile = dto.getEmp_num()+"_"+dto.getMemo_num()+"."+fileName;
			
				fmFile = fmFile.replace(" ", "");
				fmFile = fmFile.replace(":", "");
				File ff = new File(path+"//"+fmFile);
		
				try {
					multiFile.transferTo(ff);
				} catch(Exception e) {
					e.printStackTrace();
				}
				dto.setSys_file(fmFile);
			
				sqlMap.insert("memo.memoInsFile", dto);
			}
		}
		
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoInsertPro";
	}
	
	@RequestMapping("/memoContent.jp")
	public String memoContent(memoDTO dto, Model model, String pageNum, int memoGroup){
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
		int impCount = (int) sqlMap.queryForObject("memo.memoImpCount", dto.getEmp_num());
		
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
		model.addAttribute("impCount", impCount);
		model.addAttribute("memoGroup", memoGroup);
		
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
	public String memoModify(Model model, HttpSession session, memoDTO dto, String pageNum, int memoGroup) {
		/* 왼쪽 사이드바에 들어갈 내용 */
		String emp_num = (String)session.getAttribute("memId");
		
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);
		int impCount = (int) sqlMap.queryForObject("memo.memoImpCount", emp_num);
		
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
		model.addAttribute("impCount", impCount);
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoModify";
	}
	
	@RequestMapping("memoDeletePro.jp")
	public String memoDeletePro(String pageNum, int memoGroup, Model model, HttpServletRequest request) { 
		String memo_num[] = request.getParameterValues("memo_num");
	
		for(int i=0; i<memo_num.length; i++) {
			memoDTO dto = new memoDTO();
			
			dto.setMemo_num(Integer.parseInt(memo_num[i]));
		
			sqlMap.update("memo.memoDel", dto.getMemo_num());
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoDeletePro";
	}

	@RequestMapping("memoRemovePro.jp")
	public String memoRemovePro(String pageNum, int memoGroup, memoDTO dto, HttpServletRequest request, Model model) {
		String memoNum[] = request.getParameterValues("memo_num");
		String path = request.getRealPath("save");
		
		for(int i=0; i<memoNum.length; i++) {
			dto.setMemo_num(Integer.parseInt(memoNum[i]));
			
			List sys_img = sqlMap.queryForList("memo.memoImg", dto);
			List sys_file = sqlMap.queryForList("memo.memoFile", dto);
			
			System.out.println(path);
			
			/* 이미지 삭제 */
			for(int a=0; a<sys_img.size(); a++) {
				try {
					memoDTO dtoImg = (memoDTO)sys_img.get(a);
					File imgF = new File(path+"\\"+dtoImg.getSys_img());
					System.out.println(sys_img.get(a));
					if(imgF.exists()) {
						imgF.delete();
					}
				} catch(Exception e ) {
					e.printStackTrace();
				}
			}
			
			/* 파일 삭제 */
			for(int b=0; b<sys_file.size(); b++) {
				try {
					memoDTO dtoFile = (memoDTO)sys_file.get(b);
					File fileF = new File(path+"\\"+dtoFile.getSys_file());
					
					if(fileF.exists()) {
						fileF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			}

				
				sqlMap.delete("memo.memoRemoveImg", dto.getMemo_num());
				sqlMap.delete("memo.memoRemoveFile", dto.getMemo_num());
				sqlMap.delete("memo.memoRemove", dto.getMemo_num());
		}
		
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoRemovePro";
	}
	
	@RequestMapping("/memoCateManage.jp")
	public String memoCateManage(HttpSession session, Model model) {
		/* 왼쪽 사이드바 */
		String emp_num = (String)session.getAttribute("memId");
		
		int memoCateCount = (int) sqlMap.queryForObject("memo.memoCateCount", emp_num);
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		int count = (int) sqlMap.queryForObject("memo.memoCount", emp_num);
		int removeCount = (int) sqlMap.queryForObject("memo.memoRemoveCount", emp_num);
		int impCount = (int) sqlMap.queryForObject("memo.memoImpCount", emp_num);
		
		model.addAttribute("memoCateCount", memoCateCount);
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("count", count);
		model.addAttribute("removeCount", removeCount);
		model.addAttribute("impCount", impCount);
		
		
		return "/memo/memoCateManage";
	}
	
	@RequestMapping("/memoTitleCont.jp")
	public @ResponseBody memoDTO memoTitleCont(memoDTO dto, HttpSession session) {
		
		dto.setEmp_num((String)session.getAttribute("memId"));
		memoDTO content = (memoDTO) sqlMap.queryForObject("memo.memoCateTitle", dto);
		
		return content;
	}
	
	@RequestMapping("/memoCateModify.jp")
	public String memoCateModify(memoDTO dto, HttpSession session) {
		dto.setEmp_num((String)session.getAttribute("memId"));
		System.out.println(dto.getCate_num());
		sqlMap.update("memo.memoCateUdate", dto);
		
		return "/memo/memoCateModify";
	}
	
	@RequestMapping("/memoCateDelete.jp")
	public String memoCateDelete(memoDTO dto) {
		System.out.println(dto.getCate_num());
		
		sqlMap.delete("memo.memoCateDelete", dto);
		
		return "/memo/memoCateDelete";
	}
	
	@RequestMapping("/memoCateInsert.jp")
	public String memoCateInsert(HttpSession session, HttpServletRequest request, memoDTO dto) {
		
		dto.setEmp_num((String)session.getAttribute("memId"));
		String cate_title [] = request.getParameterValues("cate_title");
		
		for(int i=0; i<cate_title.length; i++) {
			dto.setCate_title(cate_title[i]);
			sqlMap.insert("memo.memoCateInsert", dto);
		}
		return "/memo/memoCateInsert";
	}
	
	@RequestMapping("/memoCateMove.jp")
	public String memoCateMove(String pageNum, int memoGroup, Model model, HttpServletRequest request, memoDTO dto) {
		System.out.println("memo_cate ="+ request.getParameter("memo_cate"));
		String memo_num[] = request.getParameterValues("memo_num");
		for(int i=0; i<memo_num.length; i++) {
			dto.setMemo_num(Integer.parseInt(memo_num[i]));
			
			sqlMap.update("memo.memoMove", dto);
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
		return "/memo/memoCateMove";
	}
	
	@RequestMapping("/memoRecover.jp")
	public String memoRecover(String pageNum, int memoGroup, HttpServletRequest request, memoDTO dto, Model model) {
		String memo_num[] = request.getParameterValues("memo_num");
		
		for(int i=0; i<memo_num.length; i++) {
			dto.setMemo_num(Integer.parseInt(memo_num[i]));
			
			sqlMap.update("memo.memoRecover", dto);
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
		
		return "memo/memoRecover";
	}
	
	@RequestMapping("/memoModifyPro.jp")
	public String memoModifyPro(MultipartHttpServletRequest request, Model model, String pageNum, int memoGroup) {
		memoDTO dto = new memoDTO();
		int memo_num = Integer.parseInt(request.getParameter("memo_num"));
		dto.setMemo_num(memo_num);
		dto.setMemo_title(request.getParameter("memo_title"));
		dto.setMemo_content(request.getParameter("memo_content"));
		dto.setMemo_cate(Integer.parseInt(request.getParameter("memo_cate")));
		String memoState = request.getParameter("memo_state");

		if(memoState == null) {
			dto.setMemo_state(1);
		} else if(memoState != null){
			dto.setMemo_state(2);
		}
		
		sqlMap.update("memo.memoUpdate", dto);
		
		String path = request.getRealPath("save"); // 파일 경로
		
		/* hide()한 이미지 파일 삭제 */
		String [] cimg = request.getParameterValues("cimg");
		if(cimg != null) { 
			for(int i=0; i<cimg.length; i++){
				dto.setOrg_img(cimg[i]);
				System.out.println("이미지 파일 : "+dto.getOrg_img());
				
				dto = (memoDTO)sqlMap.queryForObject("memo.memoOrgImg", dto);
				
				/* 서버에 저장된 곳에서 삭제 */
				try{
					
					File imgF = new File(path+"\\"+dto.getSys_img());
				
					if(imgF.exists()) {
						imgF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			sqlMap.delete("memo.memoImgSelectDel", dto);
			}
						
		}
		
		/* hide()한 파일 삭제 */
		String [] cfile = request.getParameterValues("cfile");
		if(cfile != null) {
			for(int i=0; i<cfile.length; i++) {
				dto.setOrg_file(cfile[i]);
				System.out.println("파일 : "+dto.getOrg_file());
				
				dto = (memoDTO)sqlMap.queryForObject("memo.memoOrgFile", dto);
				
				/* 서버에 저장된 곳에서 삭제 */
				try {
					File fileF = new File(path+"\\"+dto.getSys_file());
					
					if(fileF.exists()) {
						fileF.delete();
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
			
			sqlMap.delete("memo.memoFileSelectDel", dto);
			}
		}
		
		/* 새로 입력한 파일 저장하기 */
		/* 이미지 */
		List<MultipartFile> mf = request.getFiles("org_img"); // 업로드 원본 파일
		
		for(MultipartFile multiImg : mf) {
			String imgName = multiImg.getOriginalFilename();
			
			if(imgName != "") {
				dto.setOrg_img(imgName);
				System.out.println("2 : "+imgName);
				int extImg = imgName.lastIndexOf(".");
				System.out.println(extImg);
				imgName = imgName.substring(extImg+1);
			
				String fmImg = dto.getEmp_num()+"_"+dto.getMemo_num()+"."+imgName;
			
				File f = new File(path+"//"+fmImg);
			
				try {
					multiImg.transferTo(f);
				} catch(Exception e) {
					e.printStackTrace();
				}
				dto.setSys_img(fmImg);
			
				sqlMap.insert("memo.memoInsImg", dto);
			}
		}
		
		
		/* 파일 */
		List<MultipartFile> fileMf = request.getFiles("org_file");
		
		for(MultipartFile multiFile : fileMf) {
			String fileName = multiFile.getOriginalFilename();
			
			if(fileName != "") {
				dto.setOrg_file(fileName);
				int extFile = fileName.lastIndexOf(".");
				fileName = fileName.substring(extFile+1);
				String fmFile = dto.getEmp_num()+"_"+dto.getMemo_num()+"."+fileName;
			
				fmFile = fmFile.replace(" ", "");
				fmFile = fmFile.replace(":", "");
				File ff = new File(path+"//"+fmFile);
		
				try {
					multiFile.transferTo(ff);
				} catch(Exception e) {
					e.printStackTrace();
				}
				dto.setSys_file(fmFile);
			
				sqlMap.insert("memo.memoInsFile", dto);
			}
		}
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
		
		return "/memo/memoModifyPro";
	}
	
	@RequestMapping("memoStateChange.jp")
	public String memoStateChange(HttpServletRequest request, memoDTO dto, Model model) {
		String pageNum = request.getParameter("pageNum");
		int memoGroup = Integer.parseInt(request.getParameter("memoGroup")); 
		int memo_state = Integer.parseInt(request.getParameter("memo_state"));
		
		if(memo_state == 1) {
			dto.setMemo_state(2);
		} else if(memo_state == 2) {
			dto.setMemo_state(1);
		}
		
		sqlMap.update("memo.memoStateChange", dto);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memoGroup", memoGroup);
				
		return "/memo/memoStateChange";
	}
}