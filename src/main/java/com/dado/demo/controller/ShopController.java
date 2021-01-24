package com.dado.demo.controller;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by whrhk on 2021-01-23.
 * Description:
 */
@Log4j2
@AllArgsConstructor
@Controller
@RequestMapping("shop")
public class ShopController {

    @GetMapping("main")
    public void main(){

    }



}
