package tauction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@SuppressWarnings("serial")
public class AskListPortfolio implements Serializable {
	private List<AskList> portfolio = Collections.synchronizedList(new ArrayList<AskList>());

	public void addElement(int ask_no, Date ask_date, String ask_title, String ask_contents, int done, int reg_no,
			int ask_num, String ask_type, String ask_gender, String ask_trip, int ask_budget, String ask_convin,
			Date ask_startday, Date ask_endday, String ask_pay, int mem_no) {
		portfolio.add(new AskList(ask_no, ask_date, ask_title, ask_contents, done, reg_no, ask_num,
				ask_type, ask_gender, ask_trip, ask_budget, ask_convin, ask_startday, ask_endday, ask_pay, mem_no));
	}

	public List<AskList> getPortfolio() {
		return portfolio;
	}
}
