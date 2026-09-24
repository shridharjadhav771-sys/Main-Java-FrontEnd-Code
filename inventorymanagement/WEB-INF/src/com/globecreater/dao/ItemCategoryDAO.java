package com.globecreater.dao;

import com.globecreater.dto.ItemCategoryDTO;

public class ItemCategoryDAO {
	
	public ItemCategoryDTO getCategorylist(int item_category_id,String category_name,int category_code,int item_group,String is_active) {
	
		ItemCategoryDTO Categorylist = null;
		
		String sql = "SELECT * from gb_mst_item_category WHERE category_name = ? AND category_code = ? ";
		
		
		
		return Categorylist;
		
		
	}

}
