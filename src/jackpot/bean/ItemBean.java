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
					System.out.println("저장");
				}
			} else if(Integer.parseInt(check[a]) == 2) {
				if(big_name == null) {
					for(int i=0; i<big_use.length; i++) {
						dto.setBig_num(Integer.parseInt(big_num[i]));
						dto.setBig_use(big_use[i]);
						
						System.out.println("번호["+i+"]"+"::"+dto.getBig_num());
						System.out.println("사용["+i+"]"+"::"+dto.getBig_use());
						
						sqlMap.update("item.bigCateUseUpdate", dto);
					}
				} else if(big_use == null) {
					for(int i=0; i<big_name.length; i++) {
						dto.setBig_num(Integer.parseInt(big_num[i]));
						dto.setBig_name(big_name[i]);
						
						System.out.println("name["+i+"]"+"::"+dto.getBig_name());
						System.out.println("num["+i+"]"+"::"+dto.getBig_num());
						
						sqlMap.update("item.bigCateNameUpdate", dto);
					}
				} else {
					for(int i=0; i<big_name.length; i++) {
						dto.setBig_num(Integer.parseInt(big_num[i]));
						dto.setBig_name(big_name[i]);
						
						System.out.println("name["+i+"]"+"::"+dto.getBig_name());
						System.out.println("num["+i+"]"+"::"+dto.getBig_num());
						
						sqlMap.update("item.bigCateNameUpdate", dto);
					}
					for(int j=0; j<big_use.length; j++) {
						dto.setBig_num(Integer.parseInt(big_num[j]));
						dto.setBig_use(big_use[j]);
						
						System.out.println("번호["+j+"]"+"::"+dto.getBig_num());
						System.out.println("사용["+j+"]"+"::"+dto.getBig_use());
						
						sqlMap.update("item.bigCateUseUpdate", dto);
					}
				}
				/*for(int i=0; i<big_num.length; i++) {
					if(big_name == null) {
						dto.setBig_use(big_use[i]);
						dto.setBig_num(Integer.parseInt(big_num[i]));
						System.out.println("번호"+dto.getBig_num());
						System.out.println("사용"+dto.getBig_use());
					} else if(big_use == null) {
						dto.setBig_name(big_name[i]);
						dto.setBig_name(big_name[i]);
						System.out.println("name"+dto.getBig_name());
						System.out.println("num"+dto.getBig_num());
					} else {
						
					}
				}*/
			}
		}
		return "/item/bigCatePro";
	}
}