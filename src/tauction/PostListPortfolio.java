package tauction;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Vector;

public class PostListPortfolio implements Serializable {
	private Vector<TalkPostList> portfolio = new Vector<TalkPostList>();
	
	public void addElement(int talkpost_no, String talkpost_type, String talkpost_date, String talkpost_title,
			String mem_id) {
		portfolio.addElement(new TalkPostList(talkpost_no, talkpost_type, talkpost_date, talkpost_title, mem_id));
	}
	
	public Iterator<TalkPostList> getPortfolio() {
		return portfolio.iterator();
	}
}
