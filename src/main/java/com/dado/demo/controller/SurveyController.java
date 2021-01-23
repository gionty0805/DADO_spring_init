package com.dado.demo.controller;

import com.dado.demo.service.SurveyService;
import com.dado.demo.vo.SurveyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 9111665 on 2021-01-20.
 * Description:
 */
@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("/survey")
public class SurveyController {

    SurveyService service;

    @GetMapping("list/{pageVO.page_no}")
    public String surveyList(Model model, SurveyVO vo){
        model.addAttribute("survey", service.getSurveyList(vo));
        return "/survey/list";
    }

    @GetMapping("write")
    public void write(){

    }
}
