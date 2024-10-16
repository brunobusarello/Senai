package com.psii.app_prod_ped.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.app_prod_ped.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

}
