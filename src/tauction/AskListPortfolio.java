package tauction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@SuppressWarnings("serial")
public class AskListPortfolio implements Serializable {
	private List<AskList> portfolio = Collections.synchronizedList(new ArrayList<AskList>());

	public void addElement(int ask_no, int done, int reg_no, Date ask_startday, Date ask_endday, int ask_budget,
			int ask_num, String mem_id, int ask_commentNo) {
		portfolio.add(new AskList(ask_no, done, reg_no, ask_startday, ask_endday, ask_budget, ask_num, mem_id,
				ask_commentNo));
	}

	public List<AskList> getPortfolio() {
		return portfolio;
	}
}