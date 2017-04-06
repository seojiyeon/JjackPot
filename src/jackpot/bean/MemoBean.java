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
		
		model.addAttribute("memoCateList", memoCateList);

		System.out.println(emp_num);
		return "/memo/memoList";
	}
}
