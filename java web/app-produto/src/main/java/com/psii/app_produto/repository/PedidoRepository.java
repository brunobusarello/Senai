package com.psii.app_produto.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.app_produto.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {

}
