package jackpot.DTO;
import java.sql.Timestamp;

public class bmDTO {
	private int bm_num;
	private String bm_tiltie;
	private String bm_content; 
	private String bm_form;
	private Timestamp bm_start;
	private Timestamp bm_end;
	private Timestamp enrollment;
	private String reg_notice;
	private String cmp_notice;
	private String related_bns; 
	private int  bns_box;
	private int important;
	private String bm_state;
	private String emp_num;
	
	public int getBm_num() {
		return bm_num;
	}
	public void setBm_num(int bm_num) {
		this.bm_num = bm_num;
	}
	public String getBm_tiltie() {
		return bm_tiltie;
	}
	public void setBm_tiltie(String bm_tiltie) {
		this.bm_tiltie = bm_tiltie;
	}
	public String getBm_content() {
		return bm_content;
	}
	public void setBm_content(String bm_content) {
		this.bm_content = bm_content;
	}
	public String getBm_form() {
		return bm_form;
	}
	public void setBm_form(String bm_form) {
		this.bm_form = bm_form;
	}
	public Timestamp getBm_start() {
		return bm_start;
	}
	public void setBm_start(Timestamp bm_start) {
		this.bm_start = bm_start;
	}
	public Timestamp getBm_end() {
		return bm_end;
	}
	public void setBm_end(Timestamp bm_end) {
		this.bm_end = bm_end;
	}
	public Timestamp getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(Timestamp enrollment) {
		this.enrollment = enrollment;
	}
	public String getReg_notice() {
		return reg_notice;
	}
	public void setReg_notice(String reg_notice) {
		this.reg_notice = reg_notice;
	}
	public String getCmp_notice() {
		return cmp_notice;
	}
	public void setCmp_notice(String cmp_notice) {
		this.cmp_notice = cmp_notice;
	}
	public String getRelated_bns() {
		return related_bns;
	}
	public void setRelated_bns(String related_bns) {
		this.related_bns = related_bns;
	}
	public int getBns_box() {
		return bns_box;
	}
	public void setBns_box(int bns_box) {
		this.bns_box = bns_box;
	}
	public int getImportant() {
		return important;
	}
	public void setImportant(int important) {
		this.important = important;
	}
	public String getBm_state() {
		return bm_state;
	}
	public void setBm_state(String bm_state) {
		this.bm_state = bm_state;
	}
	
	public String getEmp_num(){
		return emp_num;
	}
	
	public void setEmp_num(String emp_num){
		this.emp_num = emp_num;
	}
	
}
