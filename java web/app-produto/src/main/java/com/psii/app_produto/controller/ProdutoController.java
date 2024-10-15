package com.psii.app_produto.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.app_produto.model.Produto;
import com.psii.app_produto.repository.ProdutoRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/")
public class ProdutoController {
    @Autowired
    public ProdutoRepository produtoRepository;

    @GetMapping("/")
    public String showForm(Model model) {
        List<Produto> produtos = produtoRepository.findAll();
        model.addAttribute("produtos", produtos);
        return "index";
    }

    @GetMapping("/test")
    public String testPage() {
        return "test";
    }

    @PostMapping("/saveProduto")
    public String saveProduct(@ModelAttribute Produto produto) {
        // TODO: process POST request
        produtoRepository.save(produto);
        return "redirect:/";
    }

}
