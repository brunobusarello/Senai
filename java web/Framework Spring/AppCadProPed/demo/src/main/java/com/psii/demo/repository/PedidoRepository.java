package com.psii.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.psii.demo.model.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Long> {

}
