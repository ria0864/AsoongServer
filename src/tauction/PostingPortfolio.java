package tauction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class PostingPortfolio implements Serializable {
	//private ArrayList<TalkPosting> portfolio = new ArrayList<TalkPosting>();
	private List<TalkPosting> portfolio = Collections.synchronizedList(new ArrayList<TalkPosting>());
	public void addElement(int talkpost_no, String talkpost_type, String talkpost_date, String talkpost_title,
			String talkpost_contents, int mem_no, String mem_id) {
		portfolio.add(new TalkPosting(talkpost_no, talkpost_type, talkpost_date, talkpost_title, talkpost_contents, mem_no, mem_id));
	}
	
	public List<TalkPosting> getPortfolio() {
		return portfolio;
	}
}