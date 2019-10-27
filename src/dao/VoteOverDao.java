package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.DBUtils;
import utils.Utils;

public class VoteOverDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private DBUtils db = null;
	private ResultSet rs = null;
	
	public VoteOverDao(){
		super();
		this.conn = db.getConnection();
	}
	
	
	public void insertVoteOver(String vid,String uid,String time,String options){
	
		String sql = "insert tb_vote_over values(?,?,?,?,0)";
		try {
				ps =  conn.prepareStatement(sql);
				ps.setString(1, vid);
				ps.setString(2, uid);
				ps.setString(3,	time);
				ps.setString(4, options);
				ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void insertVoteMultOver(String vid,String uid,String time,String opt){
		String[] o = Utils.stringToList(opt);
		String sql = "insert tb_vote_over values(?,?,?,?,1)";
		for(int i = 0 ;i<o.length ;i++){
			try {
				ps =  conn.prepareStatement(sql);
				System.out.println(o[i]);
				ps.setString(1, vid);
				ps.setString(2, uid);
				ps.setString(3,	time);
				ps.setString(4, o[i]);
				ps.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
	}
	
	
	public boolean SearchByOneDay(String vid,String uid,String time){
		
		System.out.println(time);
		String sql = "select * from  tb_vote_over where vote_id like ? and user_id like ? and time like ?";
		try {
				System.out.println(sql);
				ps =  conn.prepareStatement(sql);
				ps.setString(1, vid);
				ps.setString(2, uid);
				ps.setString(3,	time);
				rs = ps.executeQuery();
				while(rs.next()){
					System.out.println("next");
					return true;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	

}
