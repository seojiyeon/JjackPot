package jackpot.DTO;

import java.sql.Timestamp;

public class workDTO {
	
	private int num;
	private String emp_num;
	private Timestamp work_on;
	private Timestamp work_off;
	private Timestamp work_time;
	private Timestamp h_work;
	private Timestamp workOut;
	private Timestamp lateNess;
	private Timestamp early;
	private int division;

	private String ip;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(String emp_num) {
		this.emp_num = emp_num;
	}
	public Timestamp getWork_on() {
		return work_on;
	}
	public void setWork_on(Timestamp work_on) {
		this.work_on = work_on;
	}
	public Timestamp getWork_off() {
		return work_off;
	}
	public void setWork_off(Timestamp work_off) {
		this.work_off = work_off;
	}
	public Timestamp getWork_time() {
		return work_time;
	}
	public void setWork_time(Timestamp work_time) {
		this.work_time = work_time;
	}
	public Timestamp getH_work() {
		return h_work;
	}
	public void setH_work(Timestamp h_work) {
		this.h_work = h_work;
	}
	public Timestamp getWorkOut() {
		return workOut;
	}
	public void setWorkOut(Timestamp workOut) {
		this.workOut = workOut;
	}
	public Timestamp getLateNess() {
		return lateNess;
	}
	public void setLateNess(Timestamp lateNess) {
		this.lateNess = lateNess;
	}
	public Timestamp getEarly() {
		return early;
	}
	public void setEarly(Timestamp early) {
		this.early = early;
	}
	public int getDivision() {
		return division;
	}
	public void setDivision(int division) {
		this.division = division;
	}

	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	
}
