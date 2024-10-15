package com.psii.app_produto.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.app_produto.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

}
