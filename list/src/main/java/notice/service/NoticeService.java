package notice.service;

import java.util.List;

import notice.dto.NoticeDTO;
import notice.dto.PageDTO;

public interface NoticeService {
	
	//게시글 목록 조회
	public int countProcess(); //게시글 총 갯수
	public List<NoticeDTO> listProcess(PageDTO pv); //게시글목록
	public List<NoticeDTO> toplistProcess(); //고정게시글(fix=='Y')
	
	//게시글 읽기
	public NoticeDTO contentProcess(int num); //게시글 내용
	public NoticeDTO preNextProcess(int num); //이전글, 다음글
	public String fileSelectprocess(int num); //첨부파일이름
	
	//게시글 작성
	public void insertProcess(NoticeDTO dto);
	
	//게시글 수정(내용불러오기)
	public NoticeDTO updateSelectProcess(int num);
	//게시글 수정처리+첨부파일+사진첨부변경
	public void updateProcess(NoticeDTO dto, String urlpath, String urlpathImg);
	
	//게시글 삭제
	public void deleteProcess(int num, String urlpath, String urlpathImg);
	
}
