package com.psii.app_prod_ped.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.psii.app_prod_ped.repository.ProdutoRepository;

@Controller
@RequestMapping("/")
public class ProdutoController {
    @Autowired
    private ProdutoRepository produtoRepository;

}
