package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.Comment;

import utils.DBUtils;

public class CommentDao {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private DBUtils db = null;
	private ResultSet rs = null;
	
	public CommentDao(){
		super();
		this.conn = db.getConnection();
	}
	
	public void insertComment(Comment c) throws SQLException{
		String sql = "insert tb_comment(vote_id,comment_id,content,time,user_id) values(?,?,?,?,?)";
			ps =  conn.prepareStatement(sql);
			ps.setString(1, c.getVoteId());
			ps.setString(2,c.getCommentId());
			ps.setString(3, c.getContent());
			ps.setString(4, c.getTime());
			ps.setString(5,c.getUserId());
			ps.executeUpdate();

	}
	public void insertReply(Comment c,String quoteId) throws SQLException{
		String sql = "insert tb_comment(vote_id,comment_id,content,time,user_id) values(?,?,?,?,?)";
		ps =  conn.prepareStatement(sql);
		ps.setString(1, c.getVoteId());
		ps.setString(2,c.getCommentId());
		ps.setString(3, c.getContent());
		ps.setString(4, c.getTime());
		ps.setString(5,c.getUserId());
		ps.executeUpdate();
		System.out.println(quoteId+"\t"+c.getCommentId());
		insertQCId(quoteId,c.getCommentId());
	}
	
	
	public void insertQCId(String quoteId,String CommentId){
		String sql = "insert tb_quote values(?,?)";

		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1,quoteId);
			ps.setString(2, CommentId);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Comment> searchAllComment(String vote_id) {
		List<Comment> clist = new ArrayList<Comment>();
		Comment c = null ;
		String sql = "select * from tb_comment where vote_id like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,vote_id);
			rs = ps.executeQuery();
			while(rs.next()){
				c = new Comment();
				c.setVoteId(rs.getString("vote_id"));
				c.setCommentId(rs.getString("comment_id"));
				c.setContent(rs.getString("content"));
				c.setTime(rs.getString("time"));
				c.setUserId(rs.getString("user_id"));
				clist.add(c);
			}
			return clist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<String> searchQuoteId(String commentId){
		String sql = "select * from tb_quote where comment_id like ?";
		List<String> l = new ArrayList<String>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,commentId);
			rs = ps.executeQuery();
			while(rs.next()){
				l.add(rs.getString("quote_id"));
			}
			return l;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	 
	public Comment searchOneComment(String  commentId){
		
		Comment c = new Comment() ;
		String sql = "select * from tb_comment where comment_id like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,commentId);
			rs = ps.executeQuery();
			while(rs.next()){
				c.setVoteId(rs.getString("vote_id"));
				c.setCommentId(rs.getString("comment_id"));
				c.setContent(rs.getString("content"));
				c.setTime(rs.getString("time"));
				c.setUserId(rs.getString("user_id"));
			}
			return c;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return null;
	}
}
