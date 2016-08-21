package tauction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class AskContentPortfolio implements Serializable {
	private List<AskContent> portfolio = Collections.synchronizedList(new ArrayList<AskContent>());

	public void addElement(int ask_no, Date ask_date, String ask_title, String ask_contents, int done, int reg_no,
			int ask_num, String ask_type, String ask_gender, String ask_trip, int ask_budget, String ask_convin,
			Date ask_startday, Date ask_endday, String ask_pay, String mem_id, int isLike, int ask_commentNo) {
		portfolio.add(new AskContent(ask_no, ask_date, ask_title, ask_contents, done, reg_no, ask_num,
				ask_type, ask_gender, ask_trip, ask_budget, ask_convin, ask_startday, ask_endday, ask_pay, mem_id, isLike, ask_commentNo));
	}

	public List<AskContent> getPortfolio() {
		return portfolio;
	}
}
