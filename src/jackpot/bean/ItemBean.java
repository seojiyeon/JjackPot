package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.ItemCateDTO;
import jackpot.DTO.ItemDTO;

@Controller
public class ItemBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/itemEnroll.jp")
	public String itemEroll(ItemDTO dto) {
		return "/item/itemEnroll";
	}
	
	@RequestMapping("/itemEnrollPro.jp")
	public String itemEnrollPro(ItemDTO dto) {
		sqlMap.insert("item.itemInsert", dto);
		return "/item/itemEnrollPro";
	}
	
	@RequestMapping("/itemCate.jp")
	public String itemCate(Model model) {
		List bigCateList = sqlMap.queryForList("item.bigItemList", null);
		
		model.addAttribute("bigCateList", bigCateList);
		return "/item/itemCate";
	}
	
	@RequestMapping("/bigCatePro.jp")
	public String bigCatePro(HttpServletRequest request) {
		String [] big_cate = request.getParameterValues("big_cate");
		String [] big_name = request.getParameterValues("big_name"); 
		String [] big_use = request.getParameterValues("big_use");
		
		for(int i = 0 ; i < big_cate.length ; i++){
			ItemCateDTO dto = new ItemCateDTO();
			dto.setBig_cate(big_cate[i]);
			dto.setBig_name(big_name[i]);
			dto.setBig_use(big_use[i]);
			sqlMap.insert("item.bigCateInsert", dto);
		}
		
		return "/item/bigCatePro";
	}
	
}























