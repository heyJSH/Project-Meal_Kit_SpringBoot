package org.mealkitspringboot.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.mealkitspringboot.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j
@RequestMapping("/notice")
@AllArgsConstructor
public class NoticeController {
    private NoticeService service;
}

    /** 공시 사항 조회 **/
    @GetMapping("/notice")
    public void list(Criteria cri, Model model) {
        log.info("notice");

        List<Eempl>
    }

