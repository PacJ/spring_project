package notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import notice.dto.NoticeDTO;
import notice.dto.PageDTO;

public class NoticeDaoImp implements NoticeDAO{
	
	private SqlSessionTemplate sqlSession;
	
	public NoticeDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	//게시글 목록
	@Override
	public int count() {
		return sqlSession.selectOne("board.count");
	}

	@Override
	public List<NoticeDTO> list(PageDTO pv) {
		return sqlSession.selectList("board.list", pv);
	}
	
	@Override
	public List<NoticeDTO> toplist() {
		return sqlSession.selectList("board.toplist");

	}
	
	//게시글 읽기
	@Override
	public NoticeDTO content(int num) {
		return sqlSession.selectOne("board.content", num);
	}
	
	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount", num);		
	}

	@Override
	public String getFile(int num) {
		return sqlSession.selectOne("board.getFile", num);
	}
	
	@Override
	public String getImg(int num) {
		return sqlSession.selectOne("board.getImg", num);
	}
	
	@Override
	public NoticeDTO preNext(int num) {
		return sqlSession.selectOne("board.preNext", num);
	}

	// 게시글 작성
	@Override
	public void save(NoticeDTO dto) {
		sqlSession.insert("board.save", dto);
		
	}

	//게시글 수정
	@Override
	public void update(NoticeDTO dto) {
		sqlSession.update("board.update", dto);
		
	}

	//게시글 삭제
	@Override
	public void delete(int num) {
		sqlSession.delete("board.delete", num);
		
	}

 
}
