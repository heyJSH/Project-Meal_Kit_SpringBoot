package org.mealkitspringboot.service;

import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.NoticeVO;
import org.mealkitspringboot.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public List<NoticeVO> getNoticeList(String search){
        List<NoticeVO> noticeVOList = null;

        if(search == null){
            noticeVOList = noticeMapper.getNoticeList(search);
        } else{ //
            if(!search.equals("")){
                noticeVOList = noticeMapper.getNoticeList(search);
            }
        }
        return noticeVOList;
    }

    @Override
    public int putInsert(int noNum, String title, String content, List<String> fileNameArray) {
        NoticeVO NoticeVO = new NoticeVO();
        NoticeVO.setNoNum(NoticeVO.getNoNum());
        NoticeVO.setTitle(NoticeVO.getTitle());
        NoticeVO.setContent(NoticeVO.getContent());

        if (fileNameArray != null) {
            //리스트의 크기(즉, 리스트에 저장된 요소의 수)를 계산하고, 그 값을 fileNameSize 변수에 저장
            int fileNameSize = fileNameArray.size();
            if(fileNameSize >= 1) {
                NoticeVO.setFile1Path(fileNameArray.get(0));
            }
            if(fileNameSize >= 2) {
                NoticeVO.setFile2Path(fileNameArray.get(1));
            }
        }

        int rtn = noticeMapper.putInsert(NoticeVO);       // noticeMapper에서 가져오기
        return rtn;
    }

    // 수정
    @Override
    public  NoticeVO selectFreeBoardOne(int noNum){
        return noticeMapper.getFreeBoardOne(noNum);
    }

    @Override
    public int updateFreeBoard(String title, String content, String file1Path, String file2Path) {
        NoticeVO NoticeVO = new NoticeVO();
        NoticeVO.setTitle(title);
        NoticeVO.setContent(content);

        if (!file1Path.isEmpty())
            NoticeVO.setFile1Path(file1Path);
        if (!file2Path.isEmpty())
            NoticeVO.setFile2Path(file2Path);

        return noticeMapper.updateFreeBoard(NoticeVO);
    }

    @Override
    public int delTestBoard(int noNum) {
        return noticeMapper.delFreeBoard(noNum);
    }
}

