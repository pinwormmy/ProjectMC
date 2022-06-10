package community.dao;

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

public class CommunityDAO {
	private static CommunityDAO communityDAO = new CommunityDAO();
	public static CommunityDAO getInstance() {
		return communityDAO;
	}
	
	private CommunityDAO() {}
	
	public int insert(Connection conn, CommunityDTO communityDTO) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"insert into community " + 
					"(mId, postPw, content) values (?, ?, ?)");
			pstmt.setString(1, communityDTO.getmId());
			pstmt.setString(2, communityDTO.getPostPw());
			pstmt.setString(3, communityDTO.getContent());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public CommunityDTO select(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from community where cNo = ?");
			pstmt.setInt(1, messageId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makeMessageFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	private CommunityDTO makeMessageFromResultSet(ResultSet rs) throws SQLException {
		CommunityDTO communityDTO = new CommunityDTO();
		communityDTO.setcNo(rs.getInt("message_id"));
		communityDTO.setmId(rs.getString("guest_name"));
		communityDTO.setPostPw(rs.getString("password"));
		communityDTO.setContent(rs.getString("message"));
		return communityDTO;
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from community");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<CommunityDTO> selectList(Connection conn, int firstRow, int endRow) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(
					"select * from community " + 
					"order by cNo desc limit ?, ?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<CommunityDTO> messageList = new ArrayList<CommunityDTO>();
				do {
					messageList.add(makeMessageFromResultSet(rs));
				} while (rs.next());
				return messageList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, int messageId) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(
					"delete from commnunity where cNo = ?");
			pstmt.setInt(1, messageId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

}
