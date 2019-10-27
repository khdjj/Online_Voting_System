package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.PageBean;
import pojo.User;

import utils.DBUtils;

import com.mysql.jdbc.Statement;

public class UserDao {

	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public UserDao(){
		super();
		this.conn = DBUtils.getConnection();
	}
	
	public User selectUser(){
		return null;
	}
	
	
	public User selectByName(String name){
		
		String sql = "select * from tb_user where username like ?";
		User user = new User();
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs.next()){
				user.setPhone(rs.getString("phone"));
				user.setPwd(rs.getString("pwd"));
				user.setUserId(rs.getString("userId"));
				user.setUsername(rs.getString("username"));
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public int searchByStatus(String uid){
		
		String sql = "select status from tb_user where userId like ?";
		int status = 0;
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			while(rs.next()){
				status = rs.getInt("status");
			}
			return status;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public void InsertUser(User user){
		String sql = "insert tb_user(phone,username,userId,pwd,age,sex,city,apply) values(?,?,?,?,?,?,?,?)";
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1, user.getPhone());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getUserId());
			ps.setString(4, user.getPwd());
			ps.setString(5, user.getAge());
			ps.setString(6, user.getSex());
			ps.setString(7, user.getCity());
			ps.setInt(8, user.getApply());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean validatePhone(String phone){
		String sql = "select userId from tb_user where phone like ?";
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1,phone);
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getString("userId") != null){
					return false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public String userLogin(String username,String pwd){
		System.out.println(username);
		String sql = "select userId from tb_user where phone like ? or username like ? and pwd like ?";
		try {
			ps =  conn.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2,username);
			ps.setString(3,pwd);
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString("userId"));
				String userId = rs.getString("userId");
				if(userId != null){
					return userId;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public ResultSet getUser(PageBean page){

		String sql = "select * from tb_user limit ?,?";
		
		try {
			System.out.println(page.getStart()+"\t"+page.getRows());
			ps = conn.prepareStatement(sql);
			ps.setInt(1, page.getStart());
			ps.setInt(2, page.getRows());
			rs = ps.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	public int userCount()throws Exception{
		String sql="select count(*) as total from tb_user";
		ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery(sql);
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	
	public void modifyUser(User u) throws SQLException{
	
		String sql = "update tb_user set phone = ?,username = ?,pwd = ?,status = ?,age = ?,sex = ?,city = ? where userId = ?";
		

			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getPhone());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getPwd());
			ps.setInt(4, u.getStatus());
			ps.setString(5, u.getAge());
			ps.setString(6, u.getSex());
			ps.setString(7, u.getCity());
			ps.setString(8, u.getUserId());

			ps.executeUpdate();
		

	}
	
	public ResultSet searchUser(String key,String value) throws SQLException{
		System.out.println(key+"\t"+value);
		String sql = "select * from tb_user where ? like ?";
		System.out.println(sql);
		ps = conn.prepareStatement(sql);
		ps.setString(1, key);
		ps.setString(2, value);
		rs = ps.executeQuery();
		while(rs.next()){
			System.out.println(rs.getString("username"));
		}
		return rs;
	}
	
}
