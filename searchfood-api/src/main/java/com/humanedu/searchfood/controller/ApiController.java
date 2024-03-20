package com.humanedu.searchfood.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/api")
@RestController
public class ApiController {
    // 1. 검색 API(GET)
    @GetMapping("/search")
    public String search(@RequestParam String searchQuery) {
        return "test1";
    }
}
