package jackpot.bean;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import jackpot.DTO.bmDTO;
import oracle.sql.DATE;

@Controller

public class bmBean {
	
	@Autowired
	private SqlMapClientTemplate sqlMap;   
	
	/*모든업무리스트보기*/
	@RequestMapping("/bmList.jp")
	public String bmList(bmDTO bmdto, HttpSession session, Model model){
		
		List bmList = null;
		bmList = sqlMap.queryForList("bm.getBusiness", bmList);		
		model.addAttribute("bmList", bmList);		
		
		return "/bm/bmList";

	}
	
	/*나의 업무리스트보기*/
	@RequestMapping("/myBmList.jp")
	public String myBmList(bmDTO bmdto, HttpSession session, Model model){
		
		List myBmList = null;
		myBmList = sqlMap.queryForList("bm.getMyBusiness", myBmList);		
		model.addAttribute("myBmList", myBmList);		
		return "/bm/myBmList";

	}
	
	@RequestMapping("/bmForm.jp")
	public String bmForm(bmDTO bmdto,Model model,HttpSession session){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);
		bmdto = (bmDTO)sqlMap.queryForObject("bm.getemp_name", null);		
		model.addAttribute("bmdto",bmdto);
		model.addAttribute("emp_num",emp_num);


		return "/bm/bmForm";

	}	
	
	/*업무FormPro*/
	@RequestMapping("/bmFormPro.jp")
	public String bmForm(bmDTO bmdto, MultipartHttpServletRequest multi,HttpSession session){
		String emp_num =(String)session.getAttribute("memId");
		bmdto.setEmp_num(emp_num);

		bmdto.setBm_tiltie(multi.getParameter("bm_tiltie"));
		bmdto.setBm_content(multi.getParameter("bm_content"));
		bmdto.setBm_form(Integer.parseInt(multi.getParameter("bm_form")));
/*		bmdto.setBm_start(Timpstamp.(multi.getParameter("bm_start")));
		bmdto.setBm_end(toTimestamp(multi.getParameter("bm_end")));
		bmdto.setEnrollment(toTimestamp(multi.getParameter("enrollment")));*/
		bmdto.setReg_notice(multi.getParameter("reg_notice"));
		bmdto.setCmp_notice(multi.getParameter("cmp_notice"));
		bmdto.setRelated_bns(multi.getParameter("related_bns"));
		bmdto.setBns_box(Integer.parseInt(multi.getParameter("bns_box")));
		bmdto.setImportant(Integer.parseInt(multi.getParameter("important")));
		bmdto.setBm_state(multi.getParameter("bm_state")); 
		bmdto.setEmp_num(multi.getParameter("emp_num"));
	
		sqlMap.insert("bm.insertBusiness", bmdto);

		return "/bm/bmFormPro";

	}
	
	
}