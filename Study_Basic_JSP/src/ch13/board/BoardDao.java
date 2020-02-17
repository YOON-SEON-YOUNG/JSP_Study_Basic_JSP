package ch13.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	
	private static BoardDao instance;
	
	private BoardDao() { /* singleton */ }
	public static BoardDao getInstance() {
		if (instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
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
	
	// 글 입력
	public void insertArticle(BoardVo boardVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into board (num, writer, email, subject, passwd, "
					+ "						 ref, re_step, re_level, content, ip, file_name)"
					+ "   values (seq_board.nextval, ?, ?, ?, ?,"
					+ "			  seq_board.nextval, 0, 0, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getWriter());			
			pstmt.setString(2, boardVo.getEmail());
			pstmt.setString(3, boardVo.getSubject());
			pstmt.setString(4, boardVo.getPasswd());
			pstmt.setString(5, boardVo.getContent());
			pstmt.setString(6, boardVo.getIp());
			pstmt.setString(7, boardVo.getFile_name());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	// 글 목록
	public ArrayList<BoardVo> getArticles(PagingDto pagingDto, SearchDto searchDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String searchType = searchDto.getSearchType();
		String keyword = searchDto.getKeyword();

		
		try {
			conn = getConnection();
			String sql = "select *"
					+ "     from (select rownum rnum, a.*" 
					+ "           from (select * from board";
			if (searchType != null && !searchType.equals("")
					&& keyword != null && !keyword.equals("")) {
					sql +=	  "			where " + searchDto.getSearchType() 
							+ "				 like '%' || ? || '%'";
			}
			sql +=	  "                 order by ref desc, re_step asc) a)" 
					+ "     where rnum >= ? and rnum <= ?";
			pstmt = conn.prepareStatement(sql);
			int i = 0;
			if (searchType != null && !searchType.equals("")
					&& keyword != null && !keyword.equals("")) {
				pstmt.setString(++i, searchDto.getKeyword());
			}
			pstmt.setInt   (++i, pagingDto.getStartRow());
			pstmt.setInt   (++i, pagingDto.getEndRow());
			rs = pstmt.executeQuery();
			ArrayList<BoardVo> list = new ArrayList<>();
			while (rs.next()) {
				int num = rs.getInt("num");
				String subject = rs.getString("subject");
				String writer = rs.getString("writer");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int re_level = rs.getInt("re_level");
				String ip = rs.getString("ip");
				String file_name = rs.getString("file_name");
				
				BoardVo boardVo = new BoardVo();
				boardVo.setNum(num);
				boardVo.setSubject(subject);
				boardVo.setWriter(writer);
				boardVo.setReg_date(reg_date);
				boardVo.setReadcount(readcount);
				boardVo.setRe_level(re_level);
				boardVo.setIp(ip);
				boardVo.setFile_name(file_name);
				list.add(boardVo);

			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
		return null;
	}
	
	// 전체 게시글 수
	public int getCount(SearchDto searchDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String searchType = searchDto.getSearchType();
		String keyword = searchDto.getKeyword();
		
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from board";
			if (!searchType.equals("") && !keyword.equals(""))	{
				sql += " where" + searchType + " like '%' || ? || '%'";
			}
			pstmt = conn.prepareStatement(sql);
			if (!searchType.equals("") && !keyword.equals(""))	{
				pstmt.setString(1, keyword);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				return count;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return 0;
	}
	
	// 글 1개 얻기
	public BoardVo getOneArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false); // 트랜잭션 시작
			String sql2 = "update board set"
					+ "			readcount = readcount + 1" // 조회수 증가
					+ "    where num = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
			
			String sql = "select * from board"
					+ "   where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String writer = rs.getString("writer");
				String subject = rs.getString("subject");
				String email = rs.getString("email");
				String content = rs.getString("content");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				
				BoardVo boardVo = new BoardVo();
				boardVo.setNum(num);
				boardVo.setWriter(writer);
				boardVo.setSubject(subject);
				boardVo.setEmail(email);
				boardVo.setContent(content);
				boardVo.setRef(ref);
				boardVo.setRe_step(re_step);
				boardVo.setRe_level(re_level);
				
				conn.commit(); // 트랜잭션 수행
				
				return boardVo;
			}
		} catch (Exception e) {
			e.printStackTrace();
			try { 
				conn.rollback(); 
			} catch (SQLException e1) { 
				e1.printStackTrace();
			}
		} finally {
			closeAll(conn, pstmt, rs);
		}
		return null;
	}
	
	// 글 수정하기
	public void updateArticle(BoardVo boardVo) {
		System.out.println(boardVo);
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update board set"
					+ "			writer = ?,"
					+ "			subject = ?,"
					+ "			email = ?,"
					+ "			content = ?"
					+ "   where num = ? and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getWriter());
			pstmt.setString(2, boardVo.getSubject());
			pstmt.setString(3, boardVo.getEmail());
			pstmt.setString(4, boardVo.getContent());
			pstmt.setInt   (5, boardVo.getNum());
			pstmt.setString(6, boardVo.getPasswd());
			int count = pstmt.executeUpdate();
			System.out.println("count:" + count);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	// 글 삭제하기
	public void deleteArticle(int num, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "delete from board"
					+ "   where num = ?"
					+ "   and passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	// 답글 달기
	public void reply(BoardVo boardVo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			
			String sql2 = "update board set"
					+ "        re_step = re_step + 1"
					+ "    where re_step > ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, boardVo.getRe_step());
			pstmt2.executeUpdate();
			
			
			String sql = "insert into board (num, writer, email, subject, passwd, "
					+ "						 ref, re_step, re_level, content, ip)"
					+ "   values (seq_board.nextval, ?, ?, ?, ?,"
					+ "			  ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardVo.getWriter());
			pstmt.setString(2, boardVo.getEmail());
			pstmt.setString(3, boardVo.getSubject());
			pstmt.setString(4, boardVo.getPasswd());
			pstmt.setInt   (5, boardVo.getRef());
			pstmt.setInt   (6, boardVo.getRe_step() + 1);
			pstmt.setInt   (7, boardVo.getRe_level() + 1);
			pstmt.setString(8, boardVo.getContent());
			pstmt.setString(9, boardVo.getIp());
			pstmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			closeAll(conn, pstmt, null);
		}
	}

}
