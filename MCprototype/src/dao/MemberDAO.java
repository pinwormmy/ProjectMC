package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.MemberDTO;
import dto.ProductDTO;
import jdbc.JdbcUtil;

public class MemberDAO {
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	
	private MemberDAO() {}
	
	private MemberDTO makeMemberFromResultSet(ResultSet rs) throws SQLException {
	    MemberDTO memberDTO = new MemberDTO();
        
	    memberDTO.setmNo(rs.getInt("mNo"));
	    memberDTO.setmId(rs.getString("mId"));
	    memberDTO.setPw(rs.getString("pw"));
	    memberDTO.setmName(rs.getString("mName"));
	    memberDTO.setPhone(rs.getString("phone"));
	    memberDTO.setAddress(rs.getString("address"));
	    memberDTO.setEmail(rs.getString("email"));
	    memberDTO.setRegDate(rs.getDate("regDate"));
	    memberDTO.setmLevel(rs.getInt("mLevel"));        
        
        return memberDTO;
    }
	
	public int submitSignUp(Connection conn, MemberDTO memberDTO) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into member " + 
					"(mNO, mId, pw, mname, phone, address, email, regDate) values (mno_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)");
			
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
    
    public MemberDTO login(Connection conn, String id, String pw) throws SQLException {
        
        ResultSet resultSet;
        PreparedStatement pstmt = null;        
        
        pstmt = conn.prepareStatement("select * from member where mId=? and pw=?");
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        resultSet =  pstmt.executeQuery();   
        
        if (resultSet.next()) {
            return makeMemberFromResultSet(resultSet);      
        } else {
            return null;
        }
    }






	


}
