package jackpot.bean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String itemCate() {
		return "/item/itemCate";
	}
}