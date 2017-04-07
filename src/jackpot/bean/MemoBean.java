package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.memoDTO;

@Controller
public class MemoBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/memoList.jp")
	public String memoList(Model model, HttpSession session) {
		String emp_num = (String)session.getAttribute("memId");
		
		List memoCateList = sqlMap.queryForList("memo.memoCate", emp_num);
		List memoCont = sqlMap.queryForList("memo.memoSh", emp_num);
		
		model.addAttribute("memoCateList", memoCateList);
		model.addAttribute("memoCont", memoCont);

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
	public String memoInsertPro(memoDTO dto, HttpSession session) {
		dto.setEmp_num((String)session.getAttribute("memId"));
		if(dto.getMemo_state() == 0) {
			dto.setMemo_state(1);
		}
		
		sqlMap.insert("memo.memoInsert", dto);
		
		return "/memo/memoInsertPro";
	}
}