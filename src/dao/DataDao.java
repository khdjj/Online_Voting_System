package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONObject;

import pojo.Data;

import utils.DBUtils;

public class DataDao {

	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static DBUtils db = null;
	private static ResultSet rs = null;

	public DataDao() {
		super();
		this.conn = DBUtils.getConnection();
	}

	public  List<Data> searchBySex(String voteId) {
		List<Data> dlist = new ArrayList<Data>();
		Data d = null;
		String sql = "select options,sex,count(*) as count from tb_vote_over tv,tb_user tu where vote_id like ? and tv.user_id like tu.userId   GROUP BY options,sex";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, voteId);
			rs = ps.executeQuery();
			while (rs.next()) {
				d = new Data();
				d.setOptions(rs.getString("options"));
				d.setSex(rs.getString("sex"));
				d.setCount(rs.getInt("count"));
				dlist.add(d);
			}
			return dlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public  List<Data> searchByAge(String voteId) {
		List<Data> dlist = new ArrayList<Data>();
		Data d = null;
		String sql = "select options,age,count(*) as count from tb_vote_over tv,tb_user tu where vote_id like ? and tv.user_id like tu.userId   GROUP BY options,age";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, voteId);
			rs = ps.executeQuery();
			while (rs.next()) {
				d = new Data();
				d.setOptions(rs.getString("options"));
				d.setSex(rs.getString("age"));
				d.setCount(rs.getInt("count"));
				dlist.add(d);
			}
			return dlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

	public  List<Data> searchByCity(String voteId) {
		List<Data> dlist = new ArrayList<Data>();
		Data d = null;
		String sql = "select options,city,count(*) as count from tb_vote_over tv,tb_user tu where vote_id like ? and tv.user_id like tu.userId   GROUP BY options,city";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, voteId);
			rs = ps.executeQuery();
			while (rs.next()) {
				d = new Data();
				d.setOptions(rs.getString("options"));
				d.setSex(rs.getString("city"));
				d.setCount(rs.getInt("count"));
				dlist.add(d);
			}
			return dlist;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String  getData(String voteId,String classfity) {

		List<Data> d = null;
		String [] data = null;
		List<String> opt;
		OptionsDao dao = new OptionsDao();
		if(classfity.equals("sex")){
			 d = searchBySex(voteId);
			 data = new String[]{"女","男"};
		}else if(classfity.equals("age")){
			 d = searchByAge(voteId);
			 data = new String[]{"0-20岁","20-30岁","30-45岁","50-60岁","60岁以上"};
		}else if(classfity.equals("city")){
			 d = searchByCity(voteId);
			 data = new String[]{"一线城市","二线城市","三线城市","四线城市","五线城市"};
		}
		 opt = dao.searchOptionsName(voteId);
		 
		 
		JSONObject obj1 = new JSONObject();
		JSONObject obj2 = null;
	
		for(int i=0;i<d.size();i++){
			String o = d.get(i).getOptions();
			obj2 = new JSONObject();
			int f = 0;
			for(int j = 0;j<d.size();j++){
				if(o.equals(d.get(j).getOptions())){
					i++;
					f++;
					obj2.put(d.get(j).getSex(), d.get(j).getCount());
				}
			}
			if(f>1){
				i = i - f ;
				
			}
			if(f == 1){
				i--;
			}
			obj1.put(o, obj2);
		}
		JSONObject obj4 = null;
		for(int i = 0 ;i<opt.size();i++){
			obj4 = new JSONObject();
			if(obj1.get(opt.get(i))==null){
				JSONObject obj3 = new JSONObject();
				for(int j=0;j<data.length;j++){
					obj3.put(data[j], 0);
				}
				obj1.put(opt.get(i), obj3);
			}else{
				JSONObject obj = obj1.getJSONObject(opt.get(i));
				for(int j = 0;j<data.length;j++){
					if(obj.get(data[j])==null){
						obj4.put(data[j], 0);
					}else{
						obj4.put(data[j], obj.get(data[j]));
					}
				}
				System.out.println();
				obj1.put(opt.get(i), obj4);
			}
		}
		JSONObject o = new JSONObject();
		o.put("data", obj1);
		System.out.println(obj1.toString());
		return o.toString();
	}

}
