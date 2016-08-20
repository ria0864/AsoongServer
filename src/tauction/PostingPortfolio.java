package tauction;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Vector;

public class PostingPortfolio implements Serializable {
	private Vector<TalkPosting> portfolio = new Vector<TalkPosting>();
	
	public void addElement(int talkpost_no, String talkpost_type, String talkpost_date, String talkpost_title,
			String talkpost_contents, int mem_no, String mem_id) {
		portfolio.addElement(new TalkPosting(talkpost_no, talkpost_type, talkpost_date, talkpost_title, talkpost_contents, mem_no, mem_id));
	}
	
	public Iterator<TalkPosting> getPortfolio() {
		return portfolio.iterator();
	}
}