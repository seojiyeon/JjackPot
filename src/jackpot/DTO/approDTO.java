package jackpot.DTO;

import java.sql.Timestamp;

public class approDTO {

	private String doc_num; 			//문서 번호
	private String doc_date;			//상신 일자	
	private String doc_finish;			//마감 일자
	private String emp_num;				//사원 번호
	private String emp_name;			//사원 이름
	private String doc_title;			//문서 제목
	private String doc_content;			//문서 내용
	private String style_num;			//양식 번호
	private String doc_division;		//문서 종류
	private String start_work;			//근태 시작일
	private String end_work;			//근태 종료일
	private String doc_state;			//결재 상태
	private String doc_count;			//결재 받을 사람수
	private int doc_step;				//결재 단계
	private int branch;					//소속지점
	private int department;				//소속부서
	private int position;				//직급

	private String situation;			
	private String ap_count;			
	private Timestamp ap_time;			//게시글이 업데이트 된 시간
	private int readcount;				
	private int impend_reCount;			
	private int return_readCount;
	
	//�ӽ�����κ�
	private String temp_End;			//�ӽ����� ��������
	private String temp_subject;		//�ӽ����� ����
	private String temp_ir1;			//����
	private String temp_cate;			//�ӽ����� ī��
	private String temp_num;			//�ӽ����� �ѹ�
	private Timestamp temp_date;		//�ӽ����� �ð�
	private int cc;						//�����Ⱓ �Ѱ���� �ȳѰ���� �����̵Ǵ� ����.
	private String temp_geuntae_cate;	//�ӽ�����. �����з�
	private String temp_startDate;		//�ӽ�����. �ް�������.
	private String temp_endDate;		//�ӽ�����. �ް���.
	
	private String approver_num;
	private String dec_num;				//결재권자 번호
	private String dec_name;			//결재권자 이름
	private String dec_branch;			//결재권자 지점
	private String dec_depart;			//결재권자 부서
	private String dec_position;		//결재권자 직급
	private String sign_img;			//결재권자 서명
	private String dec_empnum;			//결재권자 사원번호
	private Timestamp sign_date;		//결재권자 승인날짜
	
	private String ap_dName;				//결재자의 부서이름.
	private String ap_rankName;			//결재자의 직급.
	private String ap_sawonName;			//결재자의 이름.
	private String ap_sign;				//결재자의 서명.
	private Timestamp ap_signdate;			//결재날짜.
	private String ap_sawonRank;			//결재사원의 직급레벨
	private String ap_wPsC;				//결재자의 테이블이름,사원코드
	
		
	public String getSituation() {
		return situation;
	}
	public void setSituation(String situation) {
		this.situation = situation;
	}
	public String getAp_count() {
		return ap_count;
	}
	public void setAp_count(String ap_count) {
		this.ap_count = ap_count;
	}
	public Timestamp getAp_time() {
		return ap_time;
	}
	public void setAp_time(Timestamp ap_time) {
		this.ap_time = ap_time;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getImpend_reCount() {
		return impend_reCount;
	}
	public void setImpend_reCount(int impend_reCount) {
		this.impend_reCount = impend_reCount;
	}
	public int getReturn_readCount() {
		return return_readCount;
	}
	public void setReturn_readCount(int return_readCount) {
		this.return_readCount = return_readCount;
	}
	public String getTemp_End() {
		return temp_End;
	}
	public void setTemp_End(String temp_End) {
		this.temp_End = temp_End;
	}
	public String getTemp_subject() {
		return temp_subject;
	}
	public void setTemp_subject(String temp_subject) {
		this.temp_subject = temp_subject;
	}
	public String getTemp_ir1() {
		return temp_ir1;
	}
	public void setTemp_ir1(String temp_ir1) {
		this.temp_ir1 = temp_ir1;
	}
	public String getTemp_cate() {
		return temp_cate;
	}
	public void setTemp_cate(String temp_cate) {
		this.temp_cate = temp_cate;
	}
	public String getTemp_num() {
		return temp_num;
	}
	public void setTemp_num(String temp_num) {
		this.temp_num = temp_num;
	}
	public Timestamp getTemp_date() {
		return temp_date;
	}
	public void setTemp_date(Timestamp temp_date) {
		this.temp_date = temp_date;
	}
	public int getCc() {
		return cc;
	}
	public void setCc(int cc) {
		this.cc = cc;
	}
	public String getTemp_geuntae_cate() {
		return temp_geuntae_cate;
	}
	public void setTemp_geuntae_cate(String temp_geuntae_cate) {
		this.temp_geuntae_cate = temp_geuntae_cate;
	}
	public String getTemp_startDate() {
		return temp_startDate;
	}
	public void setTemp_startDate(String temp_startDate) {
		this.temp_startDate = temp_startDate;
	}
	public String getTemp_endDate() {
		return temp_endDate;
	}
	public void setTemp_endDate(String temp_endDate) {
		this.temp_endDate = temp_endDate;
	}
	public int getDoc_step() {
		return doc_step;
	}
	public void setDoc_step(int doc_step) {
		this.doc_step = doc_step;
	}
	
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
	public String getAp_dName() {
		return ap_dName;
	}
	public void setAp_dName(String ap_dName) {
		this.ap_dName = ap_dName;
	}
	public String getAp_rankName() {
		return ap_rankName;
	}
	public void setAp_rankName(String ap_rankName) {
		this.ap_rankName = ap_rankName;
	}
	public String getAp_sawonName() {
		return ap_sawonName;
	}
	public void setAp_sawonName(String ap_sawonName) {
		this.ap_sawonName = ap_sawonName;
	}
	public String getAp_sign() {
		return ap_sign;
	}
	public void setAp_sign(String ap_sign) {
		this.ap_sign = ap_sign;
	}
	public Timestamp getAp_signdate() {
		return ap_signdate;
	}
	public void setAp_signdate(Timestamp ap_signdate) {
		this.ap_signdate = ap_signdate;
	}
	public String getAp_sawonRank() {
		return ap_sawonRank;
	}
	public void setAp_sawonRank(String ap_sawonRank) {
		this.ap_sawonRank = ap_sawonRank;
	}
	public String getAp_wPsC() {
		return ap_wPsC;
	}
	public void setAp_wPsC(String ap_wPsC) {
		this.ap_wPsC = ap_wPsC;
	}
	public String getApprover_num() {
		return approver_num;
	}
	public void setApprover_num(String approver_num) {
		this.approver_num = approver_num;
	}	
	
	
}