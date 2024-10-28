package com.psii.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.demo.model.Produto;
import com.psii.demo.repository.PedidoRepository;
import com.psii.demo.repository.ProdutoRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProdutoController {
    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private PedidoRepository pedidoRepository;

    @GetMapping("/cadastro/produto")
    public String showForm(Model model) {
        model.addAttribute("produtos", new Produto());
        return "cad_produto";
    }

    @PostMapping("/cadastro/produto")
    public String saveProduto(Produto produto) {
        // TODO: process POST request
        produtoRepository.save(produto);
        return "redirect:/listar";
    }

    @GetMapping("/listar")
    public String showList(Model model) {
        model.addAttribute("pedidos", pedidoRepository.findAll());
        model.addAttribute("produto", produtoRepository.findAll());
        return "list";
    }

}
