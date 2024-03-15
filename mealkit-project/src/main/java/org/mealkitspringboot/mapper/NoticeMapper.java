package org.mealkitspringboot.mapper;

import org.mealkitspringboot.domain.NoticeVO;

import java.util.List;

public interface NoticeMapper {
   List<NoticeVO> getNoticeList(String search);

   int putInsert(NoticeVO noticeVO);                   // 등록
   NoticeVO getFreeBoardOne(int num);                  // 상세조회
   int updateFreeBoard(NoticeVO noticeVO);             // 수정
   int delFreeBoard(int NoNum);                          // 삭제

}
