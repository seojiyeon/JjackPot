package jackpot.DTO;

import java.sql.Timestamp;
import java.util.Date;

public class msgDTO {

	private int msg_num;
	private String emp_num;
	private String msg_cate;
	private String msg_send;
	private String msg_receive;
	private String msg_title;
	private String msg_content;
	private Date msg_read;
	private Date msg_st;
	private int msg_group;
	private String msg_state;
	private int ref;
	private int re_step;
	private int re_level;
	private String msg_rid;
	
	
	public String getMsg_rid() {
		return msg_rid;
	}
	public void setMsg_rid(String msg_rid) {
		this.msg_rid = msg_rid;
	}
	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public String getMsg_cate() {
		return msg_cate;
	}
	public void setMsg_cate(String msg_cate) {
		this.msg_cate = msg_cate;
	}
	public String getMsg_send() {
		return msg_send;
	}
	public void setMsg_send(String msg_send) {
		this.msg_send = msg_send;
	}
	public String getMsg_receive() {
		return msg_receive;
	}
	public void setMsg_receive(String msg_receive) {
		this.msg_receive = msg_receive;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getMsg_read() {
		return msg_read;
	}
	public void setMsg_read(Date msg_read) {
		this.msg_read = msg_read;
	}
	public Date getMsg_st() {
		return msg_st;
	}
	public void setMsg_st(Date msg_st) {
		this.msg_st = msg_st;
	}
	public int getMsg_group() {
		return msg_group;
	}
	public void setMsg_group(int msg_group) {
		this.msg_group = msg_group;
	}
	public String getMsg_state() {
		return msg_state;
	}
	public void setMsg_state(String msg_state) {
		this.msg_state = msg_state;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}


}