package tauction;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

public class PostListPortfolio implements Serializable {
	//private ArrayList<TalkPostList> portfolio = new ArrayList<TalkPostList>();
	private List<TalkPostList> portfolio = Collections.synchronizedList(new ArrayList<TalkPostList>());
	
	public void addElement(int talkpost_no, String talkpost_type, String talkpost_date, String talkpost_title,
			String mem_id) {
		portfolio.add(new TalkPostList(talkpost_no, talkpost_type, talkpost_date, talkpost_title, mem_id));
	}
	
	public List<TalkPostList> getPortfolio() {
		return portfolio;
	}
}
