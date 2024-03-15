package org.mealkitspringboot.service;

import org.mealkitspringboot.domain.NoticeVO;

import java.util.List;

public interface NoticeService {
    List<NoticeVO> getNoticeList(String search);

    int putInsert(int noNum, String title, String content, List<String> fileNameArray);

    NoticeVO selectFreeBoardOne(int noNum);         // 상세조회

    int updateFreeBoard(String title,
                        String content,
                        String file1Path,
                        String file2Path);

    int delTestBoard(int noNum);                      // 삭제
}




