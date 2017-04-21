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
	
	private String ap_dName1;			
	private String ap_rankName1;		
	private String ap_sawonName1;		
	private String ap_sign1;			
	private Timestamp ap_signdate1;		
	private String ap_sawonRank1;		
	private String ap_wPsC1;			
	
	
	private int approver_step;			
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
	public int getApprover_step() {
		return approver_step;
	}
	public void setApprover_step(int approver_step) {
		this.approver_step = approver_step;
	}
	private String dec_num;			//��ȣ
	private String dec_name;		//������� �̸�(�������� �̸�)
	private String dec_branch;		//������� ����
	private String dec_depart;		//������� �μ�(�������� �μ��̸�)
	private String dec_position;	//������� ����(�������� ����)
	private String sign_img;		//������� ����(�������� ����)
	private String dec_empnum;		//������� �����ȣ(�������� �ÿ��ڵ�)
	private Timestamp sign_date;	//������� ���γ�¥(���糯¥)
	
	
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
	
	public String getAp_dName1() {
		return ap_dName1;
	}
	public void setAp_dName1(String ap_dName1) {
		this.ap_dName1 = ap_dName1;
	}
	public String getAp_rankName1() {
		return ap_rankName1;
	}
	public void setAp_rankName1(String ap_rankName1) {
		this.ap_rankName1 = ap_rankName1;
	}
	public String getAp_sawonName1() {
		return ap_sawonName1;
	}
	public void setAp_sawonName1(String ap_sawonName1) {
		this.ap_sawonName1 = ap_sawonName1;
	}
	public String getAp_sign1() {
		return ap_sign1;
	}
	public void setAp_sign1(String ap_sign1) {
		this.ap_sign1 = ap_sign1;
	}
	public Timestamp getAp_signdate1() {
		return ap_signdate1;
	}
	public void setAp_signdate1(Timestamp ap_signdate1) {
		this.ap_signdate1 = ap_signdate1;
	}
	public String getAp_sawonRank1() {
		return ap_sawonRank1;
	}
	public void setAp_sawonRank1(String ap_sawonRank1) {
		this.ap_sawonRank1 = ap_sawonRank1;
	}
	public String getAp_wPsC1() {
		return ap_wPsC1;
	}
	public void setAp_wPsC1(String ap_wPsC1) {
		this.ap_wPsC1 = ap_wPsC1;
	}
	
	
}