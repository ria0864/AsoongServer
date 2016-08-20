package tauction;

import java.io.Serializable;

public class TalkPosting implements Serializable {
	private int talkpost_no;
	private String talkpost_type; /* mate, tip, free, event */
	private String talkpost_date;
	private String talkpost_title;
	private String talkpost_content;
	private int mem_no;
	private String mem_id;
	
	public TalkPosting(int talkpost_no, String talkpost_type, String talkpost_date, String talkpost_title,
			String talkpost_content, int mem_no, String mem_id) {
		this.talkpost_no = talkpost_no;
		this.talkpost_type = talkpost_type;
		this.talkpost_date = talkpost_date;
		this.talkpost_title = talkpost_title;
		this.talkpost_content = talkpost_content;
		this.mem_no = mem_no;
		this.mem_id = mem_id;
	}

	public int getTalkpost_no() {
		return talkpost_no;
	}

	public String getTalkpost_type() {
		return talkpost_type;
	}

	public String getTalkpost_date() {
		return talkpost_date;
	}

	public String getTalkpost_title() {
		return talkpost_title;
	}

	public String getTalkpost_content() {
		return talkpost_content;
	}

	public int getMem_no() {
		return mem_no;
	}
	
	public String getMem_id() {
		return mem_id;
	}
}
