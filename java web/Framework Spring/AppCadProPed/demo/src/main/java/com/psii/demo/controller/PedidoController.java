package com.psii.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.demo.model.Pedido;
import com.psii.demo.repository.PedidoRepository;
import com.psii.demo.repository.ProdutoRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class PedidoController {
    @Autowired
    private PedidoRepository pedidoRepository;

    @Autowired
    private ProdutoRepository produtoRepository;

    @GetMapping("/cadastro/pedido")
    public String showForm(Model model) {
        model.addAttribute("produtos", produtoRepository.findAll());
        model.addAttribute("pedidos", new Pedido());
        return "cad_pedido";
    }

    @PostMapping("/cadastro/pedido")
    public String savePedido(Pedido pedido) {
        // TODO: process POST request
        pedidoRepository.save(pedido);
        return "redirect:/listar";
    }

}
