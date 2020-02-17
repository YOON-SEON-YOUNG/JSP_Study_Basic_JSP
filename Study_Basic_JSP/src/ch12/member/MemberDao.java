package ch12.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	
	public static final int LOGIN_OK = 1;
	public static final int INCORRECT_PASSWD = 2;
	public static final int ID_NOT_FOUND = 3;
	
	private static MemberDao instance;
	private MemberDao() { /* singleton */ }
	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		try {
			// javax.naming.Context/InitailContext
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			// javax.sql.DataSource
			DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp"); 
			Connection conn = ds.getConnection();
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) try { rs.close(); } catch (Exception e) { }
		if (pstmt != null) try { pstmt.close(); } catch (Exception e) { }
		if (conn != null) try { conn.close(); } catch (Exception e) { }
	}
	
	// 회원 추가(가입)
	public boolean insertMember(MemberVo memberVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into member(id, passwd, name)"
					+ "   values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberVo.getId());
			pstmt.setString(2, memberVo.getPasswd());
			pstmt.setString(3, memberVo.getName());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return false;
	}
	
	// 사용자 체크 (로그인)
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select passwd from member"
					+ "   where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if(passwd.equals(dbPasswd)) {
					// 인증 성공
					return LOGIN_OK;
				} else {
					// 비밀번호 불일치
					return INCORRECT_PASSWD;
				}
			} else {
				// 해당 아이디 없음
				return ID_NOT_FOUND;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return 0;
	}
	
	// 중복체크
	public boolean checkId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select count(*) from member"
					+ "	  where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			if (count > 0 ) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return false;
	}
}
