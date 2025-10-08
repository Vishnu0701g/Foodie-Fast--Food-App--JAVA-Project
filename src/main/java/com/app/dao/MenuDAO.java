package com.app.dao;
import java.util.List;

import com.app.model.Menu;

public interface MenuDAO {
	public List<Menu> getAllMenu();
	public Menu getMenu(int menuId);
	public void addMenu(Menu Menu);
	public void updateMenu(Menu Menu);
	public void deleteMenu(int menuId);
	public List<Menu> getMenuByRestaurantID(int restaurantId);
}