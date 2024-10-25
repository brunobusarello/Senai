package com.psii.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.demo.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

}
