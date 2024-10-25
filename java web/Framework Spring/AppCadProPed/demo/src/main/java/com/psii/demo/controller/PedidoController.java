package com.psii.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.demo.model.Pedido;
import com.psii.demo.repository.PedidoRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PedidoController {
    @Autowired
    private PedidoRepository pedidoRepository;

    @GetMapping("/cadastro/pedido")
    public String showForm(Model model) {
        model.addAttribute("pedidos", new Pedido());
        return "cad_pedido";
    }

}
