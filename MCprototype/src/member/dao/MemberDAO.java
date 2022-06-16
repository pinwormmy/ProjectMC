package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import community.model.CommunityDTO;
import jdbc.JdbcUtil;
import member.model.MemberDTO;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private MemberDAO() {}
	
	public int submitSignUp(Connection conn, MemberDTO memberDTO) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into member " + 
					"(mNO, mId, pw, mname, phone, address, email, regDate) values (mno_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
			// 쿼리문 수정해야함
			pstmt.setString(1, memberDTO.getmId());
			pstmt.setString(2, memberDTO.getPw());
			pstmt.setString(3, memberDTO.getmName());
			pstmt.setString(4, memberDTO.getPhone());
			pstmt.setString(5, memberDTO.getAddress());
			pstmt.setString(6, memberDTO.getEmail()); 
			
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

    public boolean checkUniqueId(Connection conn, String inputedId) throws SQLException {
        
        ResultSet resultSet;
        PreparedStatement pstmt = null;
              
        pstmt = conn.prepareStatement("select * from member where mId=?");
        pstmt.setString(1, inputedId);
        resultSet =  pstmt.executeQuery();      
        
        if(resultSet.next())
            return false;
        else
            return true;    
    }






	


}
