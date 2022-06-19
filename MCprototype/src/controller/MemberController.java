package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.ProductService;

public class MemberController extends HttpServlet{    

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
   
      
        String fromPath = request.getRequestURI().substring(request.getContextPath().length());
        String toPath;
        
        if(fromPath.equals("/login.gg")) {
            System.out.println("아직 한창 미완성이지만 작동했냐?");
            toPath = "home";
        }else if(fromPath.equals("/signUp.gg")) {
            toPath = "/signUp.jsp";
        }else {
            toPath = "/error.jsp";
        }
                
        RequestDispatcher dispatcher = request.getRequestDispatcher(toPath);
        dispatcher.forward(request, response);
    }
}
