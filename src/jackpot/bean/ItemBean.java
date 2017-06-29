package jackpot.bean;

import java.util.Enumeration;
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
		dto.setBig_use("사용");
		List bigCateAbleList = sqlMap.queryForList("item.bigCateAble", dto);
		int itemAllCount = (int)sqlMap.queryForObject("item.itemAllCount", null);
		
		model.addAttribute("itemList", itemList);
		model.addAttribute("bigCateAbleList", bigCateAbleList);
		model.addAttribute("itemAllCount", itemAllCount);
		
		return "/item/itemEnroll";
	}
	
	@RequestMapping("/itemEnrollPro.jp")
	public String itemEnrollPro(ItemDTO dto) {
		sqlMap.insert("item.itemInsert", dto);
	
		return "/item/itemEnrollPro";
	}
	
	@RequestMapping("/itemContent.jp")
	public @ResponseBody ItemDTO itemContent(ItemDTO dto, Model model) {
		ItemDTO content = (ItemDTO)sqlMap.queryForObject("item.itemContent", dto);
		
		return content;
	}
	
	@RequestMapping("/itemModifyPro.jp")
	public String itemModifyPro(ItemDTO dto) {
		System.out.println(dto.getItem_num());
		System.out.println(dto.getPro_code());
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
	public String itemCate(Model model, HttpServletRequest request, ItemDTO dto) {
		String use = request.getParameter("use");
		
		List bigCateList = null;
		int bigCateCount = 0;
		System.out.println(use);
		if(use == null || use == "") {
			bigCateList = sqlMap.queryForList("item.bigCateList", null);
			bigCateCount = (int) sqlMap.queryForObject("item.bigCateCount", null);
		} else if(use != null) {
			dto.setBig_use(use);
			bigCateList = sqlMap.queryForList("item.bigCateSearch", dto);
			bigCateCount = (int) sqlMap.queryForObject("item.bigCateSearchCount", dto);
		}
		
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
		String [] big_name = request.getParameterValues("big_name");
		String [] big_use = request.getParameterValues("big_use");
		String [] check = request.getParameterValues("check");
		
		/* 카테고리 저장 */
		if(check != null) {
			for(int i=0; i<check.length; i++) {
				dto.setBig_name(big_name[i]);
				dto.setBig_use(big_use[i]);
			
				sqlMap.insert("item.bigCateInsert", dto);
			}
		} 
		
		if(check == null){
			
			/* 카테고리 수정 */
			Enumeration enu = request.getParameterNames();
			while(enu.hasMoreElements()){
				String key = (String)enu.nextElement();	// big_name-37 = korea
				String [] nameNum = key.split("-");
				String value = request.getParameter(key);
				if(nameNum[0].equals("big_name")){
					dto.setBig_num(Integer.parseInt(nameNum[1]));
					dto.setBig_name(value);
					sqlMap.update("item.bigCateNameUpdate", dto);
				} else if(nameNum[0].equals("big_use")){
					dto.setBig_num(Integer.parseInt(nameNum[1]));
					dto.setBig_use(value);
					sqlMap.update("item.bigCateUseUpdate", dto);
				}
			}
		}
		
		
		return "/item/bigCatePro";
	}
	
	@RequestMapping("/bigCateRemove.jp")
	public String bigCateRemove(HttpServletRequest request) {
		String big_num[] = request.getParameterValues("big_num");
		
		for(int i=0; i<big_num.length; i++) {
			ItemDTO dto = new ItemDTO();
			
			dto.setBig_num(Integer.parseInt(big_num[i]));
			
			sqlMap.delete("item.bigCateDelete", dto);
		}
		return "/item/bigCateRemove";
	}
}
















