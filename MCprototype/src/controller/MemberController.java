package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MemberDAO;

// 아직 수정중

public class MemberController extends HttpServlet{

    private static final long serialVersionUID = 1L;
    
    MemberDAO memberDAO;
    
    
    public void init(ServletConfig config) throws ServletException{
        
        //memberDAO = new MemberDAO(); 여기서 서비스로 연결해야함
       
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doHandler(request, response);
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doHandler(request, response);
    }
 
    
    private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        // List<MemberVO> membersList = memberDAO.listMembers();            //요청에 대한 회원 정보를 조회함.
        
        // request.setAttribute("membersList", membersList);        //조회한 회원 정보를 request에 바인딩함.
        
        //컨트롤러에서 해당 결과를 표시할 JSP로 포워딩함.
        RequestDispatcher dispatcher = request.getRequestDispatcher("/member/listmembers.jsp");
        dispatcher.forward(request, response);
        
    }

}
