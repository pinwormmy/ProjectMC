package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import community.service.MessageListView;
import community.service.ServiceException;
import dao.CommunityDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.CommunityDTO;
import dto.MemberDTO;
import dto.ProductDTO;
import dto.ProductTypeDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class ProductService {
	private static ProductService instance = new ProductService();

	public static ProductService getInstance() {
		return instance;
	}

	private ProductService() {
	}

	public List<ProductDTO> showProductList() throws SQLException {
	    
        Connection conn = null;
        conn = ConnectionProvider.getConnection();
        ProductDAO productDAO = ProductDAO.getInstance();
        List<ProductDTO> productList = null;
        productList =productDAO.showProductList(conn);
       
        return productList;
    }
	
	public List<ProductTypeDTO> loadProductType() throws SQLException {
        
        Connection conn = null;
        conn = ConnectionProvider.getConnection();
        ProductDAO productDAO = ProductDAO.getInstance();
        List<ProductTypeDTO> productTypeList = null;
        productTypeList =productDAO.loadProductType(conn);
       
        return productTypeList;
    }
	
	public void submitProduct(ProductDTO productDTO) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ProductDAO productDAO = ProductDAO.getInstance();
            productDAO.submitProduct(conn, productDTO);
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
    }
}