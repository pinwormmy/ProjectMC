package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDAO;
import member.model.MemberDTO;

public class MemberService {
	private static MemberService instance = new MemberService();

	public static MemberService getInstance() {
		return instance;
	}

	private MemberService() {
	}

	public void submitSignUp(MemberDTO memberDTO) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.submitSignUp(conn, memberDTO);
		} catch (SQLException e) {
		    JdbcUtil.printSQLException(e);
			JdbcUtil.close(conn);
		}
	}
	
	public boolean checkUniqueId(String inputedId) {
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            MemberDAO memberDAO = MemberDAO.getInstance();
            return memberDAO.checkUniqueId(conn, inputedId);
        } catch (SQLException e) {
            JdbcUtil.printSQLException(e);
            JdbcUtil.close(conn);
        }
        System.out.println("중복확인 제대로 안된듯??");
        return false;
    }

}