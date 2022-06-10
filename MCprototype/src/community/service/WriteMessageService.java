package community.service;

import java.sql.Connection;
import java.sql.SQLException;

import community.dao.CommunityDAO;
import community.model.CommunityDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class WriteMessageService {
	private static WriteMessageService instance = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return instance;
	}

	private WriteMessageService() {
	}

	public void write(CommunityDTO communityDTO) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			CommunityDAO communityDAO = CommunityDAO.getInstance();
			communityDAO.insert(conn, communityDTO);
		} catch (SQLException e) {
			throw new ServiceException(
					"메시지 등록 실패: " + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

}