package com.dakshabhi.order.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.servlet.http.Part;

import com.dakshabhi.common.db.QueryHelper;
import com.dakshabhi.order.dto.CustomerOrderDTO;
import com.dakshabhi.order.dto.CustomerOrderProductDto;

public class CustomerOrderDAO {

	public int insertOrderDetails(CustomerOrderDTO orderDTO) {
		int orderid = 0;
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "INSERT INTO qa_order (date_created, time_created, session_id, user_ip, first_name, last_name, "
					+ "company_name, phone_no, email, "
					+ "order_total_amount, notes,shipping_method,country,currency_code,quantity, product_id, product_price,g_keyword,gclid,for_us_government) "
					+ "VALUES (now(), now(), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)"; 
			System.out.println(sql);
			qh.addParam(orderDTO.getSessionId());
			qh.addParam(orderDTO.getUserIp());
			qh.addParam(orderDTO.getFirstName());
			qh.addParam(orderDTO.getLastName());
			qh.addParam(orderDTO.getCompanyName());
			qh.addParam(orderDTO.getPhoneNo());
			qh.addParam(orderDTO.getEmail());
			qh.addParam(orderDTO.getOrderTotalAmount());
			qh.addParam(orderDTO.getNotes()); 
			qh.addParam("Online Copy (Email)");
			qh.addParam(orderDTO.getCountry()); 
			qh.addParam(orderDTO.getCurrencyCode());
			qh.addParam(orderDTO.getQuantity());
			qh.addParam(orderDTO.getProduct_id());
			qh.addParam(orderDTO.getProduct_price());
			qh.addParam(orderDTO.getGkeyword());
			qh.addParam(orderDTO.getGclid());
			qh.addParam(orderDTO.getForUsGov());
			qh.runQuery(sql);
			orderid = qh.getLastGeneratedKey();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		return orderid;
	}

