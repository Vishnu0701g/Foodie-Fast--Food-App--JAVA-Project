package com.app.daoimplementation;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.app.dao.MenuDAO;
import com.app.model.Menu;
import com.app.util.DBConnection;

public class MenuDAOImpl implements MenuDAO{
	Connection connection;
	private String GET_ALL_MENUS_QUERY = "SELECT * from menu";
	private String GET_MENU_QUERY = "SELECT * from menu where menuId=?";
	private String GET_ALL_MENUS_BY_RESTAURANTSID_QUERY = "SELECT * from menu where restaurantId=? ";
	private String INSERT_MENU_QUERY = "INSERT into menu (menuId,restaurantId,itemName,description,price,isAvailable,ratings,imagepath)"
			+ " values (?,?,?,?,?,?,?,?)";
	private String UPDATE_MENU_QUERY = "UPDATE menu SET restaurantId = ?,itemName = ? ,description = ?,price = ?,isAvailable = ? ,ratings=?,imagepath=? where menuid = ?" ;
	private String DELETE_MENU_QUERY = "DELETE FROM menu WHERE menuid = ?";

	public MenuDAOImpl() {
		connection = DBConnection.getConnection();
		 
	}

	@Override
	public List<Menu> getAllMenu() {
		List<Menu> menus=new  ArrayList<Menu>();
		 try (PreparedStatement pstmt = connection.prepareStatement(GET_ALL_MENUS_QUERY);)

			{
			 
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				Menu menu=new Menu();
				menu.setMenuId(res.getInt("menuId"));
				menu.setRestaurantId(res.getInt("restaurantId"));
				menu.setItemName(res.getString("itemName"));
				menu.setDescription(res.getString("description"));
				menu.setPrice(res.getInt("price"));
				menu.setIsAvailable(res.getBoolean("isAvailable"));
				menu.setRatings(res.getDouble("ratings"));
				menu.setImagePath(res.getString("imagepath"));
				menus.add(menu);				
			}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return menus;
	}

	@Override
	public Menu getMenu(int menuId) {
		Menu menu=new Menu();
		try (PreparedStatement pstmt = connection.prepareStatement(GET_MENU_QUERY);)

		{
			pstmt.setInt(1, menuId);
		 
		ResultSet res = pstmt.executeQuery();
		while(res.next()) {
			menu.setMenuId(res.getInt("menuId"));
			menu.setRestaurantId(res.getInt("restaurantId"));
			menu.setItemName(res.getString("itemName"));
			menu.setDescription(res.getString("description"));
			menu.setPrice(res.getInt("price"));
			menu.setIsAvailable(res.getBoolean("isAvailable"));
			menu.setRatings(res.getDouble("ratings"));
			menu.setImagePath(res.getString("imagepath"));
							
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return menu;
		
	}

	@Override
	public void addMenu(Menu menu) {
		try (PreparedStatement pstmt = connection.prepareStatement(INSERT_MENU_QUERY);)
		{
			pstmt.setInt(1, menu.getMenuId());
			pstmt.setInt(2,menu.getRestaurantId());
			pstmt.setString(3,menu.getItemName());
			pstmt.setString(4,menu.getDescription());
			pstmt.setInt(5,menu.getPrice());
			pstmt.setBoolean(6,menu.getIsAvailable());
			pstmt.setDouble(7,menu.getRatings());
			pstmt.setString(8,menu.getImagePath());
			int res = pstmt.executeUpdate();
			System.out.println(res);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMenu(Menu menu) {
		try (PreparedStatement pstmt = connection.prepareStatement(UPDATE_MENU_QUERY);)
		{
			pstmt.setInt(1,menu.getRestaurantId());
			pstmt.setString(2,menu.getItemName());
			pstmt.setString(3,menu.getDescription());
			pstmt.setInt(4,menu.getPrice());
			pstmt.setBoolean(5,menu.getIsAvailable());
			pstmt.setDouble(6,menu.getRatings());
			pstmt.setString(7,menu.getImagePath());
			pstmt.setInt(8, menu.getMenuId());
			int res = pstmt.executeUpdate();
			System.out.println(res);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteMenu(int menuId) {
		try (
		         PreparedStatement pstmt = connection.prepareStatement(DELETE_MENU_QUERY)) {
		        
		        pstmt.setInt(1, menuId);

		        int res = pstmt.executeUpdate();
		        System.out.println(res);

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		
	}

	@Override
	public List<Menu> getMenuByRestaurantID(int restaurantId) {
		List<Menu> menus=new ArrayList<Menu>();
		 try (PreparedStatement pstmt = connection.prepareStatement(GET_ALL_MENUS_BY_RESTAURANTSID_QUERY);)
			{
			 pstmt.setInt(1,restaurantId );
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				Menu menu=new Menu();
				menu.setMenuId(res.getInt("menuId"));
				menu.setRestaurantId(res.getInt("restaurantId"));
				menu.setItemName(res.getString("itemName"));
				menu.setDescription(res.getString("description"));
				menu.setPrice(res.getInt("price"));
				menu.setIsAvailable(res.getBoolean("isAvailable"));
				menu.setRatings(res.getDouble("ratings"));
				menu.setImagePath(res.getString("imagepath"));
				menus.add(menu);				
			}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return menus;
		
	}

	
	
	
}
