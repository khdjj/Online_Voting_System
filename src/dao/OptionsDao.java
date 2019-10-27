package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.Options;

import utils.DBUtils;
import utils.Utils;

public class OptionsDao {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private DBUtils db = null;
	private ResultSet rs = null;
	
	public OptionsDao(){
		super();
		this.conn = db.getConnection();
	}
	
	public void InsertOptions(String optionsId,String[] options,int num){
		String sql = "insert tb_options(options_id,options,num) values(?,?,?)";
		try {
			for(int i=0;i<options.length;i++){
				ps =  conn.prepareStatement(sql);
				ps.setString(1, optionsId);
				ps.setString(2, options[i]);
				ps.setInt(3, num);
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertImgOptions(String optionsId,String[] opt,int num,String[] img ){
		String sql = "insert tb_options(options_id,options,num,img) values(?,?,?,?)";
		try {
			for(int i=0;i<opt.length;i++){
				ps =  conn.prepareStatement(sql);
				ps.setString(1, optionsId);
				ps.setString(2, opt[i]);
				ps.setInt(3, num);
				ps.setString(4, img[i]);
				ps.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateOptions(String opt,String uid, String vid,String oid,String time) throws SQLException{
		VoteDao dao = new VoteDao();
	
		VoteOverDao over = new VoteOverDao();
		String sql = "update tb_options set num = num + 1 where options like ? and options_id like ?";
				ps =  conn.prepareStatement(sql);
				ps.setString(1, opt);
				ps.setString(2, oid);
				ps.executeUpdate();
				over.insertVoteOver(vid, uid,time,opt);
				dao.UpdateVoteNum(vid);
				
	}
	
	
	public void  updateMultiOptions(String opt,String uid, String vid,String oid,String time) throws SQLException{
		System.out.println("optoinsDao");
		System.out.println(oid);
		String[] o = Utils.stringToList(opt);
		VoteDao dao = new VoteDao();
		VoteOverDao over = new VoteOverDao();
		String sql = "update tb_options set num = num + 1 where options like ? and options_id like ?";
		for(int i = 0 ;i<o.length ;i++){
			ps =  conn.prepareStatement(sql);
			System.out.println(o[i]);
			ps.setString(1, o[i]);
			ps.setString(2, oid);
			ps.executeUpdate();
		}
		System.out.println(vid);
		System.out.println(o.length);
		over.insertVoteMultOver(vid, uid,time,opt);
		dao.UpdateMultNum(vid,o.length);;
				
	}

	
	
	public List<Options> searchOptions(String optionsId){
		Options opt =null;
		List<Options> list = new ArrayList<Options>();
		String sql = "select * from tb_options where options_id like ?";
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1, optionsId);
			rs = ps.executeQuery();
			while(rs.next()){
				opt = new Options();
				opt.setOptions(rs.getString("options"));
				opt.setOptionsId(rs.getString("options_id"));
				opt.setNum(rs.getInt("num"));
				opt.setImg(rs.getString("img"));
				list.add(opt);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public List<String> searchOptionsName(String voteId){
		List<String> opt = new ArrayList<String>();
		String sql = "select options from tb_vote_font tbv,tb_options tbo where vote_id = ? and tbv.options_id = tbo.options_id;";
		try {
				ps =  conn.prepareStatement(sql);
				ps.setString(1, voteId);
				rs = ps.executeQuery();
				while(rs.next()){
					opt.add(rs.getString("options"));
				}
			return opt;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Options searchOneOptions(String optionsId){
		Options opt =null;
		String sql = "select * from tb_options where options_id like ? limit 0,1";
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1, optionsId);
			rs = ps.executeQuery();
			while(rs.next()){
				opt = new Options();
				opt.setOptions(rs.getString("options"));
				opt.setOptionsId(rs.getString("options_id"));
				opt.setNum(rs.getInt("num"));
				opt.setImg(rs.getString("img"));
			}
			return opt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	

	
}
