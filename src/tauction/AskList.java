package tauction;

import java.io.Serializable;
import java.util.Date;

public class AskList implements Serializable {
	private int ask_no;
	private int done;
	private int reg_no;
	private Date ask_startday;
	private Date ask_endday;
	private int ask_budget;
	private int ask_num;
	private String mem_id;
	private int ask_commentNo;

	public AskList(int ask_no, int done, int reg_no, Date ask_startday, Date ask_endday,
			int ask_budget, int ask_num, String mem_id, int ask_commentNo) {
		this.ask_no = ask_no;
		this.done = done;
		this.reg_no = reg_no;
		this.ask_startday = ask_startday;
		this.ask_endday = ask_endday;
		this.ask_budget = ask_budget;
		this.ask_num = ask_num;
		this.mem_id = mem_id;
		this.ask_commentNo = ask_commentNo;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}

	public int getDone() {
		return done;
	}

	public void setDone(int done) {
		this.done = done;
	}

	public int getReg_no() {
		return reg_no;
	}

	public void setReg_no(int reg_no) {
		this.reg_no = reg_no;
	}

	public Date getAsk_startday() {
		return ask_startday;
	}

	public void setAsk_startday(Date ask_startday) {
		this.ask_startday = ask_startday;
	}

	public Date getAsk_endday() {
		return ask_endday;
	}

	public void setAsk_endday(Date ask_endday) {
		this.ask_endday = ask_endday;
	}

	public int getAsk_budget() {
		return ask_budget;
	}

	public void setAsk_budget(int ask_budget) {
		this.ask_budget = ask_budget;
	}

	public int getAsk_num() {
		return ask_num;
	}

	public void setAsk_num(int ask_num) {
		this.ask_num = ask_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public int getAsk_commentNo() {
		return ask_commentNo;
	}

	public void setAsk_commentNo(int ask_commentNo) {
		this.ask_commentNo = ask_commentNo;
	}


}
