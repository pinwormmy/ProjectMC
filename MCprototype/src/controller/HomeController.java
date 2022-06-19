package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dto.ProductDTO;
import service.ProductService;

public class HomeController extends HttpServlet{    
    
    private static final long serialVersionUID = 1L;
    
    ProductService productService;


    public void init(ServletConfig config) throws ServletException{
        
        productService = ProductService.getInstance();     
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }
 
    
    private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        
        try {
            productList = productService.showProductList();
        } catch (SQLException e) {
            e.printStackTrace();
        }        
        request.setAttribute("productList", productList);
  
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
