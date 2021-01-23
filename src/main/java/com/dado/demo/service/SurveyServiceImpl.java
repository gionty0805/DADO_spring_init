package com.dado.demo.service;

import com.dado.demo.mapper.SurveyMapper;
import com.dado.demo.vo.SurveyVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 9111665 on 2021-01-20.
 * Description:
 */
@Log4j2
@AllArgsConstructor
@Service
public class SurveyServiceImpl implements SurveyService {

    SurveyMapper mapper;

    @Override
    public List<SurveyVO> getSurveyList(SurveyVO vo) {
        return mapper.selectSurveyList(vo);
    }
}
