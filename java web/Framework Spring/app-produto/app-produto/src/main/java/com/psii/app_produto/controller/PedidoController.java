package com.psii.app_produto.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.psii.app_produto.model.Pedido;
import com.psii.app_produto.repository.PedidoRepository;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/")
public class PedidoController {
    @Autowired
    private PedidoRepository pedidoRepository;

    @GetMapping("/pedido")
    public String showForm(Model model) {
        model.addAttribute("pedidos", pedidoRepository.findAll());
        return "index";
    }

    @PostMapping("/savePedido")
    public String savePedido(@ModelAttribute Pedido pedido) {
        // TODO: process POST request
        pedidoRepository.save(pedido);
        return "redirect:/";
    }

}
