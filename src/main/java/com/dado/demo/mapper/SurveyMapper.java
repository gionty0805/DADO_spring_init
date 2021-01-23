package com.dado.demo.mapper;

import com.dado.demo.vo.SurveyVO;

import java.util.List;

/**
 * Created by 9111665 on 2021-01-20.
 * Description:
 */
public interface SurveyMapper {
    List<SurveyVO> selectSurveyList(SurveyVO vo);
}
