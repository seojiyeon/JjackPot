package jackpot.DTO;

import java.sql.Timestamp;

public class memoDTO {
	/* 메모 */
	private int memo_num;
	private int memo_cate;
	private String memo_title;
	private String memo_content;
	private int memo_state;
	private String emp_num;
	private Timestamp memo_enroll;
	private Timestamp memo_modi;
	
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
	public Timestamp getMemo_enroll() {
		return memo_enroll;
	}
	public void setMemo_enroll(Timestamp memo_enroll) {
		this.memo_enroll = memo_enroll;
	}
	public Timestamp getMemo_modi() {
		return memo_modi;
	}
	public void setMemo_modi(Timestamp memo_modi) {
		this.memo_modi = memo_modi;
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
	
	/* 메모 이미지 */
	private int img_num;
	private String org_img;
	private String sys_img;

	public int getImg_num() {
		return img_num;
	}
	public void setImg_num(int img_num) {
		this.img_num = img_num;
	}
	public String getOrg_img() {
		return org_img;
	}
	public void setOrg_img(String org_img) {
		this.org_img = org_img;
	}
	public String getSys_img() {
		return sys_img;
	}
	public void setSys_img(String sys_img) {
		this.sys_img = sys_img;
	}
	
	/* 메모 파일 */
	private int file_num;
	private String org_file;
	private String sys_file;

	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public String getOrg_file() {
		return org_file;
	}
	public void setOrg_file(String org_file) {
		this.org_file = org_file;
	}
	public String getSys_file() {
		return sys_file;
	}
	public void setSys_file(String sys_file) {
		this.sys_file = sys_file;
	}
}