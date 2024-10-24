package com.psii.app_cad_pro.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.psii.app_cad_pro.model.Produto;
import com.psii.app_cad_pro.service.ProdutoService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProdutoController {
    @Autowired
    private ProdutoService produtoService;

    @GetMapping("/cadastrar")
    public String mostrarFormularioCadastro(Model model) {
        model.addAttribute("produtos", new Produto());
        return "cadastrar";
    }

    @PostMapping("/cadastrar")
    public String cadastrarProduto(Produto produto, MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            produto.setImagemBytes(file.getBytes());
        }
        produtoService.salvaProduto(produto);
        return "redirect:/listar";
    }

    @GetMapping("/listar")
    public String listarProdutos(Model model) {
        model.addAttribute("produtos", produtoService.listarProdutos());
        return "listar";
    }

    @GetMapping("/produto/imagem/{id}")
    public ResponseEntity<byte[]> obterImagmeProduto(@PathVariable Long id) {
        Produto produto = produtoService.buscarPorId(id);
        byte[] imagem = produto.getImagemBytes();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);

        return new ResponseEntity<>(imagem, headers, HttpStatus.OK);
    }

    @PostMapping("/produto/deletar/{id}")
    public String deletarProduto(@PathVariable Long id) {
        // TODO: process POST request
        produtoService.deletarPorId(id);
        return "redirect:/listar";
    }

    @GetMapping("/produto/editar/{id}")
    public String mostrarFormularioEdicao(@PathVariable Long id, Model model) {
        Produto produto = produtoService.buscarPorId(id);
        if (produto != null) {
            model.addAttribute("produto", produto);
            return "editar_produto";
        } else {
            return "redirect:/produto/lista";
        }
    }

    @PostMapping("/produto/editar")
    public String editarProduto(@ModelAttribute Produto produto) {
        // TODO: process POST request
        produtoService.salvaProduto(produto);
        return "redirect:/listar";
    }

    @PostMapping("/produto/salvar")
    public String salvarProduto(@ModelAttribute Produto produto, @RequestParam("imagem") MultipartFile imagem) {
        // TODO: process POST request
        if (!imagem.isEmpty()) {
            produto.setImagem(imagem);
        }
        produtoService.salvaProduto(produto);
        return "redirect:/listar";
    }
}
