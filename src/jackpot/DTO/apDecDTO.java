package jackpot.DTO;

import java.sql.Timestamp;

public class apDecDTO {
	
	private String dec_num;				//결재권자 번호
	private String dec_name;			//결재권자 이름
	private String dec_branch;			//결재권자 지점
	private String dec_depart;			//결재권자 부서
	private String dec_position;		//결재권자 직급
	private String sign_img;			//결재권자 서명
	private String dec_empnum;			//결재권자 사원번호
	private Timestamp sign_date;		//결재권자 승인날짜
	
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
