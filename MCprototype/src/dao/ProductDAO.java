package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import dto.ProductDTO;
import dto.ProductTypeDTO;
import jdbc.JdbcUtil;

public class ProductDAO {
	private static ProductDAO productDAO = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return productDAO;
	}
	
	private ProductDAO() {}
	
	private ProductDTO makeProductFromResultSet(ResultSet rs) throws SQLException {
        ProductDTO productDTO = new ProductDTO();
        
        productDTO.setpId(rs.getInt("pId"));
        productDTO.setTypeCode(rs.getString("typeCode"));
        productDTO.setpName(rs.getString("pName"));
        productDTO.setPrice(rs.getInt("price"));
        productDTO.setQuantity(rs.getInt("quantity"));
        productDTO.setCount(rs.getInt("count"));
        productDTO.setBrand(rs.getString("brand"));
        productDTO.setRegDate(rs.getDate("regDate"));
        productDTO.setImage(rs.getString("image"));
        productDTO.setThumbnail(rs.getString("thumbnail"));  
        
        return productDTO;
    }
	
	private ProductTypeDTO makeProductTypeFromResultSet(ResultSet rs) throws SQLException {
	    ProductTypeDTO productTypeDTO = new ProductTypeDTO();
        
        productTypeDTO.setTypeCode(rs.getString("typeCode"));
        productTypeDTO.settName(rs.getString("tName"));
        productTypeDTO.setDescription(rs.getString("description"));
       
        return productTypeDTO;
    }
	
	public List<ProductDTO> showProductList(Connection conn) 
            throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement(
                    "select * from product " + 
                    "order by pId desc"); // 오라클엔 limit 기능 지원 안해서 오류뜸
            // limit문 빼버림
            // pstmt.setInt(1, firstRow - 1);
            // pstmt.setInt(2, endRow - firstRow + 1);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                List<ProductDTO> productList = new ArrayList<ProductDTO>();
                do {
                    productList.add(makeProductFromResultSet(rs));
                } while (rs.next());
                return productList;
            } else {
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

	public List<ProductTypeDTO> loadProductType(Connection conn) 
            throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            pstmt = conn.prepareStatement("select * from productType order by typecode asc");
                      
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                List<ProductTypeDTO> productTypeList = new ArrayList<ProductTypeDTO>();
                do {
                    productTypeList.add(makeProductTypeFromResultSet(rs));
                } while (rs.next());
                return productTypeList;
            } else {
                return Collections.emptyList();
            }
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
    }

    public void submitProduct(Connection conn, ProductDTO productDTO) throws SQLException {
        
        PreparedStatement pstmt = null;
        
        try {
            pstmt = conn.prepareStatement(
                    "insert into product" + 
                    "(pId, typeCode, pName, price, quantity, count, brand, thumbnail, image, regDate) " +
                    "values(pIDseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
          
            pstmt.setString(1, productDTO.getTypeCode());
            pstmt.setString(2, productDTO.getpName());
            pstmt.setInt(3, productDTO.getPrice());
            pstmt.setInt(4, productDTO.getQuantity());
            pstmt.setInt(5, 0);
            pstmt.setString(6, productDTO.getBrand()); 
            pstmt.setString(7, productDTO.getThumbnail()); 
            pstmt.setString(8, productDTO.getImage());             
            
            pstmt.executeUpdate();
            
        } finally {
            JdbcUtil.close(pstmt);
        }
        
    }
}
