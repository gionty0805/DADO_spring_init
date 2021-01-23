package com.dado.demo.service;

import com.dado.demo.vo.SurveyVO;

import java.util.List;

/**
 * Created by 9111665 on 2021-01-20.
 * Description:
 */
public interface SurveyService {
    List<SurveyVO> getSurveyList(SurveyVO vo);
}
