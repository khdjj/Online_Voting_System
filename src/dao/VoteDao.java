package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.User;
import pojo.VoteFont;

import utils.DBUtils;

public class VoteDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private DBUtils db = null;
	private ResultSet rs = null;

	public VoteDao() {
		super();
		this.conn = db.getConnection();
	}

	public void deleteVote(String vid) throws SQLException{
		String sql = "delete tbv.*,tbo.* from tb_vote_font tbv,tb_options tbo where tbv.vote_id = ? and tbv.options_id = tbo.options_id";
		ps = conn.prepareStatement(sql);
		ps.setString(1, vid);
		ps.executeUpdate();
	}
	
	public void modifyVote(VoteFont v,String vid) throws SQLException{
		String sql = "delete tbv.*,tbo.* from tb_vote_font tbv,tb_options tbo where tbv.vote_id = ? and tbv.options_id = tbo.options_id";
		ps = conn.prepareStatement(sql);
		ps.setString(1, vid);
		ps.executeUpdate();
		insertVote(v,null);
		
	}
	
	public void insertVote(VoteFont v,String [] d) throws SQLException {

		String sql = "insert tb_vote_font(vote_id,options_id,img_url,descp,"
				+ "time,single_ele,multiple_ele,classify,start_time,end_time,"
				+ "visible,keysword,userId,title,type) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println(sql);
		OptionsDao dao = new OptionsDao();
		ps = conn.prepareStatement(sql);
		System.out.println(v.getVoteId());
		ps.setString(1, v.getVoteId());
		ps.setString(2, v.getOptionsId());
		ps.setString(3, v.getImgUrl());
		ps.setString(4, v.getDesc());
		ps.setString(5, v.getTime());
		ps.setString(6, v.getSingleEle());
		ps.setString(7, v.getMultipleEle());
		ps.setString(8, v.getClassify());
		ps.setString(9, v.getStartTime());	
		ps.setString(10, v.getEndTime());
		ps.setString(11, v.getVisible());
		ps.setString(12, v.getKey());
		ps.setString(13, v.getUserId());
		ps.setString(14, v.getTitle());
		ps.setString(15, v.getType());
		ps.executeUpdate();
		if(v.getType().equals("font")){
			dao.InsertOptions(v.getOptionsId(), v.getOptions(), 0);
		}else if(v.getType().equals("img")){
			dao.insertImgOptions(v.getOptionsId(),d, 0, v.getOptions());
		}
	}
	
	

	public void insertVisitNum(String voteId) {
		String sql = "update tb_vote_font set visits_num = visits_num +1 where vote_id like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, voteId);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void UpdateMultNum(String voteId, int voteNum) {
		String sql = "update tb_vote_font set votes_num = votes_num + ? where vote_id like ?";
		try {
			System.out.println(voteId);
			System.out.println(voteNum);
			System.out.println("voteNum ！=null");
			ps = conn.prepareStatement(sql);
			ps.setInt(1, voteNum);
			ps.setString(2, voteId);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void UpdateVoteNum(String voteId) {
		String sql;
		System.out.println(voteId);
		sql = "update tb_vote_font set votes_num = votes_num +1 where vote_id like ?";
		try {
			System.out.println("abc");
			ps = conn.prepareStatement(sql);
			ps.setString(1, voteId);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<VoteFont> getVote(int offset, int limit) {

		if (limit == 0) {
			limit = 6;
		}
		if(offset == 0){
			offset = 0;
		}
		List<VoteFont> list = new ArrayList<VoteFont>();
		VoteFont vf = null;
		String sql = "select * from tb_vote_font limit ?,?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, offset);
			ps.setInt(2, limit);
			rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("bbbb");
				vf = new VoteFont();
				vf.setVoteId(rs.getString("vote_id"));
				vf.setOptionsId(rs.getString("options_id"));
				vf.setImgUrl(rs.getString("img_url"));
				vf.setDesc(rs.getString("descp"));
				vf.setTime(rs.getString("time"));
				vf.setSingleEle(rs.getString("single_ele"));
				vf.setMultipleEle(rs.getString("multiple_ele"));
				vf.setClassify(rs.getString("classify"));
				vf.setStartTime(rs.getString("start_time"));
				vf.setEndTime(rs.getString("end_time"));
				vf.setVisible(rs.getString("visible"));
				vf.setKey(rs.getString("keysword"));
				vf.setUserId(rs.getString("userId"));
				vf.setTitle(rs.getString("title"));
				vf.setComment(rs.getInt("comment"));
				vf.setVotes_num(rs.getInt("votes_num"));
				vf.setVisits_num(rs.getInt("visits_num"));
				vf.setThumbs_num(rs.getInt("thumbs_num"));
				vf.setCommentId(rs.getString("commentId"));
				vf.setType(rs.getString("type"));
				list.add(vf);
				System.out.println(vf);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public VoteFont searchVoteFontById(String vid) {

		VoteFont vf = null;
		String sql = "select * from tb_vote_font where vote_id like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vid);
			rs = ps.executeQuery();
			while (rs.next()) {
				vf = new VoteFont();
				vf.setVoteId(rs.getString("vote_id"));
				vf.setOptionsId(rs.getString("options_id"));
				vf.setImgUrl(rs.getString("img_url"));
				vf.setDesc(rs.getString("descp"));
				vf.setTime(rs.getString("time"));
				vf.setSingleEle(rs.getString("single_ele"));
				vf.setMultipleEle(rs.getString("multiple_ele"));
				vf.setClassify(rs.getString("classify"));
				vf.setStartTime(rs.getString("start_time"));
				vf.setEndTime(rs.getString("end_time"));
				vf.setVisible(rs.getString("visible"));
				vf.setKey(rs.getString("keysword"));
				vf.setUserId(rs.getString("userId"));
				vf.setTitle(rs.getString("title"));
				vf.setComment(rs.getInt("comment"));
				vf.setVotes_num(rs.getInt("votes_num"));
				vf.setVisits_num(rs.getInt("visits_num"));
				vf.setThumbs_num(rs.getInt("thumbs_num"));
				vf.setCommentId(rs.getString("commentId"));
			}
			return vf;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<VoteFont> searchByUserId(String userId) {

		List<VoteFont> list = new ArrayList<VoteFont>();
		VoteFont vf = null;
		String sql = "select * from tb_vote_font where userId like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				vf = new VoteFont();
				vf.setVoteId(rs.getString("vote_id"));
				vf.setOptionsId(rs.getString("options_id"));
				vf.setImgUrl(rs.getString("img_url"));
				vf.setDesc(rs.getString("descp"));
				vf.setTime(rs.getString("time"));
				vf.setSingleEle(rs.getString("single_ele"));
				vf.setMultipleEle(rs.getString("multiple_ele"));
				vf.setClassify(rs.getString("classify"));
				vf.setStartTime(rs.getString("start_time"));
				vf.setEndTime(rs.getString("end_time"));
				vf.setVisible(rs.getString("visible"));
				vf.setKey(rs.getString("keysword"));
				vf.setUserId(rs.getString("userId"));
				vf.setTitle(rs.getString("title"));
				vf.setComment(rs.getInt("comment"));
				vf.setVotes_num(rs.getInt("votes_num"));
				vf.setVisits_num(rs.getInt("visits_num"));
				vf.setThumbs_num(rs.getInt("thumbs_num"));
				vf.setCommentId(rs.getString("commentId"));
				list.add(vf);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public List<VoteFont> searchByKey(String userId,String key) {

		List<VoteFont> list = new ArrayList<VoteFont>();
		VoteFont vf = null;
		String sql = "select * from tb_vote_font where userId like ? and keysword like '%"+key+"%'";
		System.out.println(sql);
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				vf = new VoteFont();
				vf.setVoteId(rs.getString("vote_id"));
				vf.setOptionsId(rs.getString("options_id"));
				vf.setImgUrl(rs.getString("img_url"));
				vf.setDesc(rs.getString("descp"));
				vf.setTime(rs.getString("time"));
				vf.setSingleEle(rs.getString("single_ele"));
				vf.setMultipleEle(rs.getString("multiple_ele"));
				vf.setClassify(rs.getString("classify"));
				vf.setStartTime(rs.getString("start_time"));
				vf.setEndTime(rs.getString("end_time"));
				vf.setVisible(rs.getString("visible"));
				vf.setKey(rs.getString("keysword"));
				vf.setUserId(rs.getString("userId"));
				vf.setTitle(rs.getString("title"));
				vf.setComment(rs.getInt("comment"));
				vf.setVotes_num(rs.getInt("votes_num"));
				vf.setVisits_num(rs.getInt("visits_num"));
				vf.setThumbs_num(rs.getInt("thumbs_num"));
				vf.setCommentId(rs.getString("commentId"));
				list.add(vf);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

}
