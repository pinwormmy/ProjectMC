package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberService;
import service.ProductService;

public class MemberController extends HttpServlet{    

    private static final long serialVersionUID = 1L;
    
    MemberService memberService;


    public void init(ServletConfig config) throws ServletException{
        
        memberService = MemberService.getInstance();  
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doHandler(request, response);
    }
 
    
    @SuppressWarnings("null")
    private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      
        String fromPath = request.getRequestURI().substring(request.getContextPath().length());
        String toPath;
        
        if(fromPath.equals("/login.gg")) {
            
            String id = request.getParameter("mId");
            String pw = request.getParameter("pw");
            
            HttpSession session = request.getSession();
            
            MemberDTO member = new MemberDTO();
            
            member = memberService.login(id, pw);            
            
            if(member != null){
                session.setAttribute("member", member);
                toPath = "home";
            }else{                
                request.setAttribute("msg", "로그인 오류!! 아디와 비번 확인해주세요~!");
                request.setAttribute("url", "index.jsp");
                toPath = "/alert.jsp";
            }            
            
        }else if(fromPath.equals("/signUp.gg")) {
            toPath = "/signUp.jsp";
        }else {
            toPath = "/error.jsp";
        }
                
        RequestDispatcher dispatcher = request.getRequestDispatcher(toPath);
        dispatcher.forward(request, response);
    }
}
