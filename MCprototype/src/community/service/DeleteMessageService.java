package community.service;

import java.sql.Connection;
import java.sql.SQLException;
import dao.CommunityDAO;
import dto.CommunityDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;


// 커뮤니티(자유게시판) 서비스 통합시키기.근데 이거 안하고 프로젝트 돌입할듯

public class DeleteMessageService {

	private static DeleteMessageService instance = new DeleteMessageService();

	public static DeleteMessageService getInstance() {
		return instance;
	}

	private DeleteMessageService() {
	}

	public void deleteMessage(int messageId, String inputedPw) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			CommunityDAO communityDAO = CommunityDAO.getInstance();
			CommunityDTO communityDTO = communityDAO.select(conn, messageId);
			if (communityDTO == null) {
				throw new MessageNotFoundException("메시지 없음 오류!!");
			}
			if (!communityDTO.getPostPw().equals(inputedPw)) {
				throw new InvalidPassowrdException("비밀번호 오류!!");
			}
			communityDAO.delete(conn, messageId);

			conn.commit();
		} catch (SQLException ex) {
			JdbcUtil.rollback(conn);
			throw new ServiceException("삭제 실패:" + ex.getMessage(), ex);
		} catch (InvalidPassowrdException | MessageNotFoundException ex) {
			JdbcUtil.rollback(conn);
			throw ex;
		} finally {
			JdbcUtil.close(conn);
		}
	}
}