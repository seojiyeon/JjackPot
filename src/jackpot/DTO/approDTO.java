package jackpot.DTO;

import java.sql.Timestamp;

public class approDTO {

	private String doc_num; 		//������ȣ
	private String doc_date;		//�������(��ų�¥)
	private String doc_finish;		//����Ϸ���(������¥)
	private String emp_num;			//��Ȼ����ȣ(������ǻ���ڵ�)
	private String emp_name;		//�����(�ۼ���)�̸�(������� ����̸�)
	private String doc_title;		//��������(��Ź��� ����)
	private String doc_content;		//��������(��Ź��� ����)
	private String style_num;		//��Ĺ�ȣ
	private String doc_division;	//��������
	private String start_work;		//���½�����
	private String end_work;		//����������
	private String doc_state;		//�������
	private String doc_count;		//������� ��� ��(������� ��)
	private String doc_step;		//����ܰ�
	private int branch;				//����ڼҼ�����
	private int department;			//����ڼҼӺμ�(������Ǻμ��̸�)
	private int position;			//���������(������� ����)
	
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