	public boolean updateOrderDetails(CustomerOrderDTO orderDTO) {
		QueryHelper qh = new QueryHelper();
		boolean status = false;
		try {
			String sql = "UPDATE qa_order "
					+ "SET user_ip=?, first_name=?, last_name=?, company_name=?, country = ?,currency_code = ?,"
					+ "phone_no=?, email=?, "
					+ "order_total_amount=?,  notes=?, quantity = ?,product_id = ?, product_price = ?, for_us_government = ? "
					+ "WHERE id=?"; 
			
			/* qh.addParam(orderDTO.getSessionId()); */
			qh.addParam(orderDTO.getUserIp());
			qh.addParam(orderDTO.getFirstName());
			qh.addParam(orderDTO.getLastName());
			qh.addParam(orderDTO.getCompanyName());
			qh.addParam(orderDTO.getCountry());
			qh.addParam(orderDTO.getCurrencyCode());
			qh.addParam(orderDTO.getPhoneNo());
			qh.addParam(orderDTO.getEmail());
			qh.addParam(orderDTO.getOrderTotalAmount());
			qh.addParam(orderDTO.getNotes()); 
			qh.addParam(orderDTO.getQuantity());
			qh.addParam(orderDTO.getProduct_id());
			qh.addParam(orderDTO.getProduct_price());
			qh.addParam(orderDTO.getForUsGov());
			qh.addParam(orderDTO.getId());
			qh.runQuery(sql);
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		return status;
	}

	public List<CustomerOrderProductDto> updateAddons(int orderId, String[] addonValues, String quantity) throws ClassNotFoundException, SQLException {
		QueryHelper qh = new QueryHelper();
		List<CustomerOrderProductDto> list = new ArrayList<>();
		try {
			String deleteSql = "DELETE FROM qa_order_products WHERE order_id = ? AND product_id = 0";
			qh.addParam(orderId);
			qh.runQuery(deleteSql);
			qh.releaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
			qh.releaseConnection();
		}
		for (String addon : addonValues) {
			String[] parts = addon.split("::");
			if (parts.length == 2) {
				String addonName = parts[0];
				double addonPrice = Double.parseDouble(parts[1]);
				CustomerOrderProductDto dto = new CustomerOrderProductDto();
				dto.setOrder_id(orderId);
				dto.setProduct_name(addonName);
				dto.setProduct_price(addonPrice);
				dto.setProduct_quantity(Integer.parseInt(quantity));
				list.add(dto);
				QueryHelper insertQh = new QueryHelper();
				try {
					String insertSql = "INSERT INTO qa_order_products (order_id, product_id, prodcut_name, product_price, product_quantity) VALUES (?, ?, ?, ?, ?)";
					insertQh.addParam(orderId);
					insertQh.addParam(0);
					insertQh.addParam(addonName);
					insertQh.addParam(addonPrice);
					insertQh.addParam(quantity);
					insertQh.runQuery(insertSql);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					insertQh.releaseConnection();
				}
			}
		}
		return list;
	}
	public List<CustomerOrderProductDto> updateAddons(int orderId, String[] addonValues) throws ClassNotFoundException, SQLException {
		QueryHelper qh = new QueryHelper();
		List<CustomerOrderProductDto> list = new ArrayList<>();
		try {
			String deleteSql = "DELETE FROM qa_order_products WHERE order_id = ? AND product_id = 0";
			qh.addParam(orderId);
			qh.runQuery(deleteSql);
			qh.releaseConnection();
		} catch (Exception e) {
			e.printStackTrace();
			qh.releaseConnection();
		}
		for (String addon : addonValues) {
			String[] parts = addon.split("::");
			if (parts.length == 3) {
				String addonName = parts[0];
				double addonPrice = Double.parseDouble(parts[1]);
				int quantity = Integer.parseInt(parts[2]);
				CustomerOrderProductDto dto = new CustomerOrderProductDto();
				dto.setOrder_id(orderId);
				dto.setProduct_name(addonName);
				dto.setProduct_price(addonPrice);
				dto.setProduct_quantity(quantity);
				list.add(dto);
				QueryHelper insertQh = new QueryHelper();
				try {
					String insertSql = "INSERT INTO qa_order_products (order_id, product_id, prodcut_name, product_price, product_quantity) VALUES (?, ?, ?, ?, ?)";
					insertQh.addParam(orderId);
					insertQh.addParam(0);
					insertQh.addParam(addonName);
					insertQh.addParam(addonPrice);
					insertQh.addParam(quantity);
					insertQh.runQuery(insertSql);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					insertQh.releaseConnection();
				}
			}
		}
		return list;
	}
	public void updateDocument(Part file, int orderId,String fileName) {
		if (file != null && file.getSize() > 0) {
            String uploadPath = "";

            try {
                InitialContext ic = new InitialContext();
                uploadPath = (String) ic.lookup("java:comp/env/documentpath");
            } catch (Exception e) {
                e.printStackTrace();
                return;
            }

            String uploadPathD = uploadPath + File.separator + orderId;
            File directory = new File(uploadPathD);

            if (!directory.exists() && !directory.mkdirs()) {
                return;
            }

            File fileToSave = new File(directory, fileName);

            try (InputStream is = file.getInputStream();
                 FileOutputStream fos = new FileOutputStream(fileToSave)) {

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = is.read(buffer)) != -1) {
                    fos.write(buffer, 0, bytesRead);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
            QueryHelper qh = new QueryHelper();
            try {
            	String sqlstr = "SELECT * FROM qa_order_documents WHERE order_id = ? and document_name = ?";
            	qh.addParam(orderId);
            	qh.addParam(fileName);
            	ResultSet rs = qh.runQueryStreamResults(sqlstr);
            	if(!rs.next()) {
            		qh.clearParams();
            		String sql = "INSERT INTO qa_order_documents (order_id, document_name) VALUES(?, ?);";
                	qh.addParam(orderId);
                	qh.addParam(fileName);
                	qh.runQuery(sql);
            	}
            	
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				qh.releaseConnection();
			}
        } 
		
	}
	public void deleteFileAndDBRecord(int orderId, String filename) {
	    String uploadPath = "";
	    try {
	        InitialContext ic = new InitialContext();
	        uploadPath = (String) ic.lookup("java:comp/env/documentpath");
	    } catch (Exception e) {
	        e.printStackTrace();
	        return;
	    }

	    String filePath = uploadPath + File.separator + orderId + File.separator + filename;
	    File file = new File(filePath);
	    if (file.exists()) {
	        file.delete(); 
	    }

	    QueryHelper qh = new QueryHelper();
	    try {
	        String sql = "DELETE FROM qa_order_documents WHERE order_id = ? AND document_name = ?";
	        qh.addParam(orderId);
	        qh.addParam(filename);
	        qh.runQuery(sql);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        qh.releaseConnection();
	    }
	}

	public String getUploadedDocuemnt(int orderId) {
	    QueryHelper qh = new QueryHelper();
	    String filename = "";
	    try {
	        String sql = "SELECT document_name FROM qa_order_documents WHERE order_id = " + orderId;
	        ResultSet rs = qh.runQueryStreamResults(sql);

	        List<String> fileList = new ArrayList<>();
	        while (rs.next()) {
	            fileList.add(rs.getString("document_name"));
	        }

	        filename = String.join(",", fileList);
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        qh.releaseConnection();
	    }
	    return filename;
	}


	public void updateTotalAmount(int orderId, String total_amount, String quantity) {
		QueryHelper qh = new QueryHelper();
		try {
			String str = "UPDATE qa_order set order_total_amount = ? , quantity = ? where id = ?";
			qh.addParam(total_amount);
			qh.addParam(Integer.parseInt(quantity));
			qh.addParam(orderId);
			qh.runQuery(str);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		
	}

	public String getProductName(int productId) {
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "SELECT * FROM qa_items WHERE item_id = "+productId+" and is_deleted = 0";
			ResultSet rs = qh.runQueryStreamResults(sql);
			if(rs.next()) {
				String item_name = rs.getString("item_name");
				if(item_name.equalsIgnoreCase("Certified Copy of Passport Id")) {
					item_name = "Certified Copy of Passport/ID";
				}
				return item_name;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		return "";
	}

	public CustomerOrderDTO getOrderDetails(String sessionid) {
		CustomerOrderDTO orderDTO = new CustomerOrderDTO();
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "SELECT * FROM qa_order WHERE is_deleted = 0 AND session_id = '"+sessionid+"'";
			ResultSet rs = qh.runQueryStreamResults(sql);
			if(rs.next()) {
				orderDTO.setSessionId(rs.getString("session_id"));
				orderDTO.setFirstName(rs.getString("first_name"));
				orderDTO.setLastName(rs.getString("last_name"));
				orderDTO.setCompanyName(rs.getString("company_name"));
				orderDTO.setPhoneNo(rs.getString("phone_no"));
				orderDTO.setEmail(rs.getString("email"));
				orderDTO.setNotes(rs.getString("notes"));
				orderDTO.setOrderTotalAmount(rs.getDouble("order_total_amount"));
				orderDTO.setId(rs.getInt("id")); 			
				orderDTO.setCurrencyCode(rs.getString("currency_code"));
				int roundAmount = (int) (rs.getDouble("order_total_amount") * 100);
				orderDTO.setOrderTotalAmountRound(roundAmount);
				orderDTO.setCountry(rs.getString("country"));
				orderDTO.setQuantity(rs.getInt("quantity"));
				orderDTO.setProduct_id(rs.getInt("product_id"));
				orderDTO.setProduct_price(rs.getDouble("product_price"));
				orderDTO.setProduct_name(getProductName(rs.getInt("product_id")));
				orderDTO.setDocument_name(getUploadedDocuemnt(rs.getInt("id")));
				orderDTO.setShippingCost(rs.getDouble("shipping_cost"));
				orderDTO.setShippingMethod(rs.getString("shipping_method"));
				return orderDTO;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		return orderDTO;
	}

	public List<CustomerOrderProductDto> getOrderProductDetails(int id) {
		List<CustomerOrderProductDto> list = new ArrayList<>();
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "SELECT * FROM qa_order_products WHERE order_id ="+id;
			ResultSet rs = qh.runQueryStreamResults(sql);
			while (rs.next()) {
				CustomerOrderProductDto dto = new CustomerOrderProductDto();
				dto.setOrder_id(rs.getInt("order_id"));
				dto.setProduct_name(rs.getString("prodcut_name"));
				dto.setProduct_price(rs.getDouble("product_price"));
				dto.setProduct_quantity(rs.getInt("product_quantity"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			qh.releaseConnection();
		}
		return list;
	}
}
