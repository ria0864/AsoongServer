package tauction;

import java.io.Serializable;
import java.util.Date;

public class AskList implements Serializable {
	private int ask_no;
	private Date ask_date;
	private String ask_title;
	private String ask_contents;
	private int done;
	private int reg_no;
	private int ask_num;
	private String ask_type;
	private String ask_gender;
	private String ask_trip;
	private int ask_budget;
	private String ask_convin;
	private Date ask_startday;
	private Date ask_endday;
	private String ask_pay;
	private int mem_no;

	public AskList(int ask_no, Date ask_date, String ask_title, String ask_contents, int done, int reg_no,
			int ask_num, String ask_type, String ask_gender, String ask_trip, int ask_budget, String ask_convin,
			Date ask_startday, Date ask_endday, String ask_pay, int mem_no) {
		this.ask_no = ask_no;
		this.ask_date = ask_date;
		this.ask_title = ask_title;
		this.ask_contents = ask_contents;
		this.done = done;
		this.reg_no = reg_no;
		this.ask_num = ask_num;
		this.ask_type = ask_type;
		this.ask_gender = ask_gender;
		this.ask_trip = ask_trip;
		this.ask_budget = ask_budget;
		this.ask_convin = ask_convin;
		this.ask_startday = ask_startday;
		this.ask_endday = ask_endday;
		this.ask_pay = ask_pay;
		this.mem_no = mem_no;
	}

	public int getAsk_no() {
		return ask_no;
	}

	public Date getAsk_date() {
		return ask_date;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public String getAsk_contents() {
		return ask_contents;
	}

	public int getDone() {
		return done;
	}

	public int getReg_no() {
		return reg_no;
	}

	public int getAsk_num() {
		return ask_num;
	}

	public String getAsk_type() {
		return ask_type;
	}

	public String getAsk_gender() {
		return ask_gender;
	}

	public String getAsk_trip() {
		return ask_trip;
	}

	public int getAsk_budget() {
		return ask_budget;
	}

	public String getAsk_convin() {
		return ask_convin;
	}

	public Date getAsk_startday() {
		return ask_startday;
	}

	public Date getAsk_endday() {
		return ask_endday;
	}

	public String getAsk_pay() {
		return ask_pay;
	}

	public int getMem_no() {
		return mem_no;
	}
	

}
