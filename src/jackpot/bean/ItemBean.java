package jackpot.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jackpot.DTO.ItemDTO;

@Controller
public class ItemBean {
	@Autowired
	SqlMapClientTemplate sqlMap;
	
	@RequestMapping("/itemEnroll.jp")
	public String itemEroll(ItemDTO dto, Model model) {
				
		return "/item/itemEnroll";
	}
	
	@RequestMapping("/itemEnrollPro.jp")
	public String itemEnrollPro(ItemDTO dto) {
		sqlMap.insert("item.itemInsert", dto);
	
		return "/item/itemEnrollPro";
	}
	
	@RequestMapping("/itemCate.jp")
	public String itemCate(Model model) {
/*		List bigCateList = sqlMap.queryForList("item.bigItemList", null);
		int bigCateCount = (int) sqlMap.queryForObject("item.bigItemListCount", null);
		
		List middleCateList = sqlMap.queryForList("item.middleItemList", null);
		int middleCateCount = (int) sqlMap.queryForObject("item.middleItemListCount", null);
		
		model.addAttribute("bigCateList", bigCateList);
		model.addAttribute("bigCateCount", bigCateCount);
		model.addAttribute("middleCateList", middleCateList);
		model.addAttribute("middleCateCount", middleCateCount);
*/		
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
				for(int i=0; i<big_num.length; i++) {
					dto.setBig_num(Integer.parseInt(big_num[i]));
					dto.setBig_name(big_name[i]);
					dto.setBig_use(big_use[i]);
					
					sqlMap.update("item.bigCateUpdate", dto);
					System.out.println("수정");
				}
			}
		}
		
		
		
		/*for(int a=0; a<big_name.length; a++) {
			System.out.println(big_name[a]);
			if(big_num[a] == null) {
				for(int i=0; i<big_code.length; i++) {
					dto.setBig_code(big_code[i]);
					dto.setBig_name(big_name[i]);
					dto.setBig_use(big_use[i]);
					System.out.println("1");
					sqlMap.insert("item.bigCateInsert", dto);
				}
			} else if(big_num[a] != null) {
				dto.setBig_num(Integer.parseInt(big_num[a]));
				
				for(int i=0; i<big_code.length; i++) {
					dto.setBig_code(big_code[i]);
					dto.setBig_name(big_name[i]);
					dto.setBig_use(big_use[i]);
					System.out.println("2");
					sqlMap.update("item.bigCateUpdate", dto);
				}
			}
		}*/
		
		return "/item/bigCatePro";
	}

}