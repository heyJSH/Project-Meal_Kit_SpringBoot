package org.mealkitspringboot.controller;

import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.domain.NoticeVO;
import org.mealkitspringboot.mapper.NoticeMapper;
import org.mealkitspringboot.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


@Controller
@Log4j
public class NoticeController {
    @Autowired
    private NoticeService noticeService;

    //검색
    @GetMapping("/notice")
    public String notice(
            @RequestParam(value = "search", required = false) String search, Model model){
        List<NoticeVO> noticeVOList = noticeService.getNoticeList(search);

        model.addAttribute("noticeVOList", noticeVOList);
        model.addAttribute("search", search);
        return "/notice/notice";
    }

    // 등록
    @GetMapping("noticeInsertForm")
    public String noticeInsertForm(){
        return "/notice/noticeInsertForm";
    }

    @PostMapping("/noticeInsert")      // 서버 주소
    public String noticeInsert(
            MultipartFile[] fileContent,
            @RequestParam("noNum") int noNum,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            RedirectAttributes rttr
    ) {
        // 파일 업로드 추가 처리
        String uploadFolder = "D:\\spring1\\mealkit - 복사본\\src\\main\\resources\\static\\upload-files";

        List<String> fileNameArray = new ArrayList<>();
        for (MultipartFile multipartFile : fileContent) {

            fileNameArray.add(multipartFile.getOriginalFilename());

            // 실제 위의 uploadFolder 위치에 파일 저장
            File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                log.error(e.getMessage());
            } // end catch
        } // end for

        // 실제 DB에 텍스트 데이터 저장
        int rtn = noticeService.putInsert(noNum, title, content, fileNameArray);
        rttr.addFlashAttribute("insertSuccessCount", rtn);

        return "redirect:/notice/notice";     // 파일 주소
    }

    // 수정
    @GetMapping("/noticeUpdateForm")
    public String noticeInsertForm(@RequestParam("noNum") int noNum, Model model) {
        NoticeVO noticeVO = noticeService.selectFreeBoardOne(noNum);
        model.addAttribute("freeBoard", noticeVO);

        return "/notice/noticeUpdateForm";
    }

    @PostMapping("/noticeUpdate")
    public String noticeUpdate(
            MultipartFile[] fileContent,
            @RequestParam("title") String title,
            @RequestParam("content") String content,
            RedirectAttributes rttr
    ) {
        // 파일 업로드 수정 처리
        int rtn = noticeService.updateFreeBoard(
                title,
                content,
                fileContent[0].getOriginalFilename(),
                fileContent[1].getOriginalFilename()
        );
        rttr.addFlashAttribute("updateSuccessCount", rtn);

        return "redirect:/notice/notice";
    }

    // 삭제
    @RequestMapping(value = "/noticeDelete", method = {RequestMethod.GET, RequestMethod.POST})
    public String noticeDelete(@RequestParam("noNum") int noNum, RedirectAttributes rttr) {
        int rtn = noticeService.delTestBoard(noNum);
        rttr.addFlashAttribute("deleteSuccessCount", rtn);

        return "redirect:/notice/notice";
    }

}