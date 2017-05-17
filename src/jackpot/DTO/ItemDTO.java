package jackpot.DTO;

public class ItemDTO {
	private int item_num;
	private String pro_code;
	private String barcode;
	private String pro_name;
	private String item_division;
	private String sale_cost; 
	private String buy_cost;
	private String retail_cost;
	private String tax;
	private String stand;
	private String unit;
	private String use;
	private String buy_code;
	private String buy_name;
	private int big_cate;
	private int middle_cate;
	private int small_cate;
	private String note;
	
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getPro_code() {
		return pro_code;
	}
	public void setPro_code(String pro_code) {
		this.pro_code = pro_code;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getItem_division() {
		return item_division;
	}
	public void setItem_division(String item_division) {
		this.item_division = item_division;
	}
	public String getSale_cost() {
		return sale_cost;
	}
	public void setSale_cost(String sale_cost) {
		this.sale_cost = sale_cost;
	}
	public String getBuy_cost() {
		return buy_cost;
	}
	public void setBuy_cost(String buy_cost) {
		this.buy_cost = buy_cost;
	}
	public String getRetail_cost() {
		return retail_cost;
	}
	public void setRetail_cost(String retail_cost) {
		this.retail_cost = retail_cost;
	}
	public String getTax() {
		return tax;
	}
	public void setTax(String tax) {
		this.tax = tax;
	}
	public String getStand() {
		return stand;
	}
	public void setStand(String stand) {
		this.stand = stand;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public String getBuy_code() {
		return buy_code;
	}
	public void setBuy_code(String buy_code) {
		this.buy_code = buy_code;
	}
	public String getBuy_name() {
		return buy_name;
	}
	public void setBuy_name(String buy_name) {
		this.buy_name = buy_name;
	}
	public int getBig_cate() {
		return big_cate;
	}
	public void setBig_cate(int big_cate) {
		this.big_cate = big_cate;
	}
	public int getMiddle_cate() {
		return middle_cate;
	}
	public void setMiddle_cate(int middle_cate) {
		this.middle_cate = middle_cate;
	}
	public int getSmall_cate() {
		return small_cate;
	}
	public void setSmall_cate(int small_cate) {
		this.small_cate = small_cate;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	// 대분류
	private int big_num;
	private String big_code;
	private String big_name;
	private String big_use;
	
	public int getBig_num() {
		return big_num;
	}
	public void setBig_num(int big_num) {
		this.big_num = big_num;
	}
	public String getBig_code() {
		return big_code;
	}
	public void setBig_code(String big_code) {
		this.big_code = big_code;
	}
	public String getBig_name() {
		return big_name;
	}
	public void setBig_name(String big_name) {
		this.big_name = big_name;
	}
	public String getBig_use() {
		return big_use;
	}
	public void setBig_use(String big_use) {
		this.big_use = big_use;
	}

	// 중분류
	private int middle_num;
	private String middle_code;
	private String middle_name;
	private String middle_use;
		
	public int getMiddle_num() {
		return middle_num;
	}
	public void setMiddle_num(int middle_num) {
		this.middle_num = middle_num;
	}
	public String getMiddle_code() {
		return middle_code;
	}
	public void setMiddle_code(String middle_code) {
		this.middle_code = middle_code;
	}
	public String getMiddle_name() {
		return middle_name;
	}
	public void setMiddle_name(String middle_name) {
		this.middle_name = middle_name;
	}
	public String getMiddle_use() {
		return middle_use;
	}
	public void setMiddle_use(String middle_use) {
		this.middle_use = middle_use;
	}

	// 소분류
	private int small_num;
	private String small_code;
	private String small_name;
	private String small_use;

	public int getSmall_num() {
		return small_num;
	}
	public void setSmall_num(int small_num) {
		this.small_num = small_num;
	}
	public String getSmall_code() {
		return small_code;
	}
	public void setSmall_code(String small_code) {
		this.small_code = small_code;
	}
	public String getSmall_name() {
		return small_name;
	}
	public void setSmall_name(String small_name) {
		this.small_name = small_name;
	}
	public String getSmall_use() {
		return small_use;
	}
	public void setSmall_use(String small_use) {
		this.small_use = small_use;
	}
}
