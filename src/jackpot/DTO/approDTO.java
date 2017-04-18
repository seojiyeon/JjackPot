package jackpot.DTO;

import java.sql.Timestamp;

public class approDTO {

	private String doc_num; 		//문서번호
	private String doc_date;		//기안일자(상신날짜)
	private String doc_finish;		//결재완료일(마감날짜)
	private String emp_num;			//기안사원번호(상신자의사원코드)
	private String emp_name;		//기안자(작성자)이름(상신자의 사원이름)
	private String doc_title;		//문서제목(상신문서 제목)
	private String doc_content;		//문서내용(상신문서 내용)
	private String style_num;		//양식번호
	private String doc_division;	//문서종류
	private String start_work;		//근태시작일
	private String end_work;		//근태종료일
	private String doc_state;		//결재상태
	private String doc_count;		//결재받을 사람 수(결재권자 수)
	private String doc_step;		//결재단계
	private int branch;				//기안자소속지점
	private int department;			//기안자소속부서(상신자의부서이름)
	private int position;			//기안자직급(상신자의 직급)
	
	private String dec_num;			//번호
	private String dec_name;		//결재권자 이름(결재자의 이름)
	private String dec_branch;		//결재권자 지점
	private String dec_depart;		//결재권자 부서(결재자의 부서이름)
	private String dec_position;	//결재권자 직급(결재자의 직급)
	private String sign_img;		//결재권자 서명(결재자의 서명)
	private String dec_empnum;		//결재권자 사원번호(결재자의 시원코드)
	private Timestamp sign_date;	//결재권자 승인날짜(결재날짜)
	
	
	public String getDoc_num() {
		return doc_num;
	}
	public void setDoc_num(String doc_num) {
		this.doc_num = doc_num;
	}
	public String getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(String doc_date) {
		this.doc_date = doc_date;
	}
	public String getDoc_finish() {
		return doc_finish;
	}
	public void setDoc_finish(String doc_finish) {
		this.doc_finish = doc_finish;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public String getStyle_num() {
		return style_num;
	}
	public void setStyle_num(String style_num) {
		this.style_num = style_num;
	}
	public String getDoc_division() {
		return doc_division;
	}
	public void setDoc_division(String doc_division) {
		this.doc_division = doc_division;
	}
	public String getStart_work() {
		return start_work;
	}
	public void setStart_work(String start_work) {
		this.start_work = start_work;
	}
	public String getEnd_work() {
		return end_work;
	}
	public void setEnd_work(String end_work) {
		this.end_work = end_work;
	}
	public String getDoc_state() {
		return doc_state;
	}
	public void setDoc_state(String doc_state) {
		this.doc_state = doc_state;
	}
	public String getDoc_count() {
		return doc_count;
	}
	public void setDoc_count(String doc_count) {
		this.doc_count = doc_count;
	}
	public String getDoc_step() {
		return doc_step;
	}
	public void setDoc_step(String doc_step) {
		this.doc_step = doc_step;
	}
	public int getBranch() {
		return branch;
	}
	public void setBranch(int branch) {
		this.branch = branch;
	}
	public int getDepartment() {
		return department;
	}
	public void setDepartment(int department) {
		this.department = department;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public String getDec_num() {
		return dec_num;
	}
	public void setDec_num(String dec_num) {
		this.dec_num = dec_num;
	}
	public String getDec_name() {
		return dec_name;
	}
	public void setDec_name(String dec_name) {
		this.dec_name = dec_name;
	}
	public String getDec_branch() {
		return dec_branch;
	}
	public void setDec_branch(String dec_branch) {
		this.dec_branch = dec_branch;
	}
	public String getDec_depart() {
		return dec_depart;
	}
	public void setDec_depart(String dec_depart) {
		this.dec_depart = dec_depart;
	}
	public String getDec_position() {
		return dec_position;
	}
	public void setDec_position(String dec_position) {
		this.dec_position = dec_position;
	}
	public String getSign_img() {
		return sign_img;
	}
	public void setSign_img(String sign_img) {
		this.sign_img = sign_img;
	}
	public String getDec_empnum() {
		return dec_empnum;
	}
	public void setDec_empnum(String dec_empnum) {
		this.dec_empnum = dec_empnum;
	}
	public Timestamp getSign_date() {
		return sign_date;
	}
	public void setSign_date(Timestamp sign_date) {
		this.sign_date = sign_date;
	}
	
	
}