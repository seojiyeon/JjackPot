package jackpot.DTO;
import java.sql.Timestamp;

public class bmDTO {
	
	private int bm_num;			/*업무관리번호*/
	private String bm_tiltie;	/*제목*/
	private String bm_content; 	/*내용*/
	private int bm_form;		/*업무형태*/
	private Timestamp bm_start;	/*업무시작일*/
	private Timestamp bm_end;	/*업무종료일*/
	private Timestamp enrollment;	/*업무등록일*/
	private String reg_notice;		/*등록알림*/
	private String cmp_notice;		/*완료알림*/
	private String related_bns; 	/*관련업무*/
	private int  bns_box;			/*업무보관함*/
	private int important;			/*중요업무*/
	private String bm_state;		/*업무상태*/
	private String emp_num;			/*작성자*/
	private	String day;

	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
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
	public int getBm_form() {
		return bm_form;
	}
	public void setBm_form(int bm_form) {
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
	
	/*업무담당자(incharge)*/
	private int num;		/*번호*/
	private String inchar_name;		/*업무담당자 이름*/
	private String inchar_brunch;	/*업무담당자 지점*/
	private String inchar_depart;	/*업무담당자 부서*/
	private String inchar_position;	/*업무담당자 직급*/

		
	public int getNum() {
		return num;
	}
	public void setInc_num(int num) {
		this.num = num;
	}
	public String getInchar_name() {
		return inchar_name;
	}
	public void setInchar_name(String inchar_name) {
		this.inchar_name = inchar_name;
	}
	public String getInchar_brunch() {
		return inchar_brunch;
	}
	public void setInchar_brunch(String inchar_brunch) {
		this.inchar_brunch = inchar_brunch;
	}
	public String getInchar_depart() {
		return inchar_depart;
	}
	public void setInchar_depart(String inchar_depart) {
		this.inchar_depart = inchar_depart;
	}
	public String getInchar_position() {
		return inchar_position;
	}
	public void setInchar_position(String inchar_position) {
		this.inchar_position = inchar_position;
	}
	
	/*업무보관함(bns_box)*/
	
	private int bns_num;		/*업무보관번호*/
	private String bns_name;	/*업무보관함이름*/

	public void setBns_num(int bns_num){
		this.bns_num = bns_num;
	}
	public int getBns_num(){
		return bns_num;
	}
	
	public void setBns_name(String bns_name){
		this.bns_name = bns_name;
	}
	public String getBns_name(){
		return bns_name;
	}
	
	/*업무관리 파일(bm_file)*/
	private int bmf_num; 
	private String org_file;
	private String sys_file;
	
	public void setBmf_num(int bmf_num){
		this.bmf_num = bmf_num; 
	}
	public int getBmf_num(){
		return bmf_num;
	}
	
	public void setOrg_file(String org_file){
		this.org_file = org_file;
	}
	public String org_file(){
		return org_file;
	}
	
	public void setSys_file(String sys_file){
		this.sys_file = sys_file;
	}
	public String sys_file(){
		return sys_file;
	}
	
	
	/*업무참조자(bm_ref)*/
	private int bmr_num;		/*번호*/
	private String ref_name;		/*참조자이름*/
	private String ref_branch;		/*참조자지점*/
	private String ref_depart;		/*참조자 부서*/
	private String ref_position;		/*참조자 직급*/
	
	public void setBmr_num(int bmr_num){
		this.bmr_num = bmr_num;
	}
	public int bmr_num(){
		return bmr_num;
	}
	public void setRef_name(String ref_name){
		this.ref_name = ref_name;
	}
	public String ref_name(){
		return ref_name;
	}
	public void setRef_branch(String ref_branch){
		this.ref_branch =ref_branch;
	}
	public String ref_branch(){
		return ref_branch;
	}
	public void setRef_depart(String ref_depart){
		this.ref_depart = ref_depart;
	}
	public String ref_depart(){
		return ref_depart;
	}
	public void setRef_position(String ref_position){
		this.ref_position = ref_position;
	}
	public String ref_position(){
		return ref_position;
	}
	
	/*내역(history)*/
	private int his_num;  /*번호*/
	private String his_process;   /*진척율*/
	private String his_content; 	/*업무내용*/
	private Timestamp modify_date;		/*최종수정일*/

	public int getHis_num() {
		return his_num;
	}
	public void setHis_num(int his_num) {
		this.his_num = his_num;
	}
	public String getHis_process() {
		return his_process;
	}
	public void setHis_process(String his_process) {
		this.his_process = his_process;
	}
	public String getHis_content() {
		return his_content;
	}
	public void setHis_content(String his_content) {
		this.his_content = his_content;
	}
	public Timestamp getModify_date() {
		return modify_date;
	}
	public void setModify_date(Timestamp modify_date) {
		this.modify_date = modify_date;
	}
	public String getOrg_file() {
		return org_file;
	}
	public String getSys_file() {
		return sys_file;
	}
	public int getBmr_num() {
		return bmr_num;
	}
	public String getRef_name() {
		return ref_name;
	}
	public String getRef_branch() {
		return ref_branch;
	}
	public String getRef_depart() {
		return ref_depart;
	}
	public String getRef_position() {
		return ref_position;
	}
	/*업무수신자(bms_rec)*/
	private int rec_num;
	private String rec_name;  /*업무수신자이름*/
	private String rec_branch; /*업무수신자 지점*/
	private String rec_depart;  /*업무수신자 부서*/
	private String rec_position;	/*업무수신자 직급*/
	
	
	public int getRec_num() {
		return rec_num;
	}
	public void setRec_num(int rec_num) {
		this.rec_num = rec_num;
	}
	public String getRec_name() {
		return rec_name;
	}
	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}
	public String getRec_branch() {
		return rec_branch;
	}
	public void setRec_branch(String rec_branch) {
		this.rec_branch = rec_branch;
	}
	public String getRec_depart() {
		return rec_depart;
	}
	public void setRec_depart(String rec_depart) {
		this.rec_depart = rec_depart;
	}
	public String getRec_position() {
		return rec_position;
	}
	public void setRec_position(String rec_position) {
		this.rec_position = rec_position;
	}
	

	/*업무형태(bm_form)*/
	private int bmfo_num;  
	private String bm_formName; 

	public int getBmfo_num() {
		return bmfo_num;
	}
	public void setBmfo_num(int bmfo_num) {
		this.bmfo_num = bmfo_num;
	}
	public String getBm_formName() {
		return bm_formName;
	}
	public void setBm_formName(String bm_formName) {
		this.bm_formName = bm_formName;
	}

	
	
	
	
	
	

	
}
