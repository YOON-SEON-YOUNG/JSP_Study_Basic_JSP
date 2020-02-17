package ch12.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemeberDao2 {
	
	public static final int LOGIN_OK = 1;
	public static final int INCORRECT_PASSWD = 2;
	public static final int ID_NOT_FOUND = 3;
	
	
	private static MemeberDao2 instance;
	
	private MemeberDao2() { /* singleton */ }
	public static MemeberDao2 getInstance() {
		if (instance == null) {
			instance = new MemeberDao2();
		}
		return instance;
	} // getInstance
	
	private Connection getConnection() {
		try {
			// javax.naming.Context, InitialContext
			Context initCtx = new InitialContext();
			Context envCts = (Context)initCtx.lookup("java:comp/env");	// 정해진 이름
			
			// javax.sql.DataSource
			DataSource ds = (DataSource)envCts.lookup("jdbc/basicjsp");
			Connection conn = ds.getConnection();
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	} // getConnection
	
	private void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs)	{
		if (rs != null) 	try {rs.close();}		catch (Exception e) {	}
		if (pstmt != null) 	try {pstmt.close();}	catch (Exception e) {	}
		if (conn != null)	try {conn.close();}		catch (Exception e) {	}
	} // closeAll
	
	// 회원 추가(가입)
	public boolean insertMember(MemberVo memberVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			String sql = "insert into member(id, passwd, name)"
					+ "   values(?,?,?)";		
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
		} // finally
		return false;
	} // insertMember
	
	// 사용자 체크 (로그인)
	public int userCheck(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select passwd from member"
					+ "   where id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString("passwd");
				if (passwd.equals(dbPasswd)) {
					// 인증 성공
					return LOGIN_OK;
				} else {
					// 비밀번호 불일치
					return INCORRECT_PASSWD;
				}
			} else {
				// 해당 아이디 없음
				return ID_NOT_FOUND;
			} // else
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		} // finally
		return 0;
	} // userCheck
	
	
	// 아이디 중복체크
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
