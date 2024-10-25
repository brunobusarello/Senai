package com.psii.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.demo.model.Produto;
import com.psii.demo.repository.ProdutoRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProdutoController {
    @Autowired
    private ProdutoRepository produtoRepository;

    @GetMapping("/cadastro/produto")
    public String showForm(Model model) {
        model.addAttribute("produtos", new Produto());
        return "cad_produto";
    }

}
