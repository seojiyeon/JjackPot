package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jackpot.DTO.ItemDTO;

@Controller
public class ItemBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/itemEnroll.jp")
	public String itemEroll(ItemDTO dto, Model model) {
		List itemList = sqlMap.queryForList("item.itemAllList", null);
		
		model.addAttribute("itemList", itemList);
		
		return "/item/itemEnroll";
	}
	
	@RequestMapping("/itemEnrollPro.jp")
	public String itemEnrollPro(ItemDTO dto) {
		sqlMap.insert("item.itemInsert", dto);
	
		return "/item/itemEnrollPro";
	}
	
	@RequestMapping("/itemContent.jp")
	public @ResponseBody ItemDTO itemContent(ItemDTO dto) {
		ItemDTO content = (ItemDTO)sqlMap.queryForObject("item.itemContent", dto);
		
		return content;
	}
	
	@RequestMapping("/itemModifyPro.jp")
	public String itemModifyPro(ItemDTO dto) {
		sqlMap.update("item.itemModify", dto);
		
		return "/item/itemModifyPro";
	}
	
	@RequestMapping("/itemDeletePro.jp")
	public String itemDeletePro(ItemDTO dto, HttpServletRequest request) {
		String item_num[] = request.getParameterValues("item_num");
		
		for(int i=0; i<item_num.length; i++) {
			dto.setItem_num(Integer.parseInt(item_num[i]));
			
			sqlMap.delete("item.itemDelete", dto);
		}
		return "/item/itemDeletePro";
	}
	
	@RequestMapping("/itemCate.jp")
	public String itemCate(Model model) {	
		List bigCateList = sqlMap.queryForList("item.bigCateList", null);
		int bigCateCount = (int) sqlMap.queryForObject("item.bigCateCount", null);
		
		model.addAttribute("bigCateList", bigCateList);
		model.addAttribute("bigCateCount", bigCateCount);
		
		return "/item/itemCate";
	}
	
/*	@RequestMapping("/bigCatePro.jp")
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
*/
	@RequestMapping("/bigCatePro.jp")
	public String bigCatePro(HttpServletRequest request, ItemDTO dto) {
		String [] big_code = request.getParameterValues("big_code");
		String [] big_name = request.getParameterValues("big_name");
		String [] big_use = request.getParameterValues("big_use");
		String [] big_num = request.getParameterValues("big_num");
		String [] check = request.getParameterValues("check");
		
		for(int a=0; a<check.length; a++) {
			if(Integer.parseInt(check[a]) == 1) {
				for(int i=0; i<big_code.length; i++) {
					dto.setBig_code(big_code[i]);
					dto.setBig_name(big_name[i]);
					dto.setBig_use(big_use[i]);
					
					sqlMap.insert("item.bigCateInsert", dto);
					System.out.println("ÀúÀå");
				}
			} else if(Integer.parseInt(check[a]) == 2) {
				for(int i=0; i<big_num.length; i++) {
					
					
					/*for(int x=0; x<big_name.length; x++) {
						dto.setBig_name(big_name[x]);
						System.out.println("1");
					}
					for(int y=0; y<big_use.length; y++) {
						dto.setBig_use(big_use[y]);
						System.out.println("2");
					}*/
				}
			}
		}
		return "/item/bigCatePro";
	}
}