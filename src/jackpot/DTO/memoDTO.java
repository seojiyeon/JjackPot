package jackpot.DTO;

public class memoDTO {
	/* 메모 */
	private int memo_num;
	private int memo_cate;
	private String memo_title;
	private String memo_content;
	private int memo_state;
	private String emp_num;
	
	public int getMemo_num() {
		return memo_num;
	}
	public void setMemo_num(int memo_num) {
		this.memo_num = memo_num;
	}
	public int getMemo_cate() {
		return memo_cate;
	}
	public void setMemo_cate(int memo_cate) {
		this.memo_cate = memo_cate;
	}
	public String getMemo_title() {
		return memo_title;
	}
	public void setMemo_title(String memo_title) {
		this.memo_title = memo_title;
	}
	public String getMemo_content() {
		return memo_content;
	}
	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}
	public int getMemo_state() {
		return memo_state;
	}
	public void setMemo_state(int memo_state) {
		this.memo_state = memo_state;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	
	/* 메모 카테고리 */
	private int cate_num;
	private String cate_title;
	
	public int getCate_num() {
		return cate_num;
	}
	public void setCate_num(int cate_num) {
		this.cate_num = cate_num;
	}
	public String getCate_title() {
		return cate_title;
	}
	public void setCate_title(String cate_title) {
		this.cate_title = cate_title;
	}
}
