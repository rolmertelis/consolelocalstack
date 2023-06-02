package com.rolmer.consoleaws.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("localstack")
public class AwsController {

    @GetMapping
    public String getLocalStack(){
        return "deu certo";
    }
}
