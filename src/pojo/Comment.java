package pojo;

import java.util.List;

public class Comment {
	private String voteId;
	private String commentId;
	private String quoteId;
	private String content;
	private String time;
	private String userId;
	private List<Comment> quocom;
	
	
	
	public Comment() {
		super();
	}

	@Override
	public String toString() {
		return "Comment [voteId=" + voteId + ", commentId=" + commentId
				+ ", quoteId=" + quoteId + ", content=" + content + ", time="
				+ time + ", userId=" + userId + ", quocom=" + quocom + "]";
	}
	
	public Comment(String voteId, String commentId, String quoteId,
			String content, String time, String userId) {
		super();
		this.voteId = voteId;
		this.commentId = commentId;
		this.quoteId = quoteId;
		this.content = content;
		this.time = time;
		this.userId = userId;
	}
	public Comment(String voteId, String commentId,
			String content, String time, String userId) {
		super();
		this.voteId = voteId;
		this.commentId = commentId;
		this.content = content;
		this.time = time;
		this.userId = userId;
	}
	
	
	
	
	public List<Comment> getQuocom() {
		return quocom;
	}

	public void setQuocom(List<Comment> quocom) {
		this.quocom = quocom;
	}

	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getCommentId() {
		return commentId;
	}
	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}
	public String getQuoteId() {
		return quoteId;
	}
	public void setQuoteId(String quoteId) {
		this.quoteId = quoteId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
}
