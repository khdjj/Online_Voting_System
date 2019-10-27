package pojo;

import java.util.Arrays;
import java.util.List;

public class VoteFont {

	private String voteId;
	private String title;
	private String optionsId;
	private String[] options;
	private String imgUrl;
	private String desc;
	private String time;
	private String singleEle;
	private String multipleEle;
	private String classify;
	private String startTime;
	private String endTime;
	private String visible;
	private String key;
	private String userId;
	private int comment;
	private int votes_num;
	private int thumbs_num;
	private int visits_num;
	private String commentId;
	private String type;
	private String status;

	
	
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getCommentId() {
		return commentId;
	}


	public void setCommentId(String commentId) {
		this.commentId = commentId;
	}


	public int getComment() {
		return comment;
	}


	public void setComment(int comment) {
		this.comment = comment;
	}


	public int getVotes_num() {
		return votes_num;
	}


	public void setVotes_num(int votes_num) {
		this.votes_num = votes_num;
	}


	public int getThumbs_num() {
		return thumbs_num;
	}


	public void setThumbs_num(int thumbs_num) {
		this.thumbs_num = thumbs_num;
	}


	public int getVisits_num() {
		return visits_num;
	}


	public void setVisits_num(int visits_num) {
		this.visits_num = visits_num;
	}


	public VoteFont() {
		super();
	}
	
	
	
	
	
	
	
	
	
	

	public VoteFont(String voteId, String title, String optionsId, String desc,
			String time, String classify,
			String startTime, String endTime, String key, String userId,String visible,String type) {
		super();
		this.voteId = voteId;
		this.title = title;
		this.optionsId = optionsId;
		this.desc =desc;
		this.time = time;
		this.classify = classify;
		this.startTime = startTime;
		this.endTime = endTime;
		this.key = key;
		this.visible = visible;
		this.userId = userId;
		this.type = type;
	}


	public VoteFont(String voteId,String optionsId,String title, String imgUrl, String desc,
			String time, String classify, String startTime, String endTime,
			String visible, String key, String userId,String type) {
		super();
		this.type = type;
		this.voteId = voteId;
		this.optionsId = optionsId;
		this.title = title;
		this.imgUrl = imgUrl;
		this.desc = desc;
		this.time = time;
		this.classify = classify;
		this.startTime = startTime;
		this.endTime = endTime;
		this.visible = visible;
		this.key = key;
		this.userId = userId;
	}


	
	


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String[] getOptions() {
		return options;
	}


	public void setOptions(String[] options) {
		this.options = options;
	}


	public String getVoteId() {
		return voteId;
	}
	public void setVoteId(String voteId) {
		this.voteId = voteId;
	}
	public String getOptionsId() {
		return optionsId;
	}
	public void setOptionsId(String optionsId) {
		this.optionsId = optionsId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSingleEle() {
		return singleEle;
	}
	public void setSingleEle(String singleEle) {
		this.singleEle = singleEle;
	}
	public String getMultipleEle() {
		return multipleEle;
	}
	public void setMultipleEle(String multipleEle) {
		this.multipleEle = multipleEle;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getVisible() {
		return visible;
	}
	public void setVisible(String visible) {
		this.visible = visible;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "VoteFont [voteId=" + voteId + ", title=" + title
				+ ", optionsId=" + optionsId + ", options="
				+ Arrays.toString(options) + ", imgUrl=" + imgUrl + ", desc="
				+ desc + ", time=" + time + ", singleEle=" + singleEle
				+ ", multipleEle=" + multipleEle + ", classify=" + classify
				+ ", startTime=" + startTime + ", endTime=" + endTime
				+ ", visible=" + visible + ", key=" + key + ", userId="
				+ userId + ", comment=" + comment + ", votes_num=" + votes_num
				+ ", thumbs_num=" + thumbs_num + ", visits_num=" + visits_num
				+ ", commentId=" + commentId + ", type=" + type + "]";
	}


	
	
	
}
