package com.dado.demo.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;


/**
 * Created by 9111665 on 2021-01-20.
 * Description:
 */
@Getter
@Setter
public class SurveyVO {
    private int survey_id;
    private String sv_name;
    private Date sv_start_dt;
    private Date sv_end_dt;
    private int sv_state;
    private String sv_creater;
    private String creater_nm;
    private Date sv_create_dt;
    private String sv_info;

    private PageVO pageVO = new PageVO();
}
