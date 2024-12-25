package com.dao;

import java.sql.*;
import java.util.*;

import com.entity.*;

public class ContactDAO {

	private Connection conn;

	public ContactDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean saveContact(contact c) {

		boolean f = false;

		try {

			String sql = "insert into contact(name,email,phno,about,userid) values(?,?,?,?,?) ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getUserId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;

	}

	public List<contact> getAllContact(int uid) {

		List<contact> list = new ArrayList<contact>();

		contact c = null;

		try {
			String sql = "select * from contact where userid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c = new contact();
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));

				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return list;

	}

	public contact getContactById(int cid) {
		contact c = new contact();
		try {
			String sql = "select * from contact where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				c.setId(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setEmail(rs.getString(3));
				c.setPhno(rs.getString(4));
				c.setAbout(rs.getString(5));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}

	public boolean updateContact(contact c) {

		boolean f = false;

		try {

			String sql = "UPDATE contact SET name = ?, email = ?, phno = ?, about = ? WHERE id = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getEmail());
			ps.setString(3, c.getPhno());
			ps.setString(4, c.getAbout());
			ps.setInt(5, c.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return f;

	}
	
	public boolean deleteContactById(int id) {
		boolean f=false;
		
		try {
			String sql="delete from contact where id=?";
			 PreparedStatement ps= conn.prepareStatement(sql);
			 ps.setInt(1,id);
			 int  i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
		
		
		
		
	}

	

}